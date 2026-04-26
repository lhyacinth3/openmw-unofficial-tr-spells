local self = require('openmw.self')
local nearby = require('openmw.nearby')
local core = require('openmw.core')
local types = require('openmw.types')
local util = require('openmw.util')
local I = require('openmw.interfaces')

local trData = require('scripts.tr_spells.trData')

local v3 = util.vector3

local saveData

local nextUpdate = math.random() * 1.0
local CHECK_INTERVAL = 1.0

local function isValidTarget(effectType)
	if types.Actor.isDead(self) then return false end
	
	if effectType == "creature" and not types.Creature.objectIsInstance(self) then return false end
	if effectType == "humanoid" and not types.NPC.objectIsInstance(self) then return false end
	
	if saveData.distracted then return false end
	
	local combatTarget = I.AI.getActiveTarget("Combat")
	if combatTarget then return false end
	
	local pkg = I.AI.getActivePackage()
	if pkg and pkg.type ~= "Wander" then return false end
	
	return true
end

local function findDestination(range)
	local player = nearby.players[1]
	if not player then return nil end
	
	local agentBounds = types.Actor.getPathfindingAgentBounds(self)
	local bestPos = nil
	local bestScore = 0
	local SAMPLES = 12
	
	for i = 1, SAMPLES do
		local candidate = nearby.findRandomPointAroundCircle(self.position, range, {
			agentBounds = agentBounds,
		})
		if candidate then
			if math.abs(candidate.z - self.position.z) < 384 then
				local playerDist = (candidate - player.position):length()
				local selfDist = (candidate - self.position):length()
				
				local preScore = playerDist + selfDist * 0.25
				if preScore > bestScore * 0.8 then
					local status, path = nearby.findPath(self.position, candidate, {
						agentBounds = agentBounds,
					})
					if status == nearby.FIND_PATH_STATUS.Success then
						local minPathPlayerDist = math.huge
						for _, pt in ipairs(path) do
							local d = (pt - player.position):length()
							if d < minPathPlayerDist then minPathPlayerDist = d end
						end
						local score = playerDist * 0.25 + selfDist * 0.5 + minPathPlayerDist
						if score > bestScore then
							bestScore = score
							bestPos = candidate
						end
					end
				end
			end
		end
	end
	return bestPos
end

local function playVoiceLine(isEnd)
	if types.NPC.objectIsInstance(self) then
		local rec = types.NPC.records[self.recordId]
		local raceRec = types.NPC.races.record(rec.race)
		local lines = trData.DISTRACT_VOICES[raceRec.name]
		if not lines then return end
		
		local genderLines = rec.isMale and lines.male or lines.female
		if not genderLines then return end
		
		local pool = isEnd and genderLines.endLines or genderLines.startLines
		if not pool or #pool == 0 then return end
		
		local path = pool[math.random(#pool)]
		if path then
			core.sound.playSoundFile3d(path, self)
		end
	end
end

local function applyDistract(range)
	local destination = findDestination(range)
	if not destination then return end
	
	local pkg = I.AI.getActivePackage()
	local wanderIdle = nil
	if pkg and pkg.idle then
		wanderIdle = {}
		for k, v in pairs(pkg.idle) do
			wanderIdle[k] = v
		end
	end
	
	saveData.distracted = {
		originPos = { self.position.x, self.position.y, self.position.z },
		originYaw = self.rotation:getYaw(),
		hello = types.Actor.stats.ai.hello(self).base,
		wanderDist = pkg and pkg.distance or 0,
		wanderDur = pkg and pkg.duration or 0,
		wanderIdle = wanderIdle,
		wanderRepeat = pkg and pkg.isRepeat or false,
	}
	
	types.Actor.stats.ai.hello(self).base = 0
	
	if math.random() < 0.45 then playVoiceLine(false) end
	
	I.AI.startPackage{
		type = 'Travel',
		destPosition = destination,
		cancelOther = true,
		isRepeat = false,
	}
end

local function beginReturn()
	if not saveData.distracted then return end
	
	if math.random() < 0.45 then playVoiceLine(true) end
	
	local o = saveData.distracted.originPos
	I.AI.startPackage{
		type = 'Travel',
		destPosition = v3(o[1], o[2], o[3]),
		cancelOther = true,
		isRepeat = false,
	}
	
	saveData.returning = true
end

local function finishReturn()
	if not saveData.distracted then return end
	
	types.Actor.stats.ai.hello(self).base = saveData.distracted.hello
	
	local d = saveData.distracted
	local wanderOpts = {
		type = 'Wander',
		distance = d.wanderDist,
		isRepeat = d.wanderRepeat,
	}
	if d.wanderIdle then
		wanderOpts.idle = d.wanderIdle
	end
	I.AI.startPackage(wanderOpts)
	
	saveData.distracted = nil
	saveData.returning = false
end

local function hasDistractEffect()
	for _, spell in pairs(types.Actor.activeSpells(self)) do
		local spellId = spell.id
		local effectType = trData.DISTRACT_SPELLS[spellId]
		if effectType then
			local mag = 20
			for _, eff in ipairs(spell.effects) do
				if eff.magnitude then
					mag = eff.magnitude
					break
				end
			end
			return true, spellId, effectType, mag
		end
	end
	return false
end

local function onUpdate(dt)
	local now = core.getSimulationTime()
	if now < nextUpdate then return end
	nextUpdate = now + CHECK_INTERVAL
	
	local active, _spellId, effectType, magnitude = hasDistractEffect()
	
	if active and not saveData.distracted then
		if isValidTarget(effectType) then
			applyDistract(magnitude * trData.FEET_TO_UNITS)
		end
	elseif not active and saveData.distracted then
		if not saveData.returning then
			beginReturn()
		else
			local pkg = I.AI.getActivePackage()
			if not pkg or pkg.type ~= "Travel" then
				finishReturn()
			end
		end
	end
end

local function onInactive()
	if saveData and saveData.distracted then
		finishReturn()
	end
end

local function onLoad(data)
	saveData = data or {}
end

local function onSave()
	return saveData
end

return {
	engineHandlers = {
		onUpdate  = onUpdate,
		onInit    = onLoad,
		onLoad    = onLoad,
		onSave    = onSave,
		onInactive = onInactive,
	},
}
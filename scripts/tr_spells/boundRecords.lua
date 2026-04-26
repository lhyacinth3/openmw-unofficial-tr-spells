-- module that generates bound items
-- will have bound item scaling in the future for bound balance enjoyers
local world  = require('openmw.world')
local types  = require('openmw.types')

local M = {}

local cache = nil

function M.init(saveDataCacheTable)
	cache = saveDataCacheTable
end

local function getSkillBucket(actor)
	-- feature currently disabled
	do return 0 end
	if not actor or not actor:isValid() then return 0 end
	if actor.type ~= types.NPC and actor.type ~= types.Player then return 0 end
	local skill = types.NPC.stats.skills.conjuration(actor).modified
	if not skill then return 0 end
	return math.floor(skill)
end

local function buildDraft(baseId)
	local rec = types.Armor.records[baseId]
	if rec then
		return types.Armor, types.Armor.createRecordDraft({ template = rec })
	end
	rec = types.Weapon.records[baseId]
	if rec then
		return types.Weapon, types.Weapon.createRecordDraft({ template = rec })
	end
	rec = types.Clothing.records[baseId]
	if rec then
		return types.Clothing, types.Clothing.createRecordDraft({ template = rec })
	end
	rec = types.Miscellaneous.records[baseId]
	if rec then
		return types.Miscellaneous, types.Miscellaneous.createRecordDraft({ template = rec })
	end
	return nil, nil
end

function M.resolve(actor, baseRecordId)
	local bucket = getSkillBucket(actor)
	local perBase = cache[baseRecordId]
	if not perBase then
		perBase = {}
		cache[baseRecordId] = perBase
	end
	local entry = perBase[bucket]
	if not entry then
		entry = { recordIds = {}, nextIndex = 1 }
		perBase[bucket] = entry
	end
	
	-- stack-prevention
	local inv = types.Actor.inventory(actor)
	local function inInventory(recId)
		local found = inv:find(recId)
		return found and found:isValid()
	end
	
	for _, recId in ipairs(entry.recordIds) do
		if not inInventory(recId) then
			return recId
		end
	end
	
	if #entry.recordIds < 2 then
		local _, draft = buildDraft(baseRecordId)
		if not draft then
			return baseRecordId
		end
		local newRec = world.createRecord(draft)
		entry.recordIds[#entry.recordIds + 1] = newRec.id
		return newRec.id
	end
	
	local idx = entry.nextIndex
	entry.nextIndex = (idx % #entry.recordIds) + 1
	return entry.recordIds[idx]
end

function M.collectKnownRecordIds()
	local set = {}
	if not cache then return set end
	for _, perBase in pairs(cache) do
		for _, entry in pairs(perBase) do
			for _, recId in ipairs(entry.recordIds) do
				set[recId] = true
			end
		end
	end
	return set
end

return M
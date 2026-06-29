-- kills an actor by turning it into a skeleton
-- t_de_uni_staffveloth

if isPlayer then return end

local EFFECT_ID = "t_destruction_gazeofveloth"

G.onMgefAdded[EFFECT_ID] = function(key, eff, activeSpell, entry)
	local caster = activeSpell and activeSpell.caster
	local name = self.type.record(self).name
	
	-- dead - fail
	if types.Actor.isDead(self) then
		table.insert(G.pendingActiveSpellRemovals, activeSpell.activeSpellId)
		return
	end
	
	-- explicitly immune - fail
	if trData.GAZE_VELOTH_IMMUNE[self.recordId:lower()] then
		if caster then
			caster:sendEvent('ShowMessage', { message = name .. " is shielded from the Gaze of Veloth." })
		end
		table.insert(G.pendingActiveSpellRemovals, activeSpell.activeSpellId)
		return
	end
	
	-- creatures - fail
	if not types.NPC.objectIsInstance(self) then
		local id = self.recordId:lower()
		local ctype = types.Creature.record(self).type
		local message
		if id:find("dagoth_ur") then
			message = "The Gaze of Veloth holds no power over one who has worn the Heart."
		elseif ctype == types.Creature.TYPE.Humanoid
			and (id:find("ash_") or id:find("dagoth_") or id:find("corprus_") or id == "ascended_sleeper")
		then
			message = name .. " is too far gone to the Blight for the Gaze to take hold."
		elseif ctype == types.Creature.TYPE.Daedra then
			message = "The Gaze of Veloth cannot unmake the daedra " .. name .. "."
		else
			message = "The Gaze of Veloth only unmakes the flesh of mortals, not " .. name .. "."
		end
		if caster then
			caster:sendEvent('ShowMessage', { message = message })
		end
		table.insert(G.pendingActiveSpellRemovals, activeSpell.activeSpellId)
		return
	end
	
	-- humanoid
	core.sound.playSound3d("destruction hit", self)
	types.Actor.stats.dynamic.health(self).current = 0
	
	core.sendGlobalEvent('TD_GazeOfVeloth', {
		actor  = self.object,
		caster = caster,
		race   = types.NPC.record(self).race:lower(),
	})
	table.insert(G.pendingActiveSpellRemovals, activeSpell.activeSpellId)
end

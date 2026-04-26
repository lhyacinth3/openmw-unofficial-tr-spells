-- Banish Daedra: intercepts a mysticism cast carrying the
-- T_mysticism_banishdae effect, raycasts from the camera to find
-- The target, and fires TD_Banish at them (plus nearby actors if
-- The spell has an area). Adapted from my Banishing mod, which
-- Hooked all Dispel effects.

local banishDebounce = 0

I.SkillProgression.addSkillUsedHandler(function(skillId)
	if skillId ~= "mysticism" then return end
	local spell = types.Player.getSelectedSpell(self)
	if not spell then return end
	for _, effect in pairs(spell.effects) do
		if effect.id == "t_mysticism_banishdae" then
			banishDebounce = core.getRealTime() + 0.05
			async:newUnsavableSimulationTimer(0.05, function()
				if core.getRealTime() < banishDebounce then return end
				
				local cameraPos = camera.getPosition()
				local reach = core.getGMST("iMaxActivateDist") + 0.1 + camera.getThirdPersonDistance()
				local telekinesis = activeEffects:getEffect(core.magic.EFFECT_TYPE.Telekinesis)
				if telekinesis then
					reach = reach + telekinesis.magnitude * trData.FEET_TO_UNITS
				end
				reach = reach + 0.1
				
				local targetPos = cameraPos + camera.viewportToWorldVector(util.vector2(0.5, 0.5)) * reach
				local magnitude = (effect.magnitudeMin + effect.magnitudeMax) / 2
				local area = effect.area or 0
				
				nearby.asyncCastRenderingRay(async:callback(function(res)
					if res.hitObject and types.Actor.objectIsInstance(res.hitObject) then
						res.hitObject:sendEvent("TD_Banish", {
							caster = self.object,
							magnitude = magnitude,
						})
						if area > 0 then
							for _, act in pairs(nearby.actors) do
								if act ~= res.hitObject and (act.position - res.hitPos):length() < area * trData.FEET_TO_UNITS then
									act:sendEvent("TD_Banish", {
										caster = self.object,
										magnitude = magnitude,
									})
								end
							end
						end
					elseif area > 0 then
						-- No direct hit but we have an area; blast at the aim point
						local areaRec = effect.effect.areaStatic and types.Static.records[effect.effect.areaStatic]
						if areaRec then
							core.sendGlobalEvent('SpawnVfx', {
								model = areaRec.model,
								position = targetPos,
								options = { scale = area * 1.1 },
							})
						end
						for _, act in pairs(nearby.actors) do
							if (act.position - targetPos):length() < area * trData.FEET_TO_UNITS then
								act:sendEvent("TD_Banish", {
									caster = self.object,
									magnitude = magnitude,
									showVfx = true,
								})
							end
						end
					end
				end), cameraPos, targetPos, { ignore = self })
			end)
			return
		end
	end
end)

------------------------- MWE -------------------------

--G.regEffect("t_mysticism_banishdae", "td_s_ban_daedra", "Banish Daedra", "mysticism", false, true, "LEVEL")
--G.overrideSpell("t_com_mys_banishdaedra", "t_mysticism_banishdae", "Touch", 0, 0, 10, 10)

-- Resartus: instant armor/weapon repair. Fires a global event
-- With the per-effect magnitude; actual repair logic lives in
-- TrGlobal.

G.onMgefTick["t_restoration_armorresartus"] = function(key, eff, activeSpell, entry, interval)
	local mag = eff.magnitudeThisFrame * interval
	if math.random() < mag%1 then
		mag = mag + 1
	end
	core.sendGlobalEvent('TD_Resartus', {
		actor = self,
		kind = "armor",
		magnitude = math.floor(mag),
	})
end

G.onMgefTick["t_restoration_weaponresartus"] = function(key, eff, activeSpell, entry, interval)
	local mag = eff.magnitudeThisFrame * interval
	if math.random() < mag%1 then
		mag = mag + 1
	end
	core.sendGlobalEvent('TD_Resartus', {
		actor = self,
		kind = "weapon",
		magnitude = math.floor(mag),
	})
end

------------------------- MWE -------------------------
-- 
-- G.regEffect("t_restoration_armorresartus",  "td_s_restore_ar",  "Armor Resartus",  "restoration", false, true, "POINTS")
-- G.regEffect("t_restoration_weaponresartus", "td_s_restore_wpn", "Weapon Resartus", "restoration", false, true, "POINTS")
-- 
-- G.overrideSpell("t_com_res_armorresartus",  "t_restoration_armorresartus",  "Self", 0, 0, 20, 40)
-- G.overrideSpell("t_com_res_weaponresartus", "t_restoration_weaponresartus", "Self", 0, 0, 10, 20)

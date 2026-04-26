--[[
Configure settings for Unofficial TR spells here 
- adjusting magicka cost of spell effects,
- Blink VFX config
- Toggle Illegal Daedra
]]

--[[ 
OpenMW has an engine feature where spell effects cost more than in MWSE
The formulas for the spell effects in this mod are implemented as closely as possible,
but if you're coming from MWSE and are surprised as the difference in spell costs you can
change them here
]]

GLOBAL_EFFECT_COST_MULT = 1.0

EFFECT_COST_INSIGHT = 10
EFFECT_COST_ARMOR_RESARTUS = 60
EFFECT_COST_WEAPON_RESARTUS = 120
EFFECT_COST_BANISH_DAE = 128
EFFECT_COST_REFLECT = 20
EFFECT_COST_RADIANT_SHIELD = 5
EFFECT_COST_BLINK = 10
EFFECT_COST_PASSWALL = 750
EFFECT_COST_DISTRACT_CREATURE = 0.5
EFFECT_COST_DISTRACT_HUMANOID = 1
EFFECT_COST_FORTCAST = 2

--[[ Blink VFX
There are a few presets for Blink VFX to help you not teleport into walls
and need to use the tcl console command to get out
But if you want to change the vfx you can do that here.
To disable the blink preview VFX, set BLINK_PREVIEW_VFX_PRESET to 0.
]]
if isPlayer then
	
	BLINK_PREVIEW_VFX_PRESET = 2 -- 0 to disable, 1 for testing, 2 for the orb + smoke + circle (default), 3 for default but with a different ground circle
	
	if BLINK_PREVIEW_VFX_PRESET == 0 then
	
		BLINK_PREVIEW_VFX_MODEL = nil
		BLINK_PREVIEW_VFX_MODEL = nil
		BLINK_PREVIEW_VFX_OFFSET = nil
		BLINK_PREVIEW_VFX_SCALE = nil
		
	elseif BLINK_PREVIEW_VFX_PRESET == 1 then
	
		BLINK_PREVIEW_VFX_MODEL = "meshes/tr_spells/blink_pillar.NIF"
		BLINK_PREVIEW_VFX_MODEL = "meshes/tr_spells/blink_pillar2.NIF"
		BLINK_PREVIEW_VFX_OFFSET = v3(0,0,-0)
		BLINK_PREVIEW_VFX_SCALE = 0.55
	
	elseif BLINK_PREVIEW_VFX_PRESET == 2 then
	
		BLINK_PREVIEW_VFX_MODEL = "meshes/w/magic_target_myst.NIF"
		BLINK_PREVIEW_VFX_OFFSET = v3(0,0,130)
		BLINK_PREVIEW_VFX_OFFSET_GROUND = v3(0,0,114)
		BLINK_PREVIEW_VFX_SCALE = 1
		
		BLINK_PREVIEW_VFX_MODEL2 = "meshes/e/magic_cast_restore.NIF"
		BLINK_PREVIEW_VFX_OFFSET2 = v3(0,0,0)
		BLINK_PREVIEW_VFX_SCALE2 = 1
		
	elseif BLINK_PREVIEW_VFX_PRESET == 3 then -- same as 2 but with different ground circle
	
		BLINK_PREVIEW_VFX_MODEL = "meshes/w/magic_target_myst.NIF"
		BLINK_PREVIEW_VFX_OFFSET = v3(0,0,130)
		BLINK_PREVIEW_VFX_OFFSET_GROUND = v3(0,0,114)
		BLINK_PREVIEW_VFX_SCALE = 1
		
		BLINK_PREVIEW_VFX_MODEL2 = "meshes/e/magic_cast_alt.NIF"
		BLINK_PREVIEW_VFX_OFFSET2 = v3(0,0,0)
		BLINK_PREVIEW_VFX_SCALE2 = 1
	end
end

--[[ Illegal Daedra
In MWSE and in the summon spells' magic effect description, it is illegal to summon deadra in towns.
But for testing and for fun, illegal summoning wasn't shipped with this mod's initial release.
You can toggle it on here - false = off, true = on
]]

ILLEGAL_DAEDRA_TOGGLE = false
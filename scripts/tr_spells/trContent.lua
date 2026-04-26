local content = require('openmw.content')
local trData = require('scripts.tr_spells.trData')
require('scripts.tr_spells.SETTINGS')

if content.magicEffects.records["t_summon_devourer"]
	or content.magicEffects.records["t_bound_greatsword"]
	or content.magicEffects.records["t_mysticism_reflectdmg"]
	or content.magicEffects.records["t_alteration_radshield"]
then
	return
end

-- =====================================================
-- HELPERS
-- =====================================================

local function defineEffect(id, name, template, baseCost, icon, extras)
	content.magicEffects.records[id] = {
		template = content.magicEffects.records[template],
		name = name,
		baseCost = math.floor(baseCost * GLOBAL_EFFECT_COST_MULT),
		icon = icon,
	}
	if extras then
		for a,b in pairs(extras) do
			content.magicEffects.records[id][a] = b
		end
	end
end

local function defineSelfSpell(id, effectId, name, cost, duration, magnitude)
	content.spells.records[id] = {
		name = name,
		type = content.spells.TYPE.Spell,
		cost = cost,
		isAutocalc = false,	
		effects = {
			{
				id = effectId,
				range = content.RANGE.Self,
				area = 0,
				duration = duration,
				magnitudeMin = magnitude or 1,
				magnitudeMax = magnitude or 1,
			},
		},
	}
end

local function defineSpell(id, record)
	if record.isAutocalc == nil then record.isAutocalc = false end
	content.spells.records[id] = record
end

-- =====================================================
-- SUMMON EFFECTS
-- =====================================================

defineEffect("t_summon_devourer",          "Summon Devourer",             "summondremora",           52, "td/s/td_s_summ_dev.dds")
defineEffect("t_summon_dremarch",          "Summon Dremora Archer",       "summondremora",           33, "td/s/td_s_sum_drm_arch.dds")
defineEffect("t_summon_dremcast",          "Summon Dremora Caster",       "summondremora",           31, "td/s/td_s_sum_drm_mage.dds")
defineEffect("t_summon_guardian",          "Summon Guardian",             "summongoldensaint",       69, "td/s/td_s_sum_guard.dds")
defineEffect("t_summon_lesserclfr",        "Summon Lesser Clannfear",     "summonclannfear",         19, "td/s/td_s_sum_lsr_clan.dds")
defineEffect("t_summon_ogrim",             "Summon Ogrim",                "summondaedroth",          33, "td/s/td_s_summ_ogrim.dds")
defineEffect("t_summon_seducer",           "Summon Seducer",              "summongoldensaint",       52, "td/s/td_s_summ_sed.dds")
defineEffect("t_summon_seducerdark",       "Summon Dark Seducer",         "summongoldensaint",       75, "td/s/td_s_summ_d_sed.dds")
defineEffect("t_summon_vermai",            "Summon Vermai",               "summonclannfear",         29, "td/s/td_s_summ_vermai.dds")
defineEffect("t_summon_atrostormmon",      "Summon Storm Monarch",        "summonstormatronach",     60, "td/s/td_s_sum_stm_monch.dds")
defineEffect("t_summon_icewraith",         "Summon Ice Wraith",           "summonfrostatronach",     35, "td/s/td_s_sum_ice_wrth.dds")
defineEffect("t_summon_dwespectre",        "Summon Dwarven Spectre",      "summonancestralghost",    17, "td/s/td_s_sum_dwe_spctre.dds")
defineEffect("t_summon_steamcent",         "Summon Steam Centurion",      "summoncenturionsphere",   29, "td/s/td_s_sum_dwe_cent.dds")
defineEffect("t_summon_spidercent",        "Summon Spider Centurion",     "summoncenturionsphere",   15, "td/s/td_s_sum_dwe_spdr.dds")
defineEffect("t_summon_welkyndspirit",     "Summon Welkynd Spirit",       "summonancestralghost",    29, "td/s/td_s_sum_welk_srt.dds")
defineEffect("t_summon_auroran",           "Summon Auroran",              "summongoldensaint",       46, "td/s/td_s_sum_auro.dds")
defineEffect("t_summon_herne",             "Summon Herne",                "summonscamp",             18, "td/s/td_s_sum_herne.dds")
defineEffect("t_summon_morphoid",          "Summon Morphoid",             "summonscamp",             21, "td/s/td_s_sum_morph.dds")
defineEffect("t_summon_draugr",            "Summon Draugr",               "summonskeletalminion",    29, "td/s/td_s_sum_draugr.dds")
defineEffect("t_summon_spriggan",          "Summon Spriggan",             "summonfabricant",         48, "td/s/td_s_sum_sprig.dds")
defineEffect("t_summon_boneldgr",          "Summon Greater Bonelord",     "summonbonelord",          71, "td/s/td_s_sum_gtr_bnlrd.dds")
defineEffect("t_summon_ghost",             "Summon Ghost",                "summonancestralghost",     7, "td/s/td_s_summ_ghost.dds")
defineEffect("t_summon_wraith",            "Summon Wraith",               "summonancestralghost",    49, "td/s/td_s_summ_wraith.dds")
defineEffect("t_summon_barrowguard",       "Summon Barrowguard",          "summongreaterbonewalker", 11, "td/s/td_s_summ_brwgurd.dds")
defineEffect("t_summon_minobarrowguard",   "Summon Minotaur Barrowguard", "summongreaterbonewalker", 57, "td/s/td_s_summ_mintur.dds")
defineEffect("t_summon_skeletonchampion",  "Summon Skeleton Champion",    "summonskeletalminion",    32, "td/s/td_s_sum_skele_c.dds")
defineEffect("t_summon_atrofrostmon",      "Summon Frost Monarch",        "summonfrostatronach",     47, "td/s/td_s_sum_fst_monch.dds")
defineEffect("t_summon_spiderdaedra",      "Summon Spider Daedra",        "summondaedroth",          42, "td/s/td_s_sum_spidr_dae.dds")

-- =====================================================
-- BOUND EFFECTS
-- =====================================================

defineEffect("t_bound_greaves",    "Bound Greaves",    "boundboots",     2, "td/s/td_s_bnd_grves.dds")
defineEffect("t_bound_waraxe",     "Bound War Axe",    "boundbattleaxe", 2, "td/s/td_s_bnd_waxe.dds")
defineEffect("t_bound_warhammer",  "Bound Warhammer",  "boundmace",      2, "td/s/td_s_bnd_wham.dds")
defineEffect("t_bound_pauldrons",  "Bound Pauldrons",  "boundhelm",      2, "td/s/td_s_bnd_pldrn.dds")
defineEffect("t_bound_greatsword", "Bound Greatsword", "boundlongsword", 2, "td/s/td_s_bnd_clymr.dds")
defineEffect("t_bound_hammerresdayn", "Bound Hammer (Resdayn)", "boundmace",      2, "td/s/td_s_bnd_res_ham.dds")
defineEffect("t_bound_razorresdayn",  "Bound Razor (Resdayn)",  "boundlongsword", 2, "td/s/td_s_bnd_red_razor.dds")

-- =====================================================
-- MISC EFFECTS
-- =====================================================

defineEffect("t_intervention_kyne", "Kyne's Intervention", "divineintervention", 150, "td/s/td_s_int_kyne.tga", {hasDuration = false, hasMagnitude = false})
content.statics.records["TRSU_emptyStatic"] = {model = "meshes/tr_spells/none.nif"}
defineEffect("t_mysticism_blink", "Blink", "telekinesis", EFFECT_COST_BLINK, "td/s/td_s_blink.tga", { onTouch = true, onTarget = true, hasDuration = false, hasMagnitude = true, school = "mysticism",
    --castStatic= "TRSU_emptyStatic",--"meshes/tr_spells/none.nif",--content.statics.records["VFX_MysticismCast"].model,
    bolt= "VFX_MysticismBolt",
    hitStatic= "TRSU_emptyStatic",--"meshes/tr_spells/none.nif",--content.statics.records["VFX_MysticismHit"].model,
    --areaStatic= "TRSU_emptyStatic",--"meshes/tr_spells/none.nif",--content.statics.records["VFX_MysticismArea"].model,
})
defineEffect("t_mysticism_passwall", "Passwall", "detectenchantment", EFFECT_COST_PASSWALL, "td/s/td_s_passwall.tga", {hasDuration = false, onTouch = false, onTarget = false})
defineEffect("t_mysticism_insight", "Insight", "detectenchantment", EFFECT_COST_INSIGHT, "td/s/td_s_insight.tga", {onTouch = false, onTarget = false})
defineEffect("t_mysticism_reflectdmg", "Reflect Damage", "reflect", EFFECT_COST_REFLECT, "td/s/td_s_ref_dam.tga")
defineEffect("t_restoration_fortifycasting", "Fortify Casting", "fortifyattack", EFFECT_COST_FORTCAST, "td/s/td_s_ftfy_cast.tga")
defineEffect("t_alteration_radshield", "Radiant Shield", "shield", EFFECT_COST_RADIANT_SHIELD, "td/s/td_s_radiant_shield.tga", {hitStatic = "T_VFX_RadiantShieldHit"})
defineEffect("t_restoration_armorresartus",  "Armor Resartus",  "restorehealth", EFFECT_COST_ARMOR_RESARTUS,  "td/s/td_s_restore_ar.tga")
defineEffect("t_restoration_weaponresartus", "Weapon Resartus", "restorehealth", EFFECT_COST_WEAPON_RESARTUS, "td/s/td_s_restore_wpn.tga")
defineEffect("t_illusion_distractcreature", "Distract Creature", "chameleon", EFFECT_COST_DISTRACT_CREATURE, "td/s/td_s_dist_cre.tga")
defineEffect("t_illusion_distracthumanoid", "Distract Humanoid", "chameleon", EFFECT_COST_DISTRACT_HUMANOID, "td/s/td_s_dist_hum.tga")
defineEffect("t_mysticism_banishdae", "Banish Daedra", "dispel", EFFECT_COST_BANISH_DAE, "td/s/td_s_ban_daedra.tga", {school = "mysticism", unreflectable = true})
--defineEffect("t_destruction_gazeofveloth", "Gaze of Veloth", "damagehealth", 80, "td/s/td_s_gaze_veloth.tga")
--defineEffect("t_conjuration_sanguinerose", "Sanguine Rose", "summondaedroth", 40, "td/s/td_s_sanguine.tga")

-- =====================================================
-- SUMMON SPELLS
-- =====================================================

defineSelfSpell("t_com_cnj_summondevourer",        "t_summon_devourer",         "Summon Devourer",             156, 60)
defineSelfSpell("t_com_cnj_summondremoraarcher",   "t_summon_dremarch",         "Summon Dremora Archer",        98, 60)
defineSelfSpell("t_com_cnj_summondremoracaster",   "t_summon_dremcast",         "Summon Dremora Caster",        93, 60)
defineSelfSpell("t_com_cnj_summonguardian",        "t_summon_guardian",         "Summon Guardian",             155, 45)
defineSelfSpell("t_com_cnj_summonlesserclannfear", "t_summon_lesserclfr",       "Summon Lesser Clannfear",      57, 60)
defineSelfSpell("t_com_cnj_summonogrim",           "t_summon_ogrim",            "Summon Ogrim",                 99, 60)
defineSelfSpell("t_com_cnj_summonseducer",         "t_summon_seducer",          "Summon Seducer",              156, 60)
defineSelfSpell("t_com_cnj_summonseducerdark",     "t_summon_seducerdark",      "Summon Dark Seducer",         169, 45)
defineSelfSpell("t_com_cnj_summonvermai",          "t_summon_vermai",           "Summon Vermai",                88, 60)
defineSelfSpell("t_com_cnj_summonstormmonarch",    "t_summon_atrostormmon",     "Summon Storm Monarch",        180, 60)
defineSelfSpell("t_nor_cnj_summonicewraith",       "t_summon_icewraith",        "Summon Ice Wraith",           105, 60)
defineSelfSpell("t_dwe_cnj_uni_summondwespectre",  "t_summon_dwespectre",       "Summon Dwarven Spectre",       52, 60)
defineSelfSpell("t_dwe_cnj_uni_summonsteamcent",   "t_summon_steamcent",        "Summon Steam Centurion",       88, 60)
defineSelfSpell("t_dwe_cnj_uni_summonspidercent",  "t_summon_spidercent",       "Summon Spider Centurion",      45, 60)
defineSelfSpell("t_ayl_cnj_summonwelkyndspirit",   "t_summon_welkyndspirit",    "Summon Welkynd Spirit",        78, 60)
defineSelfSpell("t_com_cnj_summonauroran",         "t_summon_auroran",          "Summon Auroran",              138, 60)
defineSelfSpell("t_com_cnj_summonherne",           "t_summon_herne",            "Summon Herne",                 54, 60)
defineSelfSpell("t_com_cnj_summonmorphoid",        "t_summon_morphoid",         "Summon Morphoid",              63, 60)
defineSelfSpell("t_nor_cnj_summondraugr",          "t_summon_draugr",           "Summon Draugr",                78, 60)
defineSelfSpell("t_nor_cnj_summonspriggan",        "t_summon_spriggan",         "Summon Spriggan",             144, 60)
defineSelfSpell("t_de_cnj_summongreaterbonelord",  "t_summon_boneldgr",         "Summon Greater Bonelord",     160, 45)
defineSelfSpell("t_cyr_cnj_summonghost",           "t_summon_ghost",            "Summon Ghost",                 21, 60)
defineSelfSpell("t_cyr_cnj_summonwraith",          "t_summon_wraith",           "Summon Wraith",               147, 60)
defineSelfSpell("t_cyr_cnj_summonbarrowguard",     "t_summon_barrowguard",      "Summon Barrowguard",           33, 60)
defineSelfSpell("t_cyr_cnj_summonminobarrowguard", "t_summon_minobarrowguard",  "Summon Minotaur Barrowguard", 171, 60)
defineSelfSpell("t_com_cnj_summonskeletonchamp",   "t_summon_skeletonchampion", "Summon Skeleton Champion",     96, 60)
defineSelfSpell("t_com_cnj_summonfrostmonarch",    "t_summon_atrofrostmon",     "Summon Frost Monarch",        141, 60)
defineSelfSpell("t_com_cnj_summonspiderdaedra",    "t_summon_spiderdaedra",     "Summon Spider Daedra",        126, 60)

defineSelfSpell("t_cr_cnj_aylsorcksummon1", "t_summon_auroran",       nil, 40, 40)
defineSelfSpell("t_cr_cnj_aylsorcksummon3", "t_summon_welkyndspirit", nil, 25, 40)

-- =====================================================
-- BOUND SPELLS
-- =====================================================

defineSelfSpell("t_com_cnj_boundgreaves",    "t_bound_greaves",    "Bound Greaves",    6, 60)
defineSelfSpell("t_com_cnj_boundwaraxe",     "t_bound_waraxe",     "Bound War Axe",    6, 60)
defineSelfSpell("t_com_cnj_boundwarhammer",  "t_bound_warhammer",  "Bound Warhammer",  6, 60)
defineSelfSpell("t_com_cnj_boundpauldron",   "t_bound_pauldrons",  "Bound Pauldrons",  6, 60)
defineSelfSpell("t_com_cnj_boundgreatsword", "t_bound_greatsword", "Bound Greatsword", 6, 60)

defineSelfSpell("t_de_cnj_uni_boundhammerresdayn", "t_bound_hammerresdayn", nil, 6, 60)
defineSelfSpell("t_de_cnj_uni_boundrazororesdayn", "t_bound_razorresdayn",  nil, 6, 60)

-- =====================================================
-- MISC SPELLS
-- =====================================================

defineSelfSpell("t_nor_mys_kynesintervention", "t_intervention_kyne", "Kyne's Intervention",  8, 0)
defineSelfSpell("t_com_mys_blink", "t_mysticism_blink", "Blink", math.floor(EFFECT_COST_BLINK * 2.5), 0, 50) 
defineSelfSpell("t_com_mys_uni_passwall", "t_mysticism_passwall", "Passwall", math.floor(EFFECT_COST_PASSWALL * 0.128), 1, 25) 
defineSelfSpell("t_com_mys_insight", "t_mysticism_insight", "Insight", math.floor(EFFECT_COST_INSIGHT*7.6), 10, 15)  
defineSpell("t_uni_sainttelynblessing", {
	type = content.spells.TYPE.Ability,
	effects = {
		{
			id = "t_mysticism_insight",
			range = content.RANGE.Self,
			duration = 0,
			magnitudeMin = 10,
			magnitudeMax = 10,
		},
	},
})

defineSelfSpell("t_ayl_alt_radiantshield", "t_alteration_radshield", "Radiant Shield", EFFECT_COST_RADIANT_SHIELD * 15, 30, 10) 

defineSpell("t_cr_alt_auroranshield", {
	type = content.spells.TYPE.Ability,
	effects = {
		{
			id = "t_alteration_radshield",
			range = content.RANGE.Self,
			duration = 0,
			magnitudeMin = 20,
			magnitudeMax = 20,
		},
	},
})

defineSpell("t_cr_alt_aylsorcklightshield", {
	name = "Radiant Shield",
	type = content.spells.TYPE.Spell,
	cost = EFFECT_COST_RADIANT_SHIELD * 2,
	effects = {
		{
			id = "t_alteration_radshield",
			range = content.RANGE.Self,
			duration = 12,
			magnitudeMin = 10,
			magnitudeMax = 10,
		},
		{
			id = "Light",
			range = content.RANGE.Self,
			duration = 12,
			magnitudeMin = 20,
			magnitudeMax = 20,
		},
	},
})

local blindEffects = {}
for i = 0, 6 do
	local mag = 2 ^ i
	blindEffects[i + 1] = {
		id = "Blind",
		range = content.RANGE.Self,
		area = 0,
		duration = 2,
		magnitudeMin = mag,
		magnitudeMax = mag,
	}
end

defineSpell("t_alteration_radshield_blind", {
	type = content.spells.TYPE.Spell,
	cost = 0,
	effects = blindEffects,
})

defineSpell("t_com_mys_reflectdamage", {
	name = "Reflect Damage",
	type = content.spells.TYPE.Spell,
	cost = math.floor(EFFECT_COST_REFLECT * 3.8), 
	effects = {
		{
			id = "t_mysticism_reflectdmg",
			range = content.RANGE.Self,
			duration = 5,
			magnitudeMin = 10,
			magnitudeMax = 20,
		},
	},
})

defineSpell("t_com_mys_banishdaedra", {
	name = "Banish Daedra",
	type = content.spells.TYPE.Spell,
	cost = math.floor(EFFECT_COST_BANISH_DAE * 0.5), 
	effects = {
		{
			id = "t_mysticism_banishdae",
			range = content.RANGE.Touch,
			duration = 1,
			magnitudeMin = 10,
			magnitudeMax = 10,
		},
	},
})

defineSpell("t_com_res_armorresartus", {
	name = "Armor Resartus",
	type = content.spells.TYPE.Spell,
	cost = math.floor(EFFECT_COST_ARMOR_RESARTUS*1.5), 
	effects = {
		{
			id = "t_restoration_armorresartus",
			range = content.RANGE.Self,
			duration = 1,
			magnitudeMin = 20,
			magnitudeMax = 40,
		},
	},
})

defineSpell("t_com_res_weaponresartus", {
	name = "Weapon Resartus",
	type = content.spells.TYPE.Spell,
	cost = math.floor(EFFECT_COST_WEAPON_RESARTUS * 0.75), 
	effects = {
		{
			id = "t_restoration_weaponresartus",
			range = content.RANGE.Self,
			duration = 1,
			magnitudeMin = 10,
			magnitudeMax = 20,
		},
	},
})

defineSpell("t_com_ilu_distractcreature", {
	name = "Distract Creature",
	type = content.spells.TYPE.Spell,
	cost = math.floor(EFFECT_COST_DISTRACT_CREATURE * 22), 
	effects = {
		{
			id = "t_illusion_distractcreature",
			range = content.RANGE.Target,
			duration = 15,
			magnitudeMin = 20,
			magnitudeMax = 20,
		},
	},
})

defineSpell("t_com_ilu_distracthumanoid", {
	name = "Distract Humanoid",
	type = content.spells.TYPE.Spell,
	cost = EFFECT_COST_DISTRACT_HUMANOID * 22, 
	effects = {
		{
			id = "t_illusion_distracthumanoid",
			range = content.RANGE.Target,
			duration = 15,
			magnitudeMin = 20,
			magnitudeMax = 20,
		},
	},
})

-- =====================================================
-- ENCHANTMENTS
-- =====================================================

-- veloth's r pauldron: constant reflect damage 30pt on self
content.enchantments.records["t_const_velothspauld_r"] = {
	type = content.enchantments.TYPE.ConstantEffect,
	charge = 0,
	cost = 0,
	effects = {
		{
			id = "t_mysticism_reflectdmg",
			range = content.RANGE.Self,
			area = 0,
			duration = 1,
			magnitudeMin = 30,
			magnitudeMax = 30,
		},
	},
}

-- right bracer of bifurcation, item id: t_imp_uni_bracerr_bifurication
content.enchantments.records["t_const_spell_bifurcation"] = {
	type = content.enchantments.TYPE.ConstantEffect,
	charge = 0,
	cost = 0,
	effects = {
		{
			id = "t_restoration_fortifycasting",
			range = content.RANGE.Self,
			area = 0,
			duration = 1,
			magnitudeMin = 20,
			magnitudeMax = 20,
		},
	},
}

-- return to later after recovering from MWSE's gaze of veloth
--[[ 
-- ring of namira: reflect damage 30pts, this is just 1 of 2 effects
content.enchantments.records["t_const_ring_namira"] = {
	type = content.enchantments.TYPE.ConstantEffect,
	charge = 0,
	cost = 0,
	effects = {
		{
			id = "t_mysticism_reflectdmg",
			range = content.RANGE.Self,
			area = 0,
			duration = 1,
			magnitudeMin = 30,
			magnitudeMax = 30,
		},
	},
}

content.enchantments.records["t_strike_staffveloth"] = {
	type = content.enchantments.TYPE.CastOnUse,
	charge = 900,
	cost = 300,
	effects = {
		{
			id = "t_destruction_gazeofveloth",
			range = content.RANGE.Target,
			area = 0,
			duration = 0,
			magnitudeMin = 250,
			magnitudeMax = 250,
		},
	},
}

content.enchantments.records["tr_m1_sanguinesrose_en"] = {
	type = content.enchantments.TYPE.CastOnUse,
	charge = 480,
	cost = 96,
	effects = {
		{
			id = "t_conjuration_sanguinerose",
			range = content.RANGE.Self,
			area = 0,
			duration = 60,
			magnitudeMin = 1,
			magnitudeMax = 1,
		},
	},
}
]]
-- =====================================================
-- SPELL TOMES
-- =====================================================

local tomeAssets = {
	alt = {
		icon = "icons/tr_spells/st_alteration.dds",
		mesh = "meshes/tr_spells/alteration_1.nif",
	},
	conj = {
		icon = "icons/tr_spells/st_conjuration.dds",
		mesh = "meshes/tr_spells/conjuration_1.nif",
	},
	ilu = {
		icon = "icons/tr_spells/st_illusion.dds",
		mesh = "meshes/tr_spells/illusion_1.nif",
	},
	rest = {
		icon = "icons/tr_spells/st_restoration.dds",
		mesh = "meshes/tr_spells/restoration_1.nif",
	},
	myst = {
		icon = "icons/tr_spells/st_mysticism.dds",
		mesh = "meshes/tr_spells/mysticism_1.nif",
	},
}

local function buildTomeText(tomeId)
	for _, tomeDef in ipairs(trData.TOME_DEFS) do
		if tomeDef.tomeId == tomeId then
			local lines = { "<p>This tome contains records of the following spells:<br><p>" }
			for _, spellId in ipairs(tomeDef.spells) do
				local spell = content.spells.records[spellId]
				if spell and spell.name then
					lines[#lines + 1] = "- " .. spell.name .. "<br>"
				end
			end
			return table.concat(lines, "")
		end
	end
	return ""
end

local function defineTome(id, name, school)
	local assets = tomeAssets[school]
	if not assets then return end
	content.books.records[id] = {
		name = name,
		model = assets.mesh,
		icon = assets.icon,
		weight = 0.2,
		value = 75,
		isScroll = false,
		text = buildTomeText(id),
	}
end

defineTome("spelltome_tr_conj_bound",  "Spell Tome: Bound",       "conj")
defineTome("spelltome_tr_conj_summon", "Spell Tome: Summon",      "conj")
defineTome("spelltome_tr_myst",        "Spell Tome: Mysticism",   "myst")
defineTome("spelltome_tr_rest",        "Spell Tome: Restoration", "rest")
defineTome("spelltome_tr_alt",         "Spell Tome: Alteration",  "alt")
defineTome("spelltome_tr_ilu",         "Spell Tome: Illusion",    "ilu")

-- =====================================================
-- TESTING SPELLS
-- =====================================================

defineSpell("t_test_boundarmor", {
	name = "Test: Bound Armor",
	type = content.spells.TYPE.Spell,
	cost = 0,
	effects = {
		{ id = "boundboots",      range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "boundcuirass",    range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "boundgloves",     range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "boundhelm",       range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "boundshield",     range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_bound_greaves", range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_bound_pauldrons", range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
	},
})

defineSpell("t_test_summonall", {
	name = "Test: Summon All",
	type = content.spells.TYPE.Spell,
	cost = 0,
	effects = {
		{ id = "t_summon_devourer",         range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_dremarch",         range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_dremcast",         range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_guardian",         range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_lesserclfr",       range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_ogrim",            range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_seducer",          range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_seducerdark",      range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_vermai",           range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_atrostormmon",     range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_icewraith",        range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_dwespectre",       range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_steamcent",        range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		--{ id = "t_summon_spidercent",       range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_welkyndspirit",    range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_auroran",          range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_herne",            range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_morphoid",         range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_draugr",           range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_spriggan",         range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_boneldgr",         range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_ghost",            range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_wraith",           range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_barrowguard",      range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_minobarrowguard",  range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_skeletonchampion", range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_atrofrostmon",     range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
		{ id = "t_summon_spiderdaedra",     range = content.RANGE.Self, duration = 60, magnitudeMin = 1, magnitudeMax = 1 },
	},
})
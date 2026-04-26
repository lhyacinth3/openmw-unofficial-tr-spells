local data = {}

data.FEET_TO_UNITS = 22.1

-- effect ID -> creature ID 
data.SUMMON_CREATURES = {
	["t_summon_devourer"]          = "t_dae_cre_devourer_01",
	["t_summon_dremarch"]          = "t_dae_cre_drem_arch_01",
	["t_summon_dremcast"]          = "t_dae_cre_drem_cast_01",
	["t_summon_guardian"]          = "t_dae_cre_guardian_01",
	["t_summon_lesserclfr"]        = "t_dae_cre_lesserclfr_01",
	["t_summon_ogrim"]             = "ogrim",
	["t_summon_seducer"]           = "t_dae_cre_seduc_01",
	["t_summon_seducerdark"]       = "t_dae_cre_seducdark_02",
	["t_summon_vermai"]            = "t_dae_cre_verm_01",
	["t_summon_atrostormmon"]      = "t_dae_cre_monarchst_01",
	["t_summon_icewraith"]         = "t_sky_cre_icewr_01",
	["t_summon_dwespectre"]        = "dwarven ghost",
	["t_summon_steamcent"]         = "centurion_steam",
	["t_summon_spidercent"]        = "centurion_spider",
	["t_summon_welkyndspirit"]     = "t_ayl_cre_welkspr_01",
	["t_summon_auroran"]           = "t_dae_cre_auroran_01",
	["t_summon_herne"]             = "t_dae_cre_herne_01",
	["t_summon_morphoid"]          = "t_dae_cre_morphoid_01",
	["t_summon_draugr"]            = "t_sky_und_drgr_01",
	["t_summon_spriggan"]          = "t_sky_cre_spriggan_01",
	["t_summon_boneldgr"]          = "t_mw_und_boneldgr_01",
	["t_summon_ghost"]             = "t_cyr_und_ghst_01",
	["t_summon_wraith"]            = "t_cyr_und_wrth_01",
	["t_summon_barrowguard"]       = "t_cyr_und_mum_01",
	["t_summon_minobarrowguard"]   = "t_cyr_und_minobarrow_01",
	["t_summon_skeletonchampion"]  = "t_glb_und_skelcmpgls_01",
	["t_summon_atrofrostmon"]      = "t_dae_cre_monarchfr_01",
	["t_summon_spiderdaedra"]      = "t_dae_cre_spiderdae_01",
}

-- spell ID -> magic effect
data.SUMMON_EFFECTS = {
	["t_com_cnj_summondevourer"]          = "t_summon_devourer",
	["t_com_cnj_summondremoraarcher"]     = "t_summon_dremarch",
	["t_com_cnj_summondremoracaster"]     = "t_summon_dremcast",
	["t_com_cnj_summonguardian"]          = "t_summon_guardian",
	["t_com_cnj_summonlesserclannfear"]   = "t_summon_lesserclfr",
	["t_com_cnj_summonogrim"]             = "t_summon_ogrim",
	["t_com_cnj_summonseducer"]           = "t_summon_seducer",
	["t_com_cnj_summonseducerdark"]       = "t_summon_seducerdark",
	["t_com_cnj_summonvermai"]            = "t_summon_vermai",
	["t_com_cnj_summonstormmonarch"]      = "t_summon_atrostormmon",
	["t_nor_cnj_summonicewraith"]         = "t_summon_icewraith",
	["t_dwe_cnj_uni_summondwespectre"]    = "t_summon_dwespectre",
	["t_dwe_cnj_uni_summonsteamcent"]     = "t_summon_steamcent",
	["t_dwe_cnj_uni_summonspidercent"]    = "t_summon_spidercent",
	["t_ayl_cnj_summonwelkyndspirit"]     = "t_summon_welkyndspirit",
	["t_com_cnj_summonauroran"]           = "t_summon_auroran",
	["t_com_cnj_summonherne"]             = "t_summon_herne",
	["t_com_cnj_summonmorphoid"]          = "t_summon_morphoid",
	["t_nor_cnj_summondraugr"]            = "t_summon_draugr",
	["t_nor_cnj_summonspriggan"]          = "t_summon_spriggan",
	["t_de_cnj_summongreaterbonelord"]    = "t_summon_boneldgr",
	["t_cyr_cnj_summonghost"]             = "t_summon_ghost",
	["t_cyr_cnj_summonwraith"]            = "t_summon_wraith",
	["t_cyr_cnj_summonbarrowguard"]       = "t_summon_barrowguard",
	["t_cyr_cnj_summonminobarrowguard"]   = "t_summon_minobarrowguard",
	["t_com_cnj_summonskeletonchamp"]     = "t_summon_skeletonchampion",
	["t_com_cnj_summonfrostmonarch"]      = "t_summon_atrofrostmon",
	["t_com_cnj_summonspiderdaedra"]      = "t_summon_spiderdaedra",
	-- NPC only
	["t_cr_cnj_aylsorcksummon1"]          = "t_summon_auroran",
	["t_cr_cnj_aylsorcksummon3"]          = "t_summon_welkyndspirit",
}

-- spell ID -> bound. actual item record is created dynamically
data.BOUND_ITEMS = {
	["t_bound_greaves"] = {
		spellId   = "t_com_cnj_boundgreaves",
		items = { "t_com_bound_greaves_01" },
		slots     = { types and types.Actor.EQUIPMENT_SLOT.Greaves },
	},
	["t_bound_waraxe"] = {
		spellId   = "t_com_cnj_boundwaraxe",
		items = { "t_com_bound_waraxe_01" },
		slots     = { types and types.Actor.EQUIPMENT_SLOT.CarriedRight },
	},
	["t_bound_warhammer"] = {
		spellId   = "t_com_cnj_boundwarhammer",
		items = { "t_com_bound_warhammer_01" },
		slots     = { types and types.Actor.EQUIPMENT_SLOT.CarriedRight },
	},
	["t_bound_pauldrons"] = {
		spellId   = "t_com_cnj_boundpauldron",
		items = { "t_com_bound_pauldronl_01", "t_com_bound_pauldronr_01" },
		slots     = { types and types.Actor.EQUIPMENT_SLOT.LeftPauldron, types and types.Actor.EQUIPMENT_SLOT.RightPauldron },
	},
	["t_bound_greatsword"] = {
		spellId   = "t_com_cnj_boundgreatsword",
		items = { "t_com_bound_greatsword_01" },
		slots     = { types and types.Actor.EQUIPMENT_SLOT.CarriedRight },
	},
	-- NPC-only bound
	["t_bound_hammerresdayn"] = {
		spellId   = "t_de_cnj_uni_boundhammerresdayn",
		items = { "t_com_bound_warhammer_01" },
		slots     = { types and types.Actor.EQUIPMENT_SLOT.CarriedRight },
	},
	["t_bound_razorresdayn"] = {
		spellId   = "t_de_cnj_uni_boundrazororesdayn",
		items = { "bound_dagger" },
		slots     = { types and types.Actor.EQUIPMENT_SLOT.CarriedRight },
	},
}

data.DISTRACT_SPELLS = {
	["t_com_ilu_distractcreature"] = "creature",
	["t_com_ilu_distracthumanoid"] = "humanoid",
}

data.KYNE_MARKER_ID = "t_aid_kyneinterventionmarker"

data.KYNE_MARKERS = {
	['TR_Mainland.esm'] = {
		{
			x = -101,
			y = 11,
			position = { -820175.44, 94423.58, 775.2521 },
			rotation = 5.5833084,--2.4417157,
		},
	}
}

data.PASSWALL_FORBIDDEN_DOORS = {
	"trap", "cell", "tent", "grate", "bearskin",
	"mystical", "skyrender", "vault",
}

data.PASSWALL_FORBIDDEN_MODELS = {
	"force", "gg_", "water", "blight", "_grille_", "field",
	"editormarker", "barrier", "_portcullis_", "bm_ice_wall",
	"_mist", "_web", "_cryst", "collision", "grate", "shield",
	"smoke", "ex_colony_ouside_tend01", "akula", "act_sotha_green",
	"act_sotha_red", "lava", "bug", "clearbox",
}

data.DISTRACT_VOICES = {
	["Argonian"] = {
		male   = { startLines = { "sound\\vo\\a\\m\\Idl_AM001.mp3", "sound\\vo\\a\\m\\Hlo_AM056.mp3" }, endLines = { "sound\\vo\\a\\m\\Idl_AM008.mp3" } },
		female = { startLines = { "sound\\vo\\a\\f\\Idl_AF007.mp3", "sound\\vo\\a\\f\\Idl_AF004.mp3" }, endLines = { "sound\\vo\\a\\f\\Idl_AF002.mp3" } },
	},
	["Breton"] = {
		male   = { startLines = {}, endLines = {} },
		female = { startLines = { "sound\\vo\\b\\f\\Idl_BF001.mp3", "sound\\vo\\b\\f\\Idl_BF005.mp3" }, endLines = { "sound\\vo\\b\\f\\Idl_BF003.mp3" } },
	},
	["Dark Elf"] = {
		male   = { startLines = { "sound\\vo\\d\\m\\Idl_DM006.mp3", "sound\\vo\\d\\m\\Idl_DM007.mp3" }, endLines = { "sound\\vo\\d\\m\\Idl_DM008.mp3" } },
		female = { startLines = { "sound\\vo\\d\\f\\Idl_DF006.mp3" }, endLines = { "sound\\vo\\d\\f\\Idl_DF003.mp3" } },
	},
	["High Elf"] = {
		male   = { startLines = { "sound\\vo\\h\\m\\Hlo_HM056.mp3" }, endLines = { "sound\\vo\\i\\m\\Idl_HF007.mp3" } },
		female = { startLines = { "sound\\vo\\h\\f\\Hlo_HF056.mp3" }, endLines = { "sound\\vo\\i\\f\\Idl_HF007.mp3" } },
	},
	["Imperial"] = {
		male   = { startLines = { "sound\\vo\\i\\m\\Idl_IM008.mp3", "sound\\vo\\i\\m\\Idl_IM003.mp3" }, endLines = { "sound\\vo\\i\\m\\Idl_IM005.mp3" } },
		female = { startLines = { "sound\\vo\\i\\f\\Idl_IF001.mp3" }, endLines = { "sound\\vo\\i\\f\\Idl_IF009.mp3" } },
	},
	["Khajiit"] = {
		male   = { startLines = { "sound\\vo\\k\\m\\Idl_KM005.mp3", "sound\\vo\\k\\m\\Idl_KM006.mp3", "sound\\vo\\k\\m\\Idl_KM007.mp3" }, endLines = { "sound\\vo\\k\\m\\Idl_KM002.mp3", "sound\\vo\\k\\m\\Idl_KM003.mp3" } },
		female = { startLines = { "sound\\vo\\k\\f\\Idl_KF005.mp3", "sound\\vo\\k\\f\\Idl_KF006.mp3", "sound\\vo\\k\\f\\Idl_KF007.mp3" }, endLines = { "sound\\vo\\k\\f\\Idl_KF002.mp3", "sound\\vo\\k\\f\\Idl_KF003.mp3" } },
	},
	["Nord"] = {
		male   = { startLines = { "sound\\vo\\n\\m\\Idl_NM001.mp3" }, endLines = { "sound\\vo\\n\\m\\Idl_NM009.mp3" } },
		female = { startLines = { "sound\\vo\\n\\f\\Idl_NF002.mp3", "sound\\vo\\n\\f\\Idl_NF004.mp3" }, endLines = { "sound\\vo\\n\\f\\Idl_NM008.mp3" } },
	},
	["Orc"] = {
		male   = { startLines = { "sound\\vo\\o\\m\\Idl_OM001.mp3", "sound\\vo\\o\\m\\Idl_OM002.mp3" }, endLines = { "sound\\vo\\o\\m\\Idl_OM004.mp3", "sound\\vo\\o\\m\\Idl_OM009.mp3" } },
		female = { startLines = { "sound\\vo\\o\\f\\Idl_OF009.mp3" }, endLines = {} },
	},
	["Redguard"] = {
		male   = { startLines = {}, endLines = {} },
		female = { startLines = { "sound\\vo\\r\\f\\Idl_RF002.mp3", "sound\\vo\\r\\f\\Idl_RF008.mp3" }, endLines = { "sound\\vo\\r\\f\\Idl_RF003.mp3", "sound\\vo\\r\\f\\Idl_RF007.mp3" } },
	},
	["Wood Elf"] = {
		male   = { startLines = { "sound\\vo\\w\\m\\Idl_WM009.mp3" }, endLines = { "sound\\vo\\w\\m\\Idl_WM006.mp3", "sound\\vo\\w\\m\\Idl_WM007.mp3" } },
		female = { startLines = { "sound\\vo\\w\\f\\Idl_WF006.mp3", "sound\\vo\\w\\f\\Idl_WF009.mp3" }, endLines = { "sound\\vo\\w\\f\\Idl_WF003.mp3", "sound\\vo\\w\\f\\Idl_WF007.mp3" } },
	},
}

-- spell tomes
data.TOME_DEFS = {
	{
		tomeId = "spelltome_tr_conj_bound",
		message = "You have learned several Bound Weapons and Armor spells from this tome.",
		spells = {
			"t_com_cnj_boundgreaves",
			"t_com_cnj_boundwaraxe",
			"t_com_cnj_boundwarhammer",
			--"t_de_cnj_uni_boundhammerresdayn",
			--"t_de_cnj_uni_boundrazororesdayn",
			"t_com_cnj_boundpauldron",
			"t_com_cnj_boundgreatsword",
		},
	},
	{
		tomeId = "spelltome_tr_conj_summon",
		message = "You have learned several Summon spells from this tome.",
		spells = {
			"t_com_cnj_summondevourer",
			"t_com_cnj_summondremoraarcher",
			"t_com_cnj_summondremoracaster",
			"t_com_cnj_summonguardian",
			"t_com_cnj_summonlesserclannfear",
			"t_com_cnj_summonogrim",
			"t_com_cnj_summonseducer",
			"t_com_cnj_summonseducerdark",
			"t_com_cnj_summonvermai",
			"t_com_cnj_summonstormmonarch",
			"t_nor_cnj_summonicewraith",
			--"t_dwe_cnj_uni_summondwespectre",
			--"t_dwe_cnj_uni_summonsteamcent",
			--"t_dwe_cnj_uni_summonspidercent",
			"t_ayl_cnj_summonwelkyndspirit",
			"t_com_cnj_summonauroran",
			"t_com_cnj_summonherne",
			"t_com_cnj_summonmorphoid",
			"t_nor_cnj_summondraugr",
			"t_nor_cnj_summonspriggan",
			"t_de_cnj_summongreaterbonelord",
			"t_cyr_cnj_summonghost",
			"t_cyr_cnj_summonwraith",
			"t_cyr_cnj_summonbarrowguard",
			"t_cyr_cnj_summonminobarrowguard",
			"t_com_cnj_summonskeletonchamp",
			"t_com_cnj_summonfrostmonarch",
			"t_com_cnj_summonspiderdaedra",
			-- "t_dae_cnj_uni_corruptionsummon",
		},
	},
	{
		tomeId = "spelltome_tr_myst",
		message = "You have learned several Mysticism spells from this tome.",
		spells = {
			"t_nor_mys_kynesintervention",
			"t_com_mys_blink",
			"t_com_mys_uni_passwall",
			"t_com_mys_reflectdamage",
			"t_com_mys_banishdaedra",
			"t_com_mys_insight",
			-- "t_com_mys_detecthumanoid",
			-- "t_com_mys_detectenemy",
			-- "t_com_mys_detectinvisibility",
			-- "t_arg_mys_bloodmagic",
			-- "t_com_mys_detectvaluables",
			-- "t_com_mys_magickaward",
		},
	},
	{
		tomeId = "spelltome_tr_rest",
		message = "You have learned several Restoration spells from this tome.",
		spells = {
			"t_com_res_weaponresartus",
			"t_com_res_armorresartus",
		},
	},
	--{
	--	tomeId = "spelltome_tr_alt",
	--	message = "You have learned several Alteration spells from this tome.",
	--	spells = {
	--		"t_ayl_alt_radiantshield",
	--		--"t_cr_alt_auroranshield",
	--		"t_cr_alt_aylsorcklightshield",
	--	},
	--},
	{
		tomeId = "spelltome_tr_ilu",
		message = "You have learned several Illusion spells from this tome.",
		spells = {
			"t_com_ilu_distractcreature",
			"t_com_ilu_distracthumanoid",
		},
	},
}

return data
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Counter', 'Hybrid', 'StoreTP', 'Subtle', 'SubtleMalig', 'Ngai')
    state.WeaponskillMode:options('Normal', 'Acc', 'Subtle')
    state.HybridMode:options('Normal', 'PDT', 'Counter')
    state.PhysicalDefenseMode:options('PDT', 'HP')

	gear.acc = {}
	gear.acc.feet = { name="Ryuo Sune-Ate +1", augments={'STR+12','DEX+12','Accuracy+20',}}
	
	gear.crit = {}
	gear.crit.feet = { name="Ryuo Sune-Ate +1", augments={'STR+12','Attack+25','Crit. hit rate+4%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
    update_combat_form()
    update_melee_groups()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	-- MNK traits: SB1 35, Chirich: SB1 10, Sherida/Niq/Belt/Mpaca: SB2 30. Totals - SB1 45, SB2 30, reaches total SB cap of 75
	sets.subtle_blow = {ear1="Sherida Earring",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",waist="Moonbow Belt +1",legs="Mpaca's Hose"}
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	sets.precast.JA['Boost'] = {head="Pixie Hairpin +1",body=empty,hands=empty,waist="Ask Sash",legs=empty,feet="Crier's Gaiters"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +3"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +2"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +3"}
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas +3"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +3"}

	sets.precast.JA['Chakra'] = {
		body="Adamantite Armor",hands="Hesychast's Gloves +3",
		feet="Herculean Boots"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		body="Adamantite Armor",hands="Adhemar Wristbands +1",
		feet="Herculean Boots"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {body="Volte Jupon",waist="Chaac Belt"}
	sets.precast.Flourish1 = {body="Volte Jupon",waist="Chaac Belt"}


	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Nyame Helm",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
		head="Mpaca's Cap",neck="Fotia Gorget",ear1="Schere Earring",ear2="Moonshade Earring",
		body="Bhikku Cyclas +3",hands="Mpaca's Gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back="Segomo's Mantle",waist="Moonbow Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Mpaca's Cap",ear1="Crepuscular Earring",ear2="Odr Earring",
		body="Tatenashi Haramaki +1",hands="Mpaca's Gloves",ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Mpaca's Hose",feet="Mpaca's Boots"
	})
	sets.precast.WS.Subtle = set_combine(sets.precast.WS, sets.subtle_blow)
	
	sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
		neck="Monk's Nodowa +2",ear1="Sherida Earring",ear2="Schere Earring",
		body="Bhikku Cyclas +3",hands="Ryuo Tekko +1",feet="Mpaca's Boots"
	})
	sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS['Victory Smite'], {})
	sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS['Victory Smite'], {})
	
	sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
		ear2="Odr Earring",ring2="Lehko's Ring",waist="Moonbow Belt +1"})

	sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {waist="Fotia Belt"})	
		
	sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",
		neck="Monk's Nodowa +2",ear1="Schere Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",
		legs="Nyame Flanchard",feet="Anchorite's Gaiters +3"
	})
	sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS['Dragon Kick'], {})
	sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {ring1=gear.rings.left,ring2=gear.rings.right})
	sets.precast.WS['Final Heaven'] = set_combine(sets.precast.WS, {body="Nyame Mail",hands="Nyame Gauntlets",legs="Mpaca's Hose",feet="Nyame Sollerets"})
	sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS['Final Heaven'], {ammo="Coiste Bodhar",neck="Republican Platinum Medal"})
	
	sets.precast.WS['Victory Smite'].Subtle = set_combine(sets.precast.WS['Victory Smite'], sets.subtle_blow)
	sets.precast.WS["Ascetic's Fury"].Subtle = set_combine(sets.precast.WS["Ascetic's Fury"], sets.subtle_blow)
	sets.precast.WS['Shijin Spiral'].Subtle = set_combine(sets.precast.WS['Shijin Spiral'], sets.subtle_blow)
	sets.precast.WS['Asuran Fists'].Subtle = set_combine(sets.precast.WS['Asuran Fists'], sets.subtle_blow)
	sets.precast.WS['Dragon Kick'].Subtle = set_combine(sets.precast.WS['Dragon Kick'], sets.subtle_blow)
	sets.precast.WS['Tornado Kick'].Subtle = set_combine(sets.precast.WS['Tornado Kick'], sets.subtle_blow)
	sets.precast.WS['Shoulder Tackle'].Subtle = set_combine(sets.precast.WS['Shoulder Tackle'], sets.subtle_blow)
	sets.precast.WS['Final Heaven'].Subtle = set_combine(sets.precast.WS['Final Heaven'], sets.subtle_blow)
	sets.precast.WS['Howling Fist'].Subtle = set_combine(sets.precast.WS['Howling Fist'], sets.subtle_blow)
	
	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS, {
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Acumen Ring",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	
	sets.precast.WS['Shell Crusher'] = {
		head="Malignance Chapeau",neck="Null Loop",ear1="Crepuscular Earring",ear2="Bhikku Earring +1",
		body="Malignance Tabard",hands="Malignance Gloves",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",waist="Acuity Belt +1",legs="Malignance Tights",feet="Malignance Boots"
	}
	
	sets.precast.JA['Chi Blast'] = set_combine(sets.precast.WS['Shell Crusher'], {ammo="Perfect Lucky Egg",head="Hesychast's Crown +3",body="Volte Jupon",})
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Nyame Helm",hands="Leyline Gloves",
		waist="Witful Belt"}
		
	sets.engaged = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Monk's Nodowa +2",ear1="Sherida Earring",ear2="Bhikku Earring +1",
		body="Tatenashi Haramaki +1",hands="Mpaca's Gloves",ring1="Niqmaddu Ring",ring2="Lehko's Ring",
		back="Segomo's Mantle",waist="Moonbow Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}
	
	-- Sets to return to when not performing an action.
	sets.regen = {head="Null Masque",neck="Bathy Choker +1",ear1="Infused Earring",body="Hizamaru Haramaki +2",ring1="Sheltered Ring",ring2="Murky Ring",waist="Null Belt"}

	sets.idle = set_combine(sets.engaged, sets.regen, {
		head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		hands="Nyame Gauntlets",ring2="Murky Ring",
		back="Segomo's Mantle",waist="Ask Sash",legs="Nyame Flanchard",feet="Crier's Gaiters"})
	
	-- Resting sets
	sets.resting = set_combine(sets.idle, {})
	
	-- Idle sets
	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Weak = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.HP = {
		head="Null Masque",
		body="Adamantite Armor",hands="Hesychast's Gloves +3",
		back="Moonlight Cape",waist="Platinum Moogle Belt"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {})

	sets.Kiting = {feet="Crier's Gaiters"}

	sets.ExtraRegen = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee sets

	sets.engaged.Acc = set_combine(sets.engaged, {ammo="Coiste Bodhar",ear1="Odr Earring",ear2="Bhikku Earring +1",ring1="Niqmaddu Ring",ring2="Regal Ring",waist="Moonbow Belt +1",legs="Anchorite's Hose +3",feet="Anchorite's Gaiters +3"})
		
	sets.engaged.Counter = set_combine(sets.engaged, {body="Hesychast's Cyclas +3",legs="Anchorite's Hose +3",feet="Hesychast's Gaiters +3"})
		
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Mpaca's Cap",body="Mpaca's Doublet",hands="Mpaca's Gloves",ring2="Chirich Ring +1",legs="Mpaca's Hose",feet="Mpaca's Boots"
	})

	sets.engaged.StoreTP = set_combine(sets.engaged, {
		hands="Tatenashi Gote +1",ring2="Lehko's Ring",
		legs="Tatenashi Haidate +1",feet="Tatenashi Sune-Ate +1"})
	sets.engaged.StoreTP.Impetus = set_combine(sets.engaged.StoreTP, {body="Bhikku Cyclas +3"})


	sets.engaged.Subtle = set_combine(sets.engaged.Hybrid, sets.subtle_blow)
	sets.engaged.Subtle.Impetus = set_combine(sets.engaged.Subtle, {body="Bhikku Cyclas +3"})
	sets.engaged.SubtleMalig = set_combine(sets.engaged.Subtle, {head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",feet="Malignance Boots"})
	sets.engaged.SubtleMalig.Impetus = set_combine(sets.engaged.SubtleMalig, {body="Bhikku Cyclas +3"})
	
	sets.engaged.Ngai = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Malignance Tights",feet="Malignance Boots"
	})
	sets.engaged.Ngai.Impetus = set_combine(sets.engaged.Ngai, {body="Bhikku Cyclas +3"})
	-- Defensive melee hybrid sets
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)

	-- Hundred Fists/Impetus melee set mods
	sets.engaged.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +3"})
	sets.engaged.Hybrid.Impetus = set_combine(sets.engaged.Hybrid, {body="Bhikku Cyclas +3"})
	sets.engaged.HF = set_combine(sets.engaged)
	--sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Tantra Cyclas +2"})
	--sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
	--sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Tantra Cyclas +2"})
	--sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
	--sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Tantra Cyclas +2"})
	--sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
	--sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Tantra Cyclas +2"})

	-- Footwork combat form
	sets.engaged.Footwork = set_combine(sets.engaged, {feet="Anchorite's Gaiters +3"})
	sets.engaged.Footwork.Acc = set_combine(sets.engaged.Acc, {})

	sets.engaged.Counterstance = set_combine(sets.engaged, {feet="Hesychast's Gaiters +3"})
	
	sets.impetus_body = {body="Bhikku Cyclas +3"}
	-- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
	
	sets.buff.Boost = {waist="Ask Sash"}
	sets.footwork_kick_feet = {feet="Anchorite's Gaiters +3"}
end
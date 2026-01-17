
-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'Subtle', 'CP')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'HighBuff', 'Acc', 'Proc')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')

    update_combat_form()
    
	gear.tp = {}
	gear.tp.feet = { name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}}
	gear.tp.back = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}
	gear.wsdmg.back = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	
	gear.crit = {}
	gear.crit.feet = { name="Ryuo Sune-Ate +1", augments={'STR+12','Attack+25','Crit. hit rate+4%',}}
	
	gear.rings = {}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
    -- Additional local binds
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.midcast.RangedAttack = {
		head="Sakonji Kabuto +3",neck="Null Loop",ear1="Crepuscular Earring",ear2="Kasuga Earring +1",
		body="Nyame Mail",hands="Kasuga Kote +3",ring1="Crepuscular Ring",ring2="Regal Ring",
		back="Null Shawl",waist="Null Belt",legs="Volte Tights",feet="Wakido Sune-Ate +4"}

	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +3",back=gear.wsdmg.back}
	sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
	sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Valorous Mask",
		body="Sakonji Domaru +4",hands="Leyline Gloves",
		feet="Nyame Sollerets"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.FC = {body="Sacro Breastplate",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.precast.RangedAttack = {
		head="Nyame Helm",neck="Null Loop",ear1="Crepuscular Earring",ear2="Kasuga Earring +1",
		body="Nyame Mail",hands="Kasuga Kote +3",ring1="Crepuscular Ring",ring2="Regal Ring",
		back="Null Shawl",waist="Null Belt",legs="Nyame Flanchard",feet="Wakido Sune-Ate +4"}
	
	sets.Lugra = {}
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Mpaca's Cap",neck="Samurai's Nodowa +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Sakonji Domaru +4",hands="Kasuga Kote +3",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back=gear.wsdmg.back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS.HighBuff = set_combine(sets.precast.WS, {hands="Nyame Gauntlets",feet="Nyame Sollerets"})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Wakido Kabuto +3",neck="Samurai's Nodowa +2",ear1="Crepuscular Earring",ear2="Kasuga Earring +1",
		body="Sakonji Domaru +4",hands="Tatenashi Gote +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.wsdmg.back,waist="Null Belt",legs="Kasuga Haidate +3",feet="Wakido Sune-Ate +4"})

	sets.precast.WS.Proc = set_combine(sets.precast.WS.Acc, {ammo="Coiste Bodhar",
		head="Null Masque",neck="Null Loop",body="Volte Jupon",hands="Leyline Gloves",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back="Null Shawl",legs="Volte Tights",feet="Flamma Gambieras +2"
	})
	
	sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
		head="Nyame Helm",ear1="Friomisi Earring",hands="Nyame Gauntlets",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
	
	sets.precast.WS['Tachi: Jinpu'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Tachi: Jinpu'].Proc = set_combine(sets.precast.WS.Proc, {})
	sets.precast.WS['Tachi: Jinpu'].HighBuff = set_combine(sets.precast.WS['Tachi: Jinpu'], {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Apex Arrow'] = set_combine(sets.midcast.RangedAttack, {
		neck="Null Loop",ear1="Crepuscular Earring",ear2="Thrud Earring",
		back=gear.wsdmg.back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	sets.precast.WS['Namas Arrow'] = set_combine(sets.precast.WS['Apex Arrow'], {})
	
	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
		head="Mpaca's Cap",neck="Null Loop",ear1="Crepuscular Earring",
		body="Kasuga Domaru +3",hands="Kasuga Kote +3",ring1=gear.rings.left,gear.rings.right,
		back="Null Shawl",waist="Null Belt",legs="Kasuga Haidate +3",feet="Mpaca's Boots"
	})
	sets.precast.WS['Tachi: Ageha'].Proc = set_combine(sets.precast.WS.Proc, {})
	
	sets.precast.WS['Tachi: Hobaku'] = set_combine(sets.precast.WS['Tachi: Ageha'], {})
	sets.precast.WS['Tachi: Hobaku'].Proc = set_combine(sets.precast.WS.Proc, {})
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {hands="Ryuo Tekko +1",ring1="Lehko's Ring",feet=gear.crit.feet})
	sets.precast.WS['Impulse Drive'].HighBuff = set_combine(sets.precast.WS['Impulse Drive'], {})
	
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS['Impulse Drive'], {body="Mpaca's Doublet",waist="Fotia Belt",legs="Mpaca's Hose"})
	sets.precast.WS['Stardiver'].HighBuff = set_combine(sets.precast.WS['Stardiver'], {})
	
	sets.engaged = {ammo="Coiste Bodhar",
		head="Kasuga Kabuto +3",neck="Samurai's Nodowa +2",ear1="Dedition Earring",ear2="Kasuga Earring +1",
		body="Kasuga Domaru +3",hands="Tatenashi Gote +1",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Kasuga Haidate +3",feet=gear.tp.feet}

	-- Midcast Sets
	sets.midcast.FastRecast = set_combine(sets.engaged, {})

		
	-- Sets to return to when not performing an action.
	--sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.Reraise = {}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = set_combine(sets.engaged, sets.Reraise, {
		head="Wakido Kabuto +3",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		body="Sacro Breastplate",hands="Nyame Gauntlets",ring1="Sheltered Ring",ring2="Murky Ring",
		back=gear.wsdmg.back,waist="Null Belt",legs="Nyame Flanchard",feet="Danzo Sune-Ate"})
	sets.idle = set_combine(sets.idle, {ring1=gear.rings.left})
	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Field = set_combine(sets.idle, {})
	sets.idle.Reraise = set_combine(sets.idle.Town, sets.Reraise)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Reraise)
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Mpaca's Cap",
		body="Kasuga Domaru +3",ring1="Defending Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Null Belt",legs="Mpaca's Hose"}

	sets.defense.Reraise = set_combine(sets.defense.PDT, sets.Reraise)
	sets.defense.MDT = set_combine(sets.defense.PDT, {ring1="Defending Ring"})

	sets.Kiting = {feet="Danzo Sune-Ate"}

	-- Resting sets
	sets.resting = set_combine(sets.idle, sets.Reraise)
	
	-- Engaged sets

	sets.engaged.Norifusa = set_combine(sets.engaged, {feet="Sakonji Sune-Ate +3"})
	sets.engaged.CP = set_combine(sets.engaged, {body="Crepuscular Mail"})
	
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Mpaca's Cap",
		body="Kasuga Domaru +3",ring1="Lehko's Ring",ring2="Murky Ring",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Kasuga Haidate +3",feet=gear.tp.feet})
	sets.engaged.Kendatsuba = set_combine(sets.engaged, {head="Mpaca's Cap",legs="Mpaca's Hose"})
	
	sets.engaged.Subtle = set_combine(sets.engaged.Hybrid, {
		neck="Bathy Choker +1",ear1="Schere Earring",
		body="Dagon Breastplate",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		legs="Mpaca's Hose"
	})

	sets.engaged.Norifusa.Hybrid = set_combine(sets.engaged.Norifusa,sets.defense.PDT)
	sets.engaged.Norifusa.Kendatsuba = set_combine(sets.engaged.Kendatsuba, {})
	
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Wakido Kabuto +3",neck="Samurai's Nodowa +2",ear1="Crepuscular Earring",ear2="Kasuga Earring +1",
		body="Kasuga Domaru +3",hands="Tatenashi Gote +1",ring2="Regal Ring",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Kasuga Haidate +3",feet="Wakido Sune-Ate +4"})
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
	sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)
	
	sets.engaged.Norifusa.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.PDT = set_combine(sets.engaged.Norifusa, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Norifusa.Acc, sets.defense.PDT)
	sets.engaged.Reraise = set_combine(sets.engaged.Norifusa, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Norifusa.Acc, sets.Reraise)
	
	
	sets.buff.Sekkanoki = {hands="Kasuga Kote +3"}
	sets.buff.Sengikori = {}
	sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate +3"}
end
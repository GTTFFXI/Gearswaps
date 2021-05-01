
-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'Kendatsuba')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'HighBuff', 'Acc', 'Proc')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')

    update_combat_form()
    
	gear.tp = {}
	gear.tp.feet = { name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}}
	gear.tp.back = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}
	gear.wsdmg.back = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
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
		head="Nyame Helm",neck="Combatant's Torque",ear1="Telos Earring",ear2="Enervating Earring",
		body="Nyame Mail",hands="Kendatsuba Tekko +1",ring1="Cacoethic Ring +1",ring2="Regal Ring",
		back="Sokolski Mantle",waist="Yemaya Belt",legs="Nyame Flanchard",feet="Wakido Sune-Ate +3"}

	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +3",back=gear.tp.back}
	sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
	sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Valorous Mask",
		body="Sakonji Domaru +3",hands="Leyline Gloves",
		back="Moonlight Cape",feet="Nyame Sollerets"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.FC = {ear1="Etiolation Earring",body="Sacro Breastplate",hands="Leyline Gloves",ring1="Kishar Ring",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.precast.RangedAttack = {
		head="Zha'Go's Barbut",neck="Combatant's Torque",ear1="Telos Earring",ear2="Enervating Earring",
		body="Kyujutsugi",hands="Despair Finger Gauntlets",ring1="Cacoethic Ring +1",ring2="Regal Ring",
		back="Sokolski Mantle",waist="Yemaya Belt",legs="Mustela Brais",feet="Wakido Sune-Ate +3"}
	
	sets.Lugra = {}
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Mpaca's Cap",neck="Samurai's Nodowa +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Sakonji Domaru +3",hands="Sakonji Kote +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.wsdmg.back,waist="Sailfi Belt +1",legs="Wakido Haidate +3",feet="Sakonji Sune-Ate +3"}
	sets.precast.WS.HighBuff = set_combine(sets.precast.WS, {hands="Valorous Mitts",feet="Valorous Greaves"})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Wakido Kabuto +3",neck="Samurai's Nodowa +2",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Sakonji Domaru +3",hands="Wakido Kote +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.wsdmg.back,waist="Eschan Stone",legs="Wakido Haidate +3",feet="Wakido Sune-Ate +3"})

	sets.precast.WS.Proc = set_combine(sets.precast.WS.Acc, {ammo="Aurgelmir Orb",
		head="Flamma Zucchetto +2",body="Flamma Korazin +2",hands="Flamma Manopolas +2",ring1="Purity Ring",ring2="Cacoethic Ring +1",
		back=gear.tp.back,legs="Flamma Dirs +2",feet="Flamma Gambieras +2"
	})
	
	sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
		head="Mpaca's Cap",ear1="Friomisi Earring",hands="Nyame Gauntlets",waist="Orpheus's Sash",feet="Nyame Sollerets"
	})
	
	sets.precast.WS['Tachi: Jinpu'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Tachi: Jinpu'].Proc = sets.precast.WS.Proc
	sets.precast.WS['Tachi: Jinpu'].HighBuff = sets.precast.WS['Tachi: Jinpu']
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Apex Arrow'] = set_combine(sets.midcast.RangedAttack, {
		neck="Fotia Gorget",ear1="Telos Earring",ear2="Thrud Earring",
		back=gear.wsdmg.back,waist="Fotia Belt",legs="Wakido Haidate +3"})
	sets.precast.WS['Namas Arrow'] = set_combine(sets.precast.WS['Apex Arrow'], {})
	
	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
		head="Flamma Zucchetto +2",neck="Fotia Gorget",ear1="Dignitary's Earring",
		body="Flamma Korazin +2",hands="Flamma Manopolas +2",ring1=gear.rings.left,gear.rings.right,
		waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flamma Gambieras +2"
	})
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {head="Mpaca's Cap",hands="Ryuo Tekko +1",feet=gear.crit.feet})
	sets.precast.WS['Impulse Drive'].HighBuff = sets.precast.WS['Impulse Drive']
	
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS['Impulse Drive'], {body="Tatenashi Haramaki +1",waist="Fotia Belt",legs="Tatenashi Haidate +1"})
	sets.precast.WS['Stardiver'].HighBuff = sets.precast.WS['Stardiver']
	
	sets.engaged = {ammo="Aurgelmir Orb",
		head="Flamma Zucchetto +2",neck="Samurai's Nodowa +2",ear1="Telos Earring",ear2="Cessance Earring",
		body="Tatenashi Haramaki +1",hands="Wakido Kote +3",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.tp.back,waist="Ioskeha Belt +1",legs="Tatenashi Haidate +1",feet=gear.tp.feet}

	-- Midcast Sets
	sets.midcast.FastRecast = sets.engaged

		
	-- Sets to return to when not performing an action.
	--sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.Reraise = {}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = set_combine(sets.engaged, sets.Reraise, {
		head="Wakido Kabuto +3",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Sacro Breastplate",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",legs="Rao Haidate",feet="Danzo Sune-Ate"})
	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Field = sets.idle
	sets.idle.Reraise = set_combine(sets.idle.Town, sets.Reraise)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Reraise)
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Mpaca's Cap",neck="Loricate Torque +1",ear2="Odnowa Earring +1",
		body="Wakido Domaru +3",ring2="Defending Ring",
		back=gear.tp.back,waist="Flume Belt +1"}

	sets.defense.Reraise = set_combine(sets.defense.PDT, sets.Reraise)
	sets.defense.MDT = set_combine(sets.defense.PDT, {ring1="Purity Ring"})

	sets.Kiting = {feet="Danzo Sune-Ate"}

	-- Resting sets
	sets.resting = set_combine(sets.idle, sets.Reraise)
	
	-- Engaged sets

	sets.engaged.Norifusa = set_combine(sets.engaged, {feet="Sakonji Sune-Ate +3"})
	
	sets.engaged.Hybrid = set_combine(sets.engaged, {ammo="Staunch Tathlum +1",
		head="Mpaca's Cap",ear2="Odnowa Earring +1",
		body="Wakido Domaru +3",ring1="Chirich Ring +1",ring2="Defending Ring",
		back=gear.tp.back,waist="Ioskeha Belt +1",legs="Mpaca's Hose",feet=gear.tp.feet})
	sets.engaged.Kendatsuba = set_combine(sets.engaged, {head="Kendatsuba Jinpachi +1",legs="Kendatsuba Hakama +1"})

	sets.engaged.Norifusa.Hybrid = set_combine(sets.engaged.Norifusa,sets.defense.PDT)
	sets.engaged.Norifusa.Kendatsuba = sets.engaged.Kendatsuba
	
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Wakido Kabuto +3",neck="Samurai's Nodowa +2",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Wakido Domaru +3",hands="Wakido Kote +3",ring2="Regal Ring",
		back=gear.tp.back,waist="Ioskeha Belt +1",legs="Wakido Haidate +3",feet="Wakido Sune-Ate +3"})
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
	sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)
	
	sets.engaged.Norifusa.Acc = sets.engaged.Acc
	sets.engaged.PDT = set_combine(sets.engaged.Norifusa, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Norifusa.Acc, sets.defense.PDT)
	sets.engaged.Reraise = set_combine(sets.engaged.Norifusa, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Norifusa.Acc, sets.Reraise)
	
	
	sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
	sets.buff.Sengikori = {}
	sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate +3"}
end
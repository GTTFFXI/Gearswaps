-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'GrandGrenade')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc', 'Proc')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')

    update_combat_form()
    
	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}
	
    -- Additional local binds
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +3",back="Smertrios's Mantle"}
	sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
	sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Valorous Mask",
		body="Sakonji Domaru +3",hands="Leyline Gloves",
		back="Moonbeam Cape",feet="Founder's Greaves"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.FC = {ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Kishar Ring",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.precast.RangedAttack = {
		head="Zha'Go's Barbut",neck="Combatant's Torque",ear1="Telos Earring",ear2="Enervating Earring",
		body="Kyujutsugi",hands="Despair Finger Gauntlets",ring1="Cacoethic Ring +1",ring2="Regal Ring",
		back="Sokolski Mantle",waist="Yemaya Belt",legs="Mustela Brais",feet="Wakido Sune-Ate +3"}
	
	sets.Lugra = {ear1="Lugra Earring +1"}
	
	sets.precast.WS = {ammo="Knobkierrie",
		head=gear.wsdmg.head,neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Sakonji Domaru +3",hands="Sakonji Kote +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back="Smertrios's Mantle",waist="Fotia Belt",legs="Wakido Haidate +3",feet="Sakonji Sune-Ate +3"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Wakido Kabuto +3",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Sakonji Domaru +3",hands="Wakido Kote +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back="Smertrios's Mantle",legs="Wakido Haidate +3",feet="Wakido Sune-Ate +3"})

	sets.precast.WS.Proc = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
		head="Flamma Zucchetto +2",body="Flamma Korazin +2",hands="Flamma Manopolas +2",ring1="Fortified Ring",ring2="Cacoethic Ring +1",legs="Flamma Dirs +2",feet="Flamma Gambieras +2",back="Takaha Mantle"
	})
	
	sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {
		ear1="Friomisi Earring",body="Founder's Breastplate",hands="Founder's Gauntlets",feet="Founder's Greaves"
	})
	
	sets.precast.WS['Tachi: Jinpu'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Tachi: Jinpu'].Proc = sets.precast.WS.Proc
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.RangedAttack, {neck="Fotia Gorget", waist="Fotia Belt"})
	
	sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
		head="Flamma Zucchetto +2",neck="Sanctity Necklace",ear1="Dignitary's Earring",
		body="Flamma Korazin +2",hands="Flamma Manopolas +2",ring1="Sangoma Ring",ring2="Stikini Ring",
		waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flamma Gambieras +2"
	})

	
	sets.engaged = {ammo="Ginsen",
		head="Kendatsuba Jinpachi +1",neck="Moonlight Nodowa",ear1="Telos Earring",ear2="Cessance Earring",
		body="Dagon Breastplate",hands="Wakido Kote +3",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
		back="Takaha Mantle",waist="Ioskeha Belt",legs="Valorous Hose",feet="Ryuo Sune-Ate +1"}

	-- Midcast Sets
	sets.midcast.FastRecast = sets.engaged
	
	sets.midcast.RangedAttack = {
		head="Kendatsuba Jinpachi +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Enervating Earring",
		body="Kyujutsugi",hands="Despair Finger Gauntlets",ring1="Cacoethic Ring +1",ring2="Regal Ring",
		back="Sokolski Mantle",waist="Yemaya Belt",legs="Wakido Haidate +3",feet="Wakido Sune-Ate +3"}
		
	-- Sets to return to when not performing an action.
	--sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.Reraise = {}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = set_combine(sets.engaged, sets.Reraise, {
		head="Wakido Kabuto +3",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Hizamaru Haramaki +2",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Rao Haidate",feet="Danzo Sune-Ate"})
	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Field = sets.idle
	sets.idle.Reraise = set_combine(sets.idle.Town, sets.Reraise)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Reraise)
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",
		body="Wakido Domaru +3",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",feet="Amm Greaves"}

	sets.defense.Reraise = set_combine(sets.defense.PDT, sets.Reraise)
	sets.defense.MDT = set_combine(sets.defense.PDT, {ear1="Etiolation Earring",ring1="Fortified Ring"})

	sets.Kiting = {feet="Danzo Sune-Ate"}

	-- Resting sets
	sets.resting = set_combine(sets.idle, sets.Reraise)
	
	-- Engaged sets

	sets.engaged.Norifusa = set_combine(sets.engaged, {feet="Sakonji Sune-Ate +3"})
	
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Wakido Kabuto +3",neck="Moonlight Nodowa",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Wakido Domaru +3",hands="Wakido Kote +3",ring2="Regal Ring",
		back="Takaha Mantle",waist="Olseni Belt",legs="Wakido Haidate +3",feet="Wakido Sune-Ate +3"})
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
	sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)
	
	sets.engaged.Norifusa.Acc = sets.engaged.Acc
	sets.engaged.PDT = set_combine(sets.engaged.Norifusa, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Norifusa.Acc, sets.defense.PDT)
	sets.engaged.Reraise = set_combine(sets.engaged.Norifusa, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Norifusa.Acc, sets.Reraise)
	
	sets.engaged.GrandGrenade = set_combine(sets.engaged, {ring2="Defending Ring",back="Moonbeam Cape"})
	
	sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
	sets.buff.Sengikori = {}
	sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate +3"}
end
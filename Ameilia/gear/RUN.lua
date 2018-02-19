function user_setup()
    state.OffenseMode:options('Normal', 'DD', 'Acc', 'PDT', 'MDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
    state.IdleMode:options('Regen', 'Refresh')
end


function init_gear_sets()
    sets.enmity = {hands="Kurys Gloves"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = {body="Runeist Coat +1", legs="Futhark Trousers", back="Ogma's Cape"}
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = {feet="Runeist bottes +1"}
    sets.precast.JA['Battuta'] = {head="Futhark Bandeau +1"}
    sets.precast.JA['Liement'] = {body="Futhark Coat +1"}
    sets.precast.JA['Lunge'] = {head="Dampening Tam", neck="Sanctity Necklace", ear1="Friomisi Earring", ear2="Crematio Earring",
            body="Samnuha Coat", hands="Leyline Gloves",ring1="Acumen Ring", ring2="Sangoma Ring",
            back="Toro Cape", waist="Hachirin-no-obi", legs="Samnuha Tights", feet="Herculean Boots"}
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = {hands="Runeist Mitons +1"}
    sets.precast.JA['Rayke'] = {feet="Futhark Boots"}
    sets.precast.JA['Elemental Sforzo'] = {body="Futhark Coat +1"}
    sets.precast.JA['Swordplay'] = {hands="Futhark Mitons"}
    sets.precast.JA['Embolden'] = {}
    sets.precast.JA['Vivacious Pulse'] = {}
    sets.precast.JA['One For All'] = {}
    sets.precast.JA['Provoke'] = sets.enmity


	-- Fast cast sets for spells
    sets.precast.FC = {head="Carmine Mask +1",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Prolix Ring",neck="Orunmila's Torque"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers"})
    sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})


	-- Weaponskill sets
	sets.precast.WS = {ammo="Knobkierrie",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Niqmaddu Ring",ring2="Shukuyu Ring",
		back="Letalis Mantle",waist="Fotia Belt",legs="Herculean Trousers",feet="Herculean Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Niqmaddu Ring",ring2="Cacoethic Ring +1",
		legs="Carmine Cuisses +1"
	})
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
    sets.precast.WS['Herculean Slash'].Acc = set_combine(sets.precast.WS['Herculean Slash'], {})


	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {head="Carmine Mask +1",ear1="Andoaa Earring", hands="Runeist mitons +1",legs="Futhark Trousers"}
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {head="Futhark Bandeau +1"})
    sets.midcast['Regen'] = {legs="Futhark Trousers"}
    sets.midcast['Stoneskin'] = {}
    sets.midcast.Cure = {ring1="Ephedra Ring", legs="Carmine Cuisses +1", feet="Futhark Boots"}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = {
		head="Ocelomeh Headpiece +1",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Runeist Coat +1",hands="Herculean Gloves",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}
		
    sets.idle.Refresh = set_combine(sets.idle, {body="Runeist Coat +1", waist="Fucho-no-obi"})
           
	sets.defense.PDT = {
		head="Futhark Bandeau +1",neck="Loricate Torque +1", ear1="Telos Earring", ear2="Odnowa Earring",
		body="Futhark Coat +1",hands="Herculean Gloves",ring1="Patricius Ring", ring2="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Erilaz Leg Guards +1", feet="Erilaz Greaves +1"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {head="Dampening Tam",ring1="Fortified Ring"})

	sets.Kiting = {legs="Carmine Cuisses +1"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {ammo="Staunch Tathlum",
		head="Futhark Bandeau +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Futhark Coat +1",hands="Herculean Gloves",ring1="Patricius Ring", ring2="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Erilaz Leg Guards +1", feet="Erilaz Greaves +1"}
	sets.engaged.DD = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Herculean Boots"}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged.DD, {
		head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Herculean Vest",ring1="Niqmaddu Ring",ring2="Cacoethic Ring +1",
		back="Letalis Mantle",waist="Olseni Belt",legs="Carmine Cuisses +1"})
    sets.engaged.PDT = sets.defense.PDT
    sets.engaged.MDT = sets.defense.MDT
    sets.engaged.repulse = {}
end
function user_setup()
    state.OffenseMode:options('Normal', 'TankDD', 'DD', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.IdleMode:options('Regen', 'Refresh', 'PDT')
	state.CastingMode:options('Normal', 'Interrupt')
	
	gear.tank_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.dd_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	
	send_command('bind !` eh cycle')
	send_command('bind != input /ma Aquaveil <me>')
end


function init_gear_sets()
    sets.enmity = {		
		head="Halitus Helm",neck="Moonbeam Necklace",ear1="Odnowa Earring +1",ear2="Cryptic Earring",
		body="Emet Harness +1",hands="Kurys Gloves",ring1="Supershear Ring",ring2="Begrudging Ring",
		back=gear.tank_cape,waist="Goading Belt",legs="Erilaz Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.engaged = {ammo="Staunch Tathlum",
		head="Futhark Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Sherida Earring",
		body="Futhark Coat +3",hands="Turms Mittens",ring1="Moonbeam Ring", ring2="Defending Ring",
		back=gear.tank_cape, waist="Flume Belt", legs="Erilaz Leg Guards +1", feet="Turms Leggings"}
		
	sets.spell_interrupt = {ammo="Staunch Tathlum",
		head="Taeon Chapeau",neck="Moonbeam Necklace",ear1="Halasz Earring",
		body="Taeon Tabard",hands="Rawhide Gloves",ring1="Evanescence Ring",
		waist="Rumination Sash",legs="Carmine Cuisses +1",feet="Taeon Boots"
	}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.enmity, {body="Runeist Coat +1", legs="Futhark Trousers +2", back="Ogma's Cape"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.enmity, {feet="Runeist bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.enmity, {head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Lunge'] = { neck="Sanctity Necklace", ear1="Friomisi Earring", ear2="Crematio Earring",
            body="Samnuha Coat", hands="Leyline Gloves",ring1="Acumen Ring", ring2="Sangoma Ring",
            back="Toro Cape", waist="Hachirin-no-obi", legs="Samnuha Tights", feet="Herculean Boots"}
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = {hands="Runeist Mitons +1"}
    sets.precast.JA['Rayke'] = {feet="Futhark Boots"}
    sets.precast.JA['Elemental Sforzo'] = {body="Futhark Coat +3"}
    sets.precast.JA['Swordplay'] = {hands="Futhark Mitons"}
    sets.precast.JA['Embolden'] = {}
    sets.precast.JA['Vivacious Pulse'] = {}
    sets.precast.JA['One For All'] = {}
    sets.precast.JA['Provoke'] = sets.enmity


	-- Fast cast sets for spells
    sets.precast.FC = {head="Carmine Mask +1",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Kishar Ring",neck="Orunmila's Torque"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +2"})
    sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})


	-- Weaponskill sets
	sets.precast.WS = {ammo="Seething Bomblet +1",
		head="Lustratio Cap +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.dd_cape,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Lustratio Leggings +1"}
	
	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		neck="Caro Necklace",hands="Meghanada Gloves +2",ring2="Ilabrat Ring",back=gear.wsd_cape,waist="Grunfeld Rope",legs="Lustratio Subligar +1"
	})
	sets.precast.WS['Shockwave'] = sets.precast.WS['Dimidiation']
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Carmine Cuisses +1"
	})
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
    sets.precast.WS['Herculean Slash'].Acc = set_combine(sets.precast.WS['Herculean Slash'], {})


	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Andoaa Earring", 
		body="Manasa Chasuble",hands="Runeist mitons +1",ring1="Stikini Ring",
		back="Merciful Cape",waist="Olympus Sash",legs="Carmine Cuisses +1"}
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
		head="Futhark Bandeau +1",
		body="Taeon Tabard",hands="Taeon Gloves",
		legs="Taeon Tights",feet="Taeon Boots"})
	sets.midcast['Protect'] = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast['Shell'] = sets.midcast['Protect']
    sets.midcast['Regen'] = {legs="Futhark Trousers +2"}
    sets.midcast['Stoneskin'] = sets.midcast['Enhancing Magic']
	sets.midcast['Aquaveil'] = sets.spell_interrupt
    sets.midcast.Cure = {ring1="Ephedra Ring", legs="Carmine Cuisses +1", feet="Futhark Boots"}
	
	sets.midcast['Blue Magic'] = set_combine(sets.precast.FC, sets.enmity)
	
	sets.midcast['Flash'] = sets.enmity
	sets.midcast['Flash'] = sets.enmity
	sets.midcast['Blue Magic'] = sets.enmity

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = set_combine(sets.engaged, {ammo="Homiliary",
		head="Rawhide Mask",neck="Bathy Choker +1",ear2="Infused Earring",
		body="Runeist Coat +1",ring1="Sheltered Ring",
		waist="Flume Belt",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"})
		
    sets.idle.Refresh = set_combine(sets.idle, {body="Runeist Coat +1", waist="Fucho-no-obi"})
           
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Futhark Bandeau +1",neck="Loricate Torque +1",left_ear="Odnowa Earring +1",right_ear="Sherida Earring",
		body="Futhark Coat +3",hands="Kurys Gloves",left_ring="Moonbeam Ring",right_ring="Defending Ring",
		back=gear.tank_cape,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"
	}
	sets.defense.HP = set_combine(sets.defense.PDT, {head="Halitus Helm",ear2="Odnowa Earring",hands="Runeist Mitons +1",back="Moonbeam Cape"})

	sets.defense.MDT = set_combine(sets.defense.PDT, {back="Moonbeam Cape"})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.idle.PDT = sets.engaged

	--------------------------------------
	-- Engaged sets
	--------------------------------------


	sets.engaged.HP = sets.defense.HP
	sets.engaged.TankDD = set_combine(sets.engaged, {
		head="Meghanada Visor +2",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Turms Mittens",
		back=gear.dd_cape,waist="Ioskeha Belt",legs="Meghanada Chausses +2",feet="Turms Leggings"
	})
	sets.engaged.DD = {ammo="Yamarang",
		head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back=gear.dd_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged.DD, {
		head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.dd_cape,waist="Olseni Belt",legs="Carmine Cuisses +1"})
    sets.engaged.PDT = sets.defense.PDT
    sets.engaged.MDT = sets.defense.MDT
    sets.engaged.repulse = {}
end
function user_setup()
    state.OffenseMode:options('Normal', 'TankDD', 'DD', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.IdleMode:options('Regen', 'Refresh', 'PDT', 'Knockback','Nyame')
	state.CastingMode:options('Normal', 'Interrupt', 'Safe')
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
	
	gear.tank_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.dd_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
	send_command('bind !` eh cycle')
	send_command('bind !- input /ma Aquaveil <me>')
	send_command('bind !f11 gs c cycle ExtraDefenseMode')
end


function init_gear_sets()
    sets.enmity = {		
		head="Halitus Helm",neck="Moonlight Necklace",ear1="Trux Earring",ear2="Cryptic Earring",
		body="Emet Harness +1",hands="Kurys Gloves",ring1="Supershear Ring",ring2="Begrudging Ring",
		back=gear.tank_cape,waist="Sulla Belt",legs="Erilaz Leg Guards +3",feet="Erilaz Greaves +3"}
		
	sets.enmity_dt = set_combine(sets.enmity, {ammo="Staunch Tathlum +1",head="Nyame Helm",neck="Futhark Torque +2",ear2="Odnowa Earring +1",
		body="Erilaz Surcoat +3",hands="Nyame Gauntlets",ring1="Moonlight Ring"})
	
	sets.spell_interrupt = {ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",neck="Moonlight Necklace",ear1="Halasz Earring",
		body="Taeon Tabard",hands="Rawhide Gloves",ring1="Evanescence Ring",
		legs="Carmine Cuisses +1",feet="Taeon Boots"
	}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {back="Repulse Mantle",legs="Dashing Subligar"}
    sets.MP = {ear1="Ethereal Earring",body="Erilaz Surcoat +3",waist="Flume Belt +1"}
    sets.MP_Knockback = set_combine(sets.Knockback, sets.MP, {feet="Erilaz Greaves +3"})

	sets.engaged = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Futhark Torque +2",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Erilaz Surcoat +3",hands="Turms Mittens +1",ring1="Moonlight Ring", ring2="Defending Ring",
		back=gear.tank_cape, waist="Ioskeha Belt +1", legs="Erilaz Leg Guards +3", feet="Turms Leggings +1"}
		
	sets.engaged.Knockback = set_combine(sets.engaged, sets.Knockback)
	sets.engaged.MP = set_combine(sets.engaged, sets.MP)
	sets.engaged.MP_Knockback = set_combine(sets.engaged, sets.MP_Knockback)
		
	sets.engaged.TankDD = set_combine(sets.engaged, {
		head="Nyame Helm",ear1="Telos Earring",ear2="Sherida Earring",
		body="Nyame Mail",hands="Turms Mittens +1",ring1="Lehko's Ring",
		back=gear.dd_cape,waist="Ioskeha Belt +1",legs="Nyame Flanchard",feet="Turms Leggings +1"
	})
	sets.engaged.TankDD.Knockback = set_combine(sets.engaged.TankDD, sets.Knockback)
	sets.engaged.TankDD.MP = set_combine(sets.engaged.TankDD, sets.MP)
	sets.engaged.TankDD.MP_Knockback = set_combine(sets.engaged.TankDD, sets.MP_Knockback)
	sets.engaged.TankDD.AM = set_combine(sets.engaged.TankDD, {
		body="Ashera Harness",waist="Gerdr Belt +1"
	})
	
	sets.engaged.DD = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Null Loop",ear1="Telos Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Lehko's Ring",ring2="Epona's Ring",
		back="Null Shawl",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.engaged.DD.AM = set_combine(sets.engaged.DD, {
		head="Erilaz Galea +3",body="Ashera Harness",ring2="Chirich Ring +1",waist="Gerdr Belt +1",legs="Volte Tights",feet="Carmine Greaves +1"
	})
	sets.engaged.Acc = set_combine(sets.engaged.DD, {
		head="Herculean Helm",neck="Null Loop",ear1="Telos Earring",ear2="Odr Earring",
		ring1="Niqmaddu Ring",ring2="Regal Ring",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Carmine Cuisses +1"})
    sets.engaged.PDT = set_combine(sets.defense.PDT, {})
    sets.engaged.MDT = set_combine(sets.defense.MDT, {})

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.enmity, {body="Runeist Coat +3", legs="Futhark Trousers +3", back="Ogma's Cape"})
    sets.precast.JA['Valiance'] = set_combine(sets.precast.JA['Vallation'], {})
    sets.precast.JA['Pflug'] = set_combine(sets.enmity, {feet="Runeist Bottes +3"})
    sets.precast.JA['Battuta'] = set_combine(sets.enmity, {head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Lunge'] = set_combine(sets.enmity,{
		head="Agwu's Cap",neck="Baetyl Pendant", ear1="Friomisi Earring", ear2="Crematio Earring",
		body="Agwu's Robe", hands="Agwu's Gages",ring1="Acumen Ring", ring2="Metamorph Ring +1",
		back="Toro Cape", waist="Orpheus's Sash", legs="Agwu's Slops", feet="Agwu's Pigaches"})
    sets.precast.JA['Swipe'] = set_combine(sets.precast.JA['Lunge'], {})
    sets.precast.JA['Gambit'] = set_combine(sets.enmity,{hands="Runeist Mitons +3"})
    sets.precast.JA['Rayke'] = set_combine(sets.enmity,{feet="Futhark Boots +3"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.enmity,{hands="Futhark Mitons +3"})
    sets.precast.JA['Embolden'] = {}
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +3",neck="Incanter's Torque",ring1=gear.rings.left,ring2=gear.rings.right}
    sets.precast.JA['One For All'] = set_combine(sets.enmity, {})
    sets.precast.JA['Provoke'] = set_combine(sets.enmity, {})


	-- Fast cast sets for spells
    sets.precast.FC = {head="Herculean Helm",neck="Baetyl Pendant",ear1="Etiolation Earring",
		body="Erilaz Surcoat +3",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Moonlight Cape",legs="Futhark Trousers +3",feet="Carmine Greaves +1"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})
    sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})


	sets.WSMAcc = {
		head="Erilaz Galea +3",neck="Null Loop",ear1="Crepuscular Earring",ear2="Erilaz Earring +1",
		body="Erilaz Surcoat +3",hands="Agwu's Gages",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",waist="Null Belt",legs="Erilaz Leg Guards +3",feet="Erilaz Greaves +3"
	}

	-- Weaponskill sets
	sets.precast.WS = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Nyame Mail",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Sroda Ring",
		back=gear.dd_cape,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Nyame Helm",neck="Republican Platinum Medal",ear2="Odr Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.wsd_cape,waist="Sailfi Belt +1",legs="Nyame Flanchard"
	})
	sets.precast.WS['Shockwave'] = set_combine(sets.engaged.TankDD, {})
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Null Masque",ear1="Telos Earring",ear2="Crepuscular Earring",
		body="Adhemar Jacket +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Carmine Cuisses +1"
	})
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast.JA['Lunge'], {})
    sets.precast.WS['Herculean Slash'].Acc = set_combine(sets.precast.WS['Herculean Slash'], {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS['Dimidiation'], {ring2="Sroda Ring"})

	sets.precast.WS['Armor Break'] = set_combine(sets.WSMAcc, {})
	sets.precast.WS['Shield Break'] = set_combine(sets.WSMAcc, {})
	sets.precast.WS['Weapon Break'] = set_combine(sets.WSMAcc, {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {
		head="Erilaz Galea +3",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring", 
		body="Manasa Chasuble",hands="Regal Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Merciful Cape",legs="Futhark Trousers +3"}
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
		head="Futhark Bandeau +3",
		body="Taeon Tabard",hands="Taeon Gloves",
		legs="Taeon Tights",feet="Taeon Boots"})
	sets.midcast['Temper'] = set_combine(sets.midcast['Enhancing Magic'], {hands="Runeist Mitons +3",legs="Carmine Cuisses +1"})
	sets.midcast['Protect'] = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast['Shell'] = set_combine(sets.midcast['Protect'], {})
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +3",waist="Gishdubar Sash"})
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{neck="Sacro Gorget",ear2="Erilaz Earring +1",waist="Sroda Belt",legs="Futhark Trousers +3"})
    sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Aquaveil'] = set_combine(sets.spell_interrupt, {})
    sets.midcast.Cure = {ring1="Haoma's Ring",waist="Sroda Belt",legs="Carmine Cuisses +1",feet="Futhark Boots +3"}
	sets.midcast['Magic Fruit'] = set_combine(sets.midcast.Cure, {})
	
	sets.midcast['Foil'] = set_combine(sets.enmity, {})
	sets.midcast['Flash'] = set_combine(sets.enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.enmity, {})
	

	sets.midcast['Refresh'].Safe = set_combine(sets.enmity_dt, {})
	sets.midcast['Shell'].Safe = set_combine(sets.enmity_dt, {})
	sets.midcast['Foil'].Safe = set_combine(sets.enmity_dt, {})
	sets.midcast['Flash'] = set_combine(sets.enmity_dt, {})
	sets.midcast['Blue Magic'] = set_combine(sets.enmity_dt, {})
	
	sets.midcast['Enhancing Magic'].Safe = set_combine(sets.enmity_dt, {})
	sets.midcast['Phalanx'].Safe = set_combine(sets.enmity_dt, {})
	sets.midcast['Aquaveil'].Safe = set_combine(sets.enmity_dt, {})

	sets.midcast['Dark Magic'] = set_combine(sets.enmity, {})
	sets.midcast['Elemental Magic'] = set_combine(sets.enmity, {})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = set_combine(sets.engaged, {ammo="Homiliary",
		head="Null Masque",neck="Republican Platinum Medal",ear2="Infused Earring",
		body="Runeist Coat +3",hands="Regal Gauntlets",ring1=gear.rings.left,
		waist="Null Belt",legs="Carmine Cuisses +1",feet="Erilaz Greaves +3"})
		
    sets.idle.Refresh = set_combine(sets.idle, {body="Runeist Coat +3",ring1=gear.rings.left,ring2=gear.rings.right,waist="Fucho-no-obi"})
           
	sets.defense.PDT = set_combine(sets.engaged, {})
	sets.defense.HP = set_combine(sets.defense.PDT, {ear2="Odnowa Earring +1",hands="Turms Mittens +1",back="Moonlight Cape"})
	sets.idle.Nyame = set_combine(sets.idle, {head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets"})

	sets.defense.MDT = set_combine(sets.defense.PDT, {back="Moonlight Cape"})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.idle.PDT = set_combine(sets.engaged, {})
	sets.idle.Knockback = set_combine(sets.idle.PDT, {head="Futhark Bandeau +3",hands="Runeist Mitons +3",back="Repulse Mantle",legs="Dashing Subligar",feet="Erilaz Greaves +3"})

	sets.buff.Doom = {neck="Nicander's Necklace",ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
end
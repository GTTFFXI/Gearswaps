function user_setup()
    state.OffenseMode:options('Normal', 'TankDD', 'RecoverMP', 'Knockback', 'DD', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.IdleMode:options('Regen', 'Refresh', 'PDT', 'Knockback','Nyame')
	state.CastingMode:options('Normal', 'Interrupt')
	
	gear.tank_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.dd_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
	send_command('bind !` eh cycle')
	send_command('bind != input /ma Aquaveil <me>')
end


function init_gear_sets()
    sets.enmity = {		
		head="Halitus Helm",neck="Moonlight Necklace",ear1="Trux Earring",ear2="Cryptic Earring",
		body="Emet Harness +1",hands="Kurys Gloves",ring1="Supershear Ring",ring2="Begrudging Ring",
		back=gear.tank_cape,waist="Sulla Belt",legs="Erilaz Leg Guards +2",feet="Erilaz Greaves +1"}
		
	sets.engaged = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Futhark Torque +2",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Runeist's Coat +3",hands="Turms Mittens +1",ring1="Moonlight Ring", ring2="Defending Ring",
		back=gear.tank_cape, waist="Ioskeha Belt +1", legs="Erilaz Leg Guards +2", feet="Turms Leggings +1"}
		
	sets.spell_interrupt = {ammo="Staunch Tathlum +1",
		head="Erilaz Galea +2",neck="Moonlight Necklace",ear1="Halasz Earring",
		body="Taeon Tabard",hands="Rawhide Gloves",ring1="Evanescence Ring",
		legs="Carmine Cuisses +1",feet="Taeon Boots"
	}
	
	sets.engaged.HP = sets.defense.HP
	sets.engaged.TankDDClassic = set_combine(sets.engaged, {
		head="Blistering Sallet +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Turms Mittens +1",
		back=gear.dd_cape,waist="Ioskeha Belt +1",legs="Meghanada Chausses +2",feet="Turms Leggings +1"
	})
	
	sets.engaged.TankDD = set_combine(sets.engaged, {
		head="Nyame Helm",ear1="Telos Earring",ear2="Sherida Earring",
		body="Nyame Mail",hands="Turms Mittens +1",
		back=gear.dd_cape,waist="Ioskeha Belt +1",legs="Nyame Flanchard",feet="Turms Leggings +1"
	})
	sets.engaged.RecoverMP = set_combine(sets.engaged.TankDD, {
		ear1="Ethereal Earring",body="Erilaz Surcoat +2"
	})
	
	sets.engaged.Knockback = set_combine(sets.engaged.TankDD, {back="Repulse Mantle",legs="Dashing Subligar"})
	sets.engaged.DD = {ammo="Yamarang",
		head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back=gear.dd_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.idle.Nyame = set_combine(sets.engaged, {head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	sets.engaged.Acc = set_combine(sets.engaged.DD, {
		head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Odr Earring",
		ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.dd_cape,waist="Ioskeha Belt +1",legs="Carmine Cuisses +1"})
    sets.engaged.PDT = sets.defense.PDT
    sets.engaged.MDT = sets.defense.MDT
    sets.engaged.repulse = {}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.enmity, {body="Runeist's Coat +3", legs="Futhark Trousers +3", back="Ogma's Cape"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.enmity, {feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'] = set_combine(sets.enmity, {head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.enmity, {body="Futhark Coat +3"})
    sets.precast.JA['Lunge'] = set_combine(sets.enmity,{ 
		head="Agwu's Cap",neck="Baetyl Pendant", ear1="Friomisi Earring", ear2="Crematio Earring",
		body="Agwu's Robe", hands="Agwu's Gages",ring1="Acumen Ring", ring2="Metamorph Ring +1",
		back="Toro Cape", waist="Orpheus's Sash", legs="Agwu's Slops", feet="Agwu's Pigaches"})
    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = set_combine(sets.enmity,{hands="Runeist's Mitons +3"})
    sets.precast.JA['Rayke'] = set_combine(sets.enmity,{feet="Futhark Boots"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.enmity,{hands="Futhark Mitons"})
    sets.precast.JA['Embolden'] = {}
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +2",neck="Incanter's Torque",ring1=gear.rings.left,ring2=gear.rings.right}
    sets.precast.JA['One For All'] = sets.enmity
    sets.precast.JA['Provoke'] = sets.enmity


	-- Fast cast sets for spells
    sets.precast.FC = {head="Herculean Helm",neck="Baetyl Pendant",ear1="Etiolation Earring",
		body="Erilaz Surcoat +2",hands="Leyline Gloves",ring1="Moonlight Ring",ring2="Kishar Ring",
		back="Moonlight Cape",legs="Futhark Trousers +3",feet="Carmine Greaves +1"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark Trousers +3"})
    sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})


	-- Weaponskill sets
	sets.precast.WS = {ammo="Seething Bomblet +1",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.dd_cape,waist="Fotia Belt",legs="Samnuha Tights",feet="Nyame Sollerets"}
	
	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Nyame Helm",neck="Republican Platinum Medal",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",
		back=gear.wsd_cape,waist="Sailfi Belt +1",legs="Nyame Flanchard"
	})
	sets.precast.WS['Shockwave'] = sets.engaged.TankDD
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Crepuscular Earring",
		body="Adhemar Jacket +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Carmine Cuisses +1"
	})
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast.JA['Lunge'], {})
    sets.precast.WS['Herculean Slash'].Acc = set_combine(sets.precast.WS['Herculean Slash'], {})


	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {
		head="Erilaz Galea +2",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring", 
		body="Manasa Chasuble",hands="Regal Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Merciful Cape",waist="Olympus Sash",legs="Futhark Trousers +3"}
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
		head="Futhark Bandeau +3",
		body="Taeon Tabard",hands="Taeon Gloves",
		legs="Taeon Tights",feet="Taeon Boots"})
	sets.midcast['Temper'] = set_combine(sets.midcast['Enhancing Magic'], {hands="Runeist's Mitons +3",legs="Carmine Cuisses +1"})
	sets.midcast['Protect'] = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast['Shell'] = sets.midcast['Protect']
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +2",waist="Gishdubar Sash"})
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{neck="Sacro Gorget",ear2="Erilaz Earring",legs="Futhark Trousers +3"})
    sets.midcast['Stoneskin'] = sets.midcast['Enhancing Magic']
	sets.midcast['Aquaveil'] = sets.spell_interrupt
    sets.midcast.Cure = {ring1="Haoma's Ring", legs="Carmine Cuisses +1", feet="Futhark Boots"}
	
	sets.midcast['Foil'] = sets.enmity
	sets.midcast['Flash'] = sets.enmity
	sets.midcast['Blue Magic'] = sets.enmity

	sets.midcast['Dark Magic'] = sets.enmity
	sets.midcast['Elemental Magic'] = sets.enmity
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = set_combine(sets.engaged, {ammo="Homiliary",
		head="Rawhide Mask",neck="Republican Platinum Medal",ear2="Infused Earring",
		body="Runeist's Coat +3",hands="Regal Gauntlets",ring1=gear.rings.left,
		waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"})
		
    sets.idle.Refresh = set_combine(sets.idle, {body="Runeist's Coat +3",ring1=gear.rings.left,ring2=gear.rings.right,waist="Fucho-no-obi"})
           
	sets.defense.PDT = sets.engaged
	sets.defense.HP = set_combine(sets.defense.PDT, {ear2="Odnowa Earring +1",hands="Turms Mittens +1",back="Moonlight Cape"})
	sets.idle.Nyame = set_combine(sets.idle, {head="Nyame Helm",body="Nyame Mail",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets"})

	sets.defense.MDT = set_combine(sets.defense.PDT, {back="Moonlight Cape"})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.idle.PDT = sets.engaged
	sets.idle.Knockback = set_combine(sets.idle.PDT, {head="Futhark Bandeau +3",hands="Runeist's Mitons +3",back="Repulse Mantle",legs="Dashing Subligar",feet="Erilaz Greaves +1"})

	--------------------------------------
	-- Engaged sets
	--------------------------------------



end
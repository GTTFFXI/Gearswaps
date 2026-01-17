function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Hybrid', 'AM3', 'Counter')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant', 'TH')
    state.IdleMode:options('Normal', 'PDT', 'Learning')

	gear.capes = {}
	gear.capes.tp = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','System: 1 ID: 640 Val: 4',}}
	gear.capes.ws = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','"Regen"+5',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
	-- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind @` input /ja "Burst Affinity" <me>')

    update_combat_form()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashishin Basmak +2"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +3", feet="Assimilator's Charuqs +3"}
	sets.buff.Convergence = {head="Luhlaza Keffiyeh +3"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {body="Luhlaza Jubbah +3"}
	sets.buff.Efflux = {legs="Hashishin Tayt +3"}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luhlaza Bazubands +3"}

	sets.TreasureHunter = {ammo="Perfect Lucky Egg",body="Volte Jupon",waist="Chaac Belt"}
	
	sets.enmity = {head="Rabid Visor",neck="Unmoving Collar +1",ear1="Cryptic Earring",ear2="Trux Earring",
		body="Emet Harness +1",hands="Nilas Gloves",ring1="Begrudging Ring",ring2="Supershear Ring",
		back="Reiki Cloak",waist="Sulla Belt",legs="Zoar Subligar +1",feet=""
	}
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Nyame Helm",
		hands="Adhemar Wristbands +1",
		back=gear.capes.ws,waist="Chaac Belt",feet="Herculean Boots"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="Herculean Helm",neck="Baetyl Pendant",
		body="Pinga Tunic +1",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +3"})

	   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Coiste Bodhar",
		head="Hashishin Kavuk +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back=gear.capes.ws,waist="Fotia Belt",legs="Gleti's Breeches",feet="Herculean Boots"}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",
		head="Null Masque",ear1="Odr Earring",ear2="Crepuscular Earring",
		body="Assimilator's Jubbah +3",ring1="Ilabrat Ring",ring2="Lehko's Ring",
		legs="Carmine Cuisses +1",feet="Assimilator's Charuqs +3"
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		ear2="Regal Earring",legs="Nyame Flanchard",feet="Nyame Sollerets"})

	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Epaminondas's Ring",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",
		head="Gleti's Mask",neck="Mirage Stole +2",ear1="Odr Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Begrudging Ring",ring2="Lehko's Ring",
		back="Null Shawl",legs="Gleti's Breeches",feet="Gleti's Boots"})
		
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		neck="Mirage Stole +2",ear1="Ishvara Earring",
		body="Nyame Mail",ring1="Epaminondas's Ring",ring2="Sroda Ring",
		back=gear.capes.ws,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Judgment'] = set_combine(sets.precast.WS['Black Halo'], {})
	
	sets.precast.WS['Seraph Strike'] = set_combine(sets.precast.WS['Sanguine Blade'], {head="Nyame Helm",ring1="Acumen Ring",feet="Nyame Sollerets"})
	sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS['Seraph Strike'], {})
	sets.precast.WS['Red Lotus Blade'] = set_combine(sets.precast.WS['Seraph Strike'], {})
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Herculean Helm",
		body="Nyame Mail",ring1="Kishar Ring",
		back="Perimede Cape",neck="Baetyl Pendant"}
		
	sets.midcast['Blue Magic'] = {}
	
	-- Physical Spells --
	
	sets.midcast['Blue Magic'].Physical = {
		head="Luhlaza Keffiyeh +3",neck="Mirage Stole +2",ear1="Dignitary's Earring",ear2="Crepuscular Earring",
		body="Assimilator's Jubbah +3",hands="Rawhide Gloves",ring1="Ilabrat Ring",ring2="Shukuyu Ring",
		back="Cornflower Cape",waist="Null Belt",legs="Hashishin Tayt +3",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].PhysicalAcc = {
		head="Null Masque",neck="Mirage Stole +2",ear1="Odr Earring",ear2="Crepuscular Earring",
		body="Assimilator's Jubbah +3",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Lehko's Ring",
		back="Cornflower Cape",waist="Null Belt",legs="Hashishin Tayt +3",feet="Assimilator's Charuqs +3"}

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
		{ear1="Odr Earring",ring1="Ilabrat Ring",ring2="Lehko's Ring"})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
		{ring1="Ilabrat Ring"})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
		{back="Toro Cape"})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})


	-- Magical Spells --
	
	sets.midcast['Blue Magic'].Magical = {ammo="Mavi Tathlum",
		head="Hashishin Kavuk +3",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Regal Earring",
		body="Hashishin Mintan +3",hands="Hashishin Bazubands +3",ring1="Metamorph Ring +1",ring2="Acumen Ring",
		back="Cornflower Cape",waist="Orpheus's Sash",legs="Hashishin Tayt +3",feet="Hashishin Basmak +2"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
		neck="Null Loop",ear1="Dignitary's Earring",ear2="Crepuscular Earring",ring1=gear.rings.left,ring2=gear.rings.right,back="Null Shawl"})
		
	sets.midcast['Blue Magic'].Magical.TH = set_combine(sets.midcast['Blue Magic'].Magical, sets.TreasureHunter)
	
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,	{})

	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {ammo="Mavi Tathlum",
		head="Hashishin Kavuk +3",neck="Mirage Stole +2",ear1="Crepuscular Earring",ear2="Hashishin Earring +1",waist="Acuity Belt +1"
	})

	-- Breath Spells --
	
	sets.midcast['Blue Magic'].Breath = {
		head="Luhlaza Keffiyeh +3",neck="Mirage Stole +2",
		body="Carmine Cuisses +1",
		feet="Herculean Boots"}

	-- Other Types --
	
	sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy)
		
	sets.midcast['Blue Magic']['White Wind'] = {
		head="Telchine Cap",neck="Unmoving Collar +1",ear1="Alabaster Earring",ear2="Tuisto Earring",
		body="Pinga Tunic +1",hands="Telchine Gloves",ring1="Ilabrat Ring",ring2="Meridian Ring",
		back="Moonlight Cape",waist="Platinum Moogle Belt",legs="Pinga Pants +1",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'].Healing = {
		head="Telchine Cap",ear1="Mendicant's Earring",
		body="Pinga Tunic +1",hands="Telchine Gloves",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Solemnity Cape",legs="Pinga Pants +1",feet="Nyame Sollerets"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh +3",neck="Mirage Stole +2",ear1="Njordr Earring",ear2="Hashishin Earring +1",
		body="Assimilator's Jubbah +3",hands="Rawhide Gloves",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Cornflower Cape",legs="Hashishin Tayt +3",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Buff = set_combine(sets.midcast['Blue Magic'].SkillBasedBuff, {})
	
	sets.midcast['Tenebral Crush'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		head="Pixie Hairpin +1",ring2="Archon Ring"
	})
	sets.midcast['Subduction'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		waist="Orpheus's Sash"
	})
	sets.midcast['Subduction'].TH = set_combine(sets.midcast['Blue Magic'].Magical, sets.TreasureHunter)
	
	sets.midcast['Blue Magic']['Feather Tickle'] = {ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +3",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Hashishin Earring +1",
		body="Hashishin Mintan +3",hands="Hashishin Bazubands +3",ring2="Metamorph Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Assimilator's Shalwar +3",feet="Hashishin Basmak +2"
    }
	sets.midcast['Blue Magic']['Reaving Wind'] = set_combine(sets.midcast['Blue Magic']['Feather Tickle'], {})
	
	sets.midcast['Blue Magic']['Jettatura'] = set_combine(sets.enmity, {})
	sets.midcast['Blue Magic']['Actinic Burst'] = set_combine(sets.enmity, {})
	sets.midcast['Blue Magic']['Blinding Fulgor'] = set_combine(sets.enmity, {})
	sets.midcast['Blue Magic']['Fantod'] = set_combine(sets.enmity, {})
	
	sets.midcast.Protect = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	sets.midcast.Protectra = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	sets.midcast.Shell = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	sets.midcast.Shellra = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	
	sets.midcast['Elemental Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {})
	
	-- Sets to return to when not performing an action.
	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {
		head="Luhlaza Keffiyeh +3",neck="Mirage Stole +2",
		body="Assimilator's Jubbah +3",hands="Assimilator's Bazubands +3",
		back="Cornflower Cape",legs="Hashishin Tayt +3",feet="Luhlaza Charuqs +3"}


	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Idle sets
	sets.idle = {
		head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		body="Hashishin Mintan +3",hands="Gleti's Gauntlets",ring1=gear.rings.left,ring2="Murky Ring",
		back=gear.capes.ws,waist="Null Belt",legs="Carmine Cuisses +1",feet="Gleti's Boots"}

	sets.idle.PDT = {
		head="Null Masque",neck="Null Loop",ear1="Alabaster Earring",
		body="Hashishin Mintan +3",hands="Malignance Gloves",ring1="Defending Ring",ring2="Murky Ring",
		back=gear.capes.ws,waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Learning = set_combine(sets.idle, sets.Learning)

	-- Resting sets
	sets.resting = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = set_combine(sets.defense.PDT,{})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Mirage Stole +2",ear1="Suppanomimi",ear2="Hashishin Earring +1",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Epona's Ring",ring2="Lehko's Ring",
		back="Null Shawl",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}

	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",neck="Null Loop",body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
			
	sets.engaged.Acc = set_combine(sets.engaged, {ammo="Coiste Bodhar",
		head="Hashishin Kavuk +3",neck="Mirage Stole +2",ear1="Odr Earring",ear2="Hashishin Earring +1",
		body="Assimilator's Jubbah +3",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Lehko's Ring",
		waist="Null Belt",legs="Carmine Cuisses +1",feet="Assimilator's Charuqs +3"})

	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)	
		
	sets.engaged.Refresh = set_combine(sets.engaged, {body="Assimilator's Jubbah +3"})

	sets.engaged.DW = set_combine(sets.engaged, {})

	sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.DW.PDT = set_combine(sets.engaged.PDT, {})
	sets.engaged.DW.Refresh = set_combine(sets.engaged.Refresh, {})
	
	sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
	sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)
	
	sets.engaged.AM3 = set_combine(sets.engaged, {
		head="Hashishin Kavuk +3",body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Lehko's Ring",
		waist="Gerdr Belt +1",legs="Malignance Tights",feet="Malignance Boots"})

	sets.engaged.Counter = set_combine(sets.engaged, {
		head="Gleti's Mask",waist="Cornelia's Belt"
	})
	sets.engaged.Counter.AM3 = set_combine(sets.engaged.AM3, {head="Gleti's Mask",waist="Cornelia's Belt"})

	sets.engaged.DW.AM3 = set_combine(sets.engaged.AM3, {})

	sets.assault = {ammo="Staunch Tathlum +1",
		head=empty,neck="Null Loop",ear1="Alabaster Earring",ear2="Infused Earring",
		body=empty,hands=empty,ring1="Defending Ring",ring2="Murky Ring",
		back=gear.capes.ws,waist="Flume Belt +1",legs=empty,feet=empty}
	
	sets.WeatherObi = {waist="Hachirin-no-obi"}
end
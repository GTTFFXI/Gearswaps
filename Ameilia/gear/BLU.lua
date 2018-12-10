function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'PDT', 'Learning')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Learning')

	gear.capes = {}
	gear.capes.tp = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.capes.ws = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%'}}
	
	-- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind @` input /ja "Burst Affinity" <me>')

    update_combat_form()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +1", feet="Assimilator's Charuqs +2"}
	sets.buff.Convergence = {head="Luhlaza Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {body="Luhlaza Jubbah +1"}
	sets.buff.Efflux = {legs="Hashishin Tayt +1"}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}

	sets.TreasureHunter = {waist="Chaac Belt"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Herculean Helm",
		body="Ischemia Chasu.",hands="Adhemar Wristbands +1",
		back="Moonbeam Cape",waist="Chaac Belt",feet="Herculean Boots"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="Carmine Mask +1",ear2="Loquacious Earring",
		ring1="Kishar Ring",ring2="Veneficium Ring",hands="Leyline Gloves",
		back="Perimede Cape",waist="Witful Belt",neck="Orunmila's Torque",legs="Lengo Pants"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Mavi Mintan +2"})

	   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Assimilator's Jubbah +3",hands="Jhakri Cuffs +2",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back=gear.capes.ws,waist="Fotia Belt",legs="Samnuha Tights",feet="Herculean Boots"}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Falcon Eye",
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Assimilator's Jubbah +3",hands="Assimilator's Bazubands +3",ring1="Ilabrat Ring",ring2="Cacoethic Ring +1",
		legs="Carmine Cuisses +1",feet="Assimilator's Charuqs +2"
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		head="Jhakri Coronal +2",body="Jhakri Robe +2",legs="Jhakri Slops +2",feet="Amalric Nails +1"})

	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
		head="Pixie Hairpin +1",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Jhakri Robe +2",ring1="Archon Ring",ring2="Shiva Ring +1",
		back="Toro Cape",legs="Jhakri Slops +2",feet="Amalric Nails +1"})
	
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Falcon Eye",
		head="Adhemar Bonnet +1",ear1="Mache Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Ilabrat Ring",ring2="Begrudging Ring",
		legs="Samnuha Tights",feet="Thereoid Greaves"})
		
	sets.precast.WS['Chant du Cygne'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Requiescat'].Acc = sets.precast.WS.Acc
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask +1",ear2="Loquacious Earring",
		body="Samnuha Coat",ring1="Kishar Ring",
		back="Perimede Cape",neck="Orunmila's Torque"}
		
	sets.midcast['Blue Magic'] = {}
	
	-- Physical Spells --
	
	sets.midcast['Blue Magic'].Physical = {
		head="Luh. Keffiyeh +1",neck="Mirage Stole +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Assimilator's Jubbah +3",hands="Rawhide Gloves",ring1="Ilabrat Ring",ring2="Shukuyu Ring",
		back="Cornflower Cape",waist="Olseni Belt",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +1"}

	sets.midcast['Blue Magic'].PhysicalAcc = {
		head="Carmine Mask +1",neck="Mirage Stole +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Assimilator's Jubbah +3",hands="Assimilator's Bazubands +3",ring1="Ilabrat Ring",ring2="Cacoethic Ring +1",
		back="Cornflower Cape",waist="Olseni Belt",legs="Hashishin Tayt +1",feet="Assimilator's Charuqs +2"}

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
		{ring2="Ramuh Ring +1"})

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

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)


	-- Magical Spells --
	
	sets.midcast['Blue Magic'].Magical = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Jhakri Robe +2",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Acumen Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Amalric Nails +1"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
		ear1="Gwati Earring",ear2="Dignitary's Earring",
		body="Jhakri Robe +2",hands="Amalric Gages +1",ring1="Sangoma Ring",ring2="Stikini Ring"})
	
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicAccuracy = sets.midcast['Blue Magic'].Magical.Resistant

	-- Breath Spells --
	
	sets.midcast['Blue Magic'].Breath = {
		head="Luhlaza Keffiyeh +1",neck="Mirage Stole +1",
		body="Carmine Cuisses +1",
		feet="Herculean Boots"}

	-- Other Types --
	
	sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy)
		
	sets.midcast['Blue Magic']['White Wind'] = {
		neck="Mirage Stole +1",ear1="Mendicant's Earring",ear2="Loquacious Earring",
		body="Ischemia Chasu.",hands="Adhemar Wristbands +1",
		back="Pahtli Cape",legs="Gyve Trousers",feet="Herculean Boots"}

	sets.midcast['Blue Magic'].Healing = {
		ear2="Loquacious Earring",body="Ischemia Chasu.",ear1="Mendicant's Earring",
		hands="Jhakri Cuffs +2",ring1="Sirona's Ring",
		back="Pahtli Cape",legs="Gyve Trousers",feet="Herculean Boots"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {
		head="Luhlaza Keffiyeh +1",neck="Mirage Stole +1",
		body="Assimilator's Jubbah +3",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +1"}

	sets.midcast['Blue Magic'].Buff = sets.midcast['Blue Magic'].SkillBasedBuff
	
	sets.midcast['Tenebral Crush'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		head="Pixie Hairpin +1",ring2="Archon Ring"
	})
	sets.midcast['Subduction'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		waist="Chaac Belt"
	})
	
	sets.midcast.Protect = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	sets.midcast.Protectra = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	sets.midcast.Shell = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	sets.midcast.Shellra = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	
	sets.midcast['Elemental Magic'] = sets.midcast['Blue Magic'].Magical
	
	-- Sets to return to when not performing an action.
	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {
		head="Luhlaza Keffiyeh +1",neck="Mirage Stole +1",
		body="Assimilator's Jubbah +3",hands="Assimilator's Bazubands +3",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +1"}


	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Idle sets
	sets.idle = {
		head="Rawhide Mask",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Serpentes Sabots"}

	sets.idle.PDT = {
		neck="Loricate Torque +1",
		body="Ayanmo Corazza +2",hands="Assimilator's Bazubands +3",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Herculean Boots"}

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Learning = set_combine(sets.idle, sets.Learning)

	-- Resting sets
	sets.resting = sets.idle
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		neck="Loricate Torque +1",
		body="Ayanmo Corazza +2",hands="Assimilator's Bazubands +3",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Ayanmo Cosciales +2",feet="Herculean Boots"}

	sets.defense.MDT = {ammo="Staunch Tathlum",
		neck="Loricate Torque +1",ear1="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Assimilator's Bazubands +3",ring1="Fortified Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Ayanmo Cosciales +2",feet="Herculean Boots"}

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Mirage Stole +1",ear1="Telos Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back=gear.capes.tp,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}

	sets.engaged.Trivial = set_combine(sets.engaged, {})
			
	sets.engaged.Acc = set_combine(sets.engaged, {ammo="Falcon Eye",
		head="Carmine Mask +1",neck="Mirage Stole +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Assimilator's Jubbah +3",hands="Assimilator's Bazubands +3",ring1="Ilabrat Ring",ring2="Cacoethic Ring +1",
		waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Assimilator's Charuqs +2"})

	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)	
		
	sets.engaged.Refresh = set_combine(sets.engaged, {body="Assimilator's Jubbah +3"})

	sets.engaged.DW = sets.engaged

	sets.engaged.DW.Acc = sets.engaged.Acc
	sets.engaged.DW.PDT = sets.engaged.PDT
	sets.engaged.DW.Refresh = sets.engaged.Refresh
	
	sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
	sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)
	
	sets.WeatherObi = {waist="Hachirin-no-obi"}
end
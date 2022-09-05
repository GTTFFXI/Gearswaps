-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc', 'SuperAcc')
	state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'EP')
	state.WeaponskillMode:options('Normal', 'Acc')
	
	gear.default.weaponskill_neck = "Iskur Gorget"
	gear.default.weaponskill_waist = "Elanid Belt"

	elementalObiWS = {
		["Trueflight"] = {element="Light"},
		["Wildfire"] = {element="Fire"}
	}

	gear.melee = {}
    gear.melee.feet = { name="Herculean Boots", augments={'Accuracy+29','"Triple Atk."+4',}}
	
	gear.rng = {}
    gear.rng.feet = {name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Sklchn.dmg.+4%','Rng.Acc.+14',}}
	gear.rng.back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10','Phys. dmg. taken-10%',}}

	gear.mab = {}
    gear.mab.feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+12',}}

	gear.wsd = {}
	gear.wsd.back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	
	gear.crit = {}
	gear.crit.back= { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	
	DefaultAmmo = {['Yoichinoyumi'] = "Yoichi's Arrow", ['Annihilator'] = "Chrono Bullet", ['Fomalhaut'] = "Chrono Bullet", ['Accipiter'] = "Yoichi's Arrow"}
	U_Shot_Ammo = {['Yoichinoyumi'] = "Hauksbok Arrow", ['Annihilator'] = "Chrono Bullet", ['Accipiter'] = "Hauksbok Arrow"}

	send_command('bind f9 gs c cycle RangedMode')
	send_command('bind ^f9 gs c cycle OffenseMode')
	
	windower.add_to_chat(8, 'REMINDER: Your JSE is on storage slips 18,21,24,25,26,27. //lua l porterpacker and //po unpack to get it.')
end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {hands="Amini Glovelettes +1", waist="Chaac Belt"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +2"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +2"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Sharpshot'] = {}
	sets.precast.JA['Velocity Shot'] = {head="Amini Gapette +1",body="Amini Caban +2",back=gear.rng.back}


	-- Fast cast sets for spells

	sets.precast.FC = {head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Etiolation Earring",
		hands="Leyline Gloves",ring1="Kishar Ring",
		legs="Gyve Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Amini Gapette +1",
		body="Amini Caban +2",hands="Carmine Finger Gauntlets +1",ring2="Regal Ring",
		back=gear.rng.back,waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Meghanada Jambeaux +2"}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Nyame Helm",neck="Iskur Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Amini Caban +2",hands="Nyame Gauntlets",ring1="Dingir Ring",ring2="Epaminondas's Ring",
		back=gear.wsd.back,waist="Fotia Belt",legs="Arcadian Braccae +3",feet="Nyame Sollerets" }

	sets.precast.WS['Wildfire'] = {ammo="Devastating Bullet",
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Dingir Ring",ring2="Epaminondas's Ring",
        back=gear.wsd.back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS["Trueflight"] = sets.precast.WS['Wildfire']
	sets.precast.WS["Hot Shot"] = sets.precast.WS['Wildfire']
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Hauksbok Arrow",
		neck="Republican Platinum Medal",body="Nyame Mail",ring1="Shukuyu Ring",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		neck="Iskur Gorget",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Cacoethic Ring +1",ring2="Regal Ring",
		feet="Malignance Boots"
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Jishnu's Radiance"] = set_combine(sets.precast.WS, {ear1="Odr Earring"})

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Arcadian Beret +3",
		ring1="Kishar Ring",
		legs="Arc. Braccae +3",feet="Orion Socks +2"}

	sets.midcast.Utsusemi = {}

	-- Ranged sets

	sets.midcast.RA = {
		head="Arcadian Beret +3",neck="Iskur Gorget",ear1="Telos earring",ear2="Crepuscular Earring",
		body="Amini Caban +2",hands="Malignance Gloves",ring1="Dingir Ring",ring2="Regal Ring",
		back=gear.rng.back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{neck="Iskur Gorget",ear1="Telos Earring",ring1="Cacoethic Ring +1",waist="Eschan Stone"})

	sets.midcast.RA.SuperAcc = set_combine(sets.midcast.RA.Acc,
		{head="Malignance Chapeau",body="Malignance Tabard"})

	--crit fishing
	sets.midcast.RA.AM = set_combine(sets.midcast.RA, {
		head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Odr Earring",
		body="Meghanada Cuirie +2",hands="Mummu Wrists +2",ring1="Mummu Ring",ring2="Begrudging Ring",
		back=gear.crit.back,waist="Kwahu Kachina Belt +1",legs="Mummu Kecks +2",feet="Oshosi Leggings"
	})

		
	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA)

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc)

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {ear1="Telos Earring",ring2="Chirich Ring +1"})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {ear1="Telos Earring"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Malignance Chapeau",neck="Republican Platinum Medal",ear1="Telos Earring",ear2="Infused Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Eschan Stone",legs="Carmine Cuisses +1",feet="Malignance Boots"}
	sets.idle.Town = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {
		ring1="Purity Ring"})

	sets.Kiting = {feet="Skd. Jambeaux +1"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back=gear.rng.back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.melee.feet}
	
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Carmine Mask +1",ear2="Odr Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Cacoethic Ring +1",ring2="Chirich Ring +1",
		waist="Eschan Stone",legs="Carmine Cuisses +1",feet="Malignance Boots"
	})
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	sets.engaged.EP = set_combine(sets.engaged.Hybrid, {
		neck="Iskur Gorget",ring2="Chirich Ring +1",
	})
	
	sets.WeatherObi = {waist="Hachirin-no-obi"}
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +3"})
	sets.buff.Camouflage = {body="Orion Jerkin +2"}
	sets.buff['Double Shot'] = {body="Arcadian Jerkin +3"}
end
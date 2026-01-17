-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc', 'SuperAcc')
	state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'EP')
	state.WeaponskillMode:options('Normal', 'Acc', 'PDL')
	
	gear.default.weaponskill_neck = ""
	gear.default.weaponskill_waist = ""

	elementalObiWS = {
		["Trueflight"] = {element="Light"},
		["Wildfire"] = {element="Fire"}
	}

	gear.melee = {}
    gear.melee.feet = { name="Herculean Boots", augments={'Accuracy+29','"Triple Atk."+4',}}
	gear.melee.back = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	
	gear.rng = {}
    gear.rng.feet = {name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Sklchn.dmg.+4%','Rng.Acc.+14',}}
	gear.rng.back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10','Phys. dmg. taken-10%',}}

	gear.mab = {}
    gear.mab.feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+12',}}

	gear.wsd = {}
	gear.wsd.back = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.wsd.meleeback = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	
	gear.crit = {}
	gear.crit.back= { name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	
	DefaultAmmo = {
		['Yoichinoyumi'] = "Chrono Arrow", 
		['Annihilator'] = "Chrono Bullet", 
		['Fomalhaut'] = "Chrono Bullet", 
		['Accipiter'] = "Chrono Arrow", 
		['Armageddon'] = "Chrono Bullet", 
		['Gastraphetes'] = "Quelling Bolt", 
		['Gandiva'] = "Chrono Arrow"}
	U_Shot_Ammo = {
		['Yoichinoyumi'] = "Hauksbok Arrow", 
		['Annihilator'] = "Chrono Bullet", 
		['Fomalhaut'] = "Chrono Bullet", 
		['Accipiter'] = "Hauksbok Arrow", 
		['Armageddon'] = "Chrono Bullet", 
		['Gastraphetes'] = "Quelling Bolt", 
		['Gandiva'] = "Chrono Arrow"}

	send_command('bind f9 gs c cycle RangedMode')
	send_command('bind ^f9 gs c cycle OffenseMode')
end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {body="Volte Jupon",hands="Amini Glovelettes +3", waist="Chaac Belt"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +3"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +3"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Sharpshot'] = {}
	sets.precast.JA['Velocity Shot'] = {body="Amini Caban +3",back=gear.rng.back}


	-- Fast cast sets for spells

	sets.precast.FC = {head="Herculean Helm",neck="Baetyl Pendant",
		hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche RIng",
		legs="Gyve Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Ikenga's Hat",neck="Scout's Gorget +2",
		body="Ikenga's Vest",hands="Ikenga's Gloves",ring1="Crepuscular Ring",
		back=gear.rng.back,waist="Yemaya Belt",legs="Oshosi Trousers +1",feet="Meghanada Jambeaux +2"}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Amini Caban +3",hands="Nyame Gauntlets",ring1="Dingir Ring",ring2="Regal Ring",
		back=gear.wsd.back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets" 
	}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		neck="Scout's Gorget +2",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Lehko's Ring",ring2="Regal Ring",
		feet="Malignance Boots"
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Jishnu's Radiance"] = set_combine(sets.precast.WS, {ear1="Odr Earring",ear2="Amini Earring +1",hands="Amini Glovelettes +3",ring1="Lehko's Ring",back=gear.crit.back})

	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {ring1="Dingir Ring"})
	
	sets.precast.WS["Coronach"] = set_combine(sets.precast.WS, {ring1="Epaminondas's Ring"})

	sets.precast.WS['Wildfire'] = {
		head="Nyame Helm",neck="Scout's Gorget +2",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Dingir Ring",ring2="Epaminondas's Ring",
        back=gear.wsd.back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS["Trueflight"] = set_combine(sets.precast.WS['Wildfire'], {ear1="Moonshade Earring",ring2="Weatherspoon Ring +1"})
	sets.precast.WS["Hot Shot"] = set_combine(sets.precast.WS['Wildfire'], {ear1="Moonshade Earring"})
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Hauksbok Arrow",
		neck="Republican Platinum Medal",body="Nyame Mail",ring1="Sroda Ring",
		back=gear.wsd.meleeback,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
	
	sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], {
		neck="Scout's Gorget +2",ear2="Amini Earring +1"
	})

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Arcadian Beret +4",
		ring1="Kishar Ring",
		legs="Arc. Braccae +3",feet="Orion Socks +3"}

	sets.midcast.Utsusemi = {}

	-- Ranged sets

	sets.midcast.RA = {
		head="Arcadian Beret +4",neck="Scout's Gorget +2",ear1="Dedition earring",ear2="Crepuscular Earring",
		body="Nisroch Jerkin",hands="Amini Glovelettes +3",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back=gear.crit.back,waist="Tellen Belt",legs="Amini Bragues +3",feet="Ikenga's Clogs"}
		
	sets.midcast.RA.Gandiva = set_combine(sets.midcast.RA, {
		
	})
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{neck="Null Loop",ear1="Alabaster Earring",back="Null Shawl"})

	sets.midcast.RA.SuperAcc = set_combine(sets.midcast.RA.Acc,
		{head="Malignance Chapeau",body="Malignance Tabard"})

	--crit fishing
	sets.midcast.RA.AM = set_combine(sets.midcast.RA, {
		head="Meghanada Visor +2",neck="Scout's Gorget +2",ear1="Odr Earring",ear2="Amini Earring +1",
		body="Nisroch Jerkin",hands="Mummu Wrists +2",ring1="Lehko's Ring",ring2="Begrudging Ring",
		back=gear.crit.back,waist="Kwahu Kachina Belt +1",legs="Amini Bragues +3",feet="Oshosi Leggings +1"
	})
	sets.midcast.RA.Gandiva.AM = set_combine(sets.midcast.RA.AM, {})

		
	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA)

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc)

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {ear1="Dedition Earring",ring2="Chirich Ring +1"})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {ear1="Dedition Earring"})
	
	sets.precast.JA['Eagle Eye Shot'] = set_combine(sets.midcast.RA.AM, {legs="Arcadian Braccae +3"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Sheltered Ring",ring2="Murky Ring",
		back=gear.rng.back,waist="Null Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
	sets.idle.Town = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {})

	sets.Kiting = {feet="Skd. Jambeaux +1"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		head="Malignance Chapeau",neck="Scout's Gorget +2",ear1="Sherida Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Tatenashi Gote +1",ring1="Lehko's Ring",ring2="Epona's Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Tatenashi Haidate +1",feet="Tatenashi Sune-Ate +1"}
	
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Null Masque",ear2="Odr Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		waist="Null Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"
	})
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",ear1="Alabaster Earring",body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	sets.engaged.EP = set_combine(sets.engaged.Hybrid, {
		neck="Scout's Gorget +2",ring2="Chirich Ring +1",
	})
	
	sets.WeatherObi = {waist="Hachirin-no-obi"}
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +3"})
	sets.buff.Camouflage = {body="Orion Jerkin +3"}
	sets.buff['Double Shot'] = {head="Oshosi Mask +1",body="Arcadian Jerkin +4",legs="Oshosi Trousers +1",feet="Oshosi Leggings +1"}
end
function user_setup()
    state.OffenseMode:options('Normal', 'EP', 'Acc','Hybrid', 'AM')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Proc')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    gear.default.weaponskill_neck = "Platinum Republican Medal"
    gear.default.weaponskill_waist = "Caudata Belt"
    
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	gear.back={}
	gear.back.melee={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.back.ws={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	
    -- Additional local binds
    send_command('bind ^= gs c cycle mainstep')
    send_command('bind ^- gs c toggle selectsteptarget')
    send_command('bind !- gs c toggle usealtstep')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs

	sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +3"}

	sets.precast.JA['Trance'] = {head="Horos Tiara +3"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Horos Tiara +3",neck="Etoile Gorget +2",ear1="Handler's Earring +1",ear2="Handler's Earring",
		body="Maxixi Casaque +3",hands="Gleti's Gauntlets",ring1="Metamorph Ring +1",
		waist="Chaac Belt",legs="Nyame Flanchard",feet="Maxixi Toe Shoes +3"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = set_combine(sets.precast.Waltz, {})
	
	sets.precast.Samba = {head="Maxixi Tiara +3",back=gear.back.melee}

	sets.precast.Jig = {feet="Maxixi Toe Shoes +3"}

	sets.precast.Step = {
		head="Maxixi Tiara +3",neck="Etoile Gorget +2",ear1="Odr Earring",ear2="Telos Earring",
		body="Volte Jupon",hands="Gleti's Gauntlets",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Chaac Belt",legs="Gleti's Breeches",feet="Horos Toe Shoes +3"}

	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {
		head="Maculele Tiara +3",neck="Etoile Gorget +2",ear1="Crepuscular Earring",ear2="Dignitary's Earring",
		body="Maxixi Casaque +3",hands="Gleti's Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Chaac Belt",legs="Gleti's Breeches",feet="Gleti's Boots"} -- magic accuracy
	sets.precast.Flourish1['Desperate Flourish'] = set_combine(sets.precast.Flourish1['Violent Flourish'], {})

	sets.precast.Flourish2 = {}
	sets.precast.Flourish2['Reverse Flourish'] = {hands="Maculele Bangles +1"}

	sets.precast.Flourish3 = {}
	sets.precast.Flourish3['Striking Flourish'] = {}
	sets.precast.Flourish3['Climactic Flourish'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Nyame Helm",hands="Adhemar Wristbands +1",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Oshasha's Treatise",
		head="Maculele Tiara +3",neck="Etoile Gorget +2",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=gear.back.ws,waist="Gerdr Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Crepuscular Earring",ear2="Telos Earring"
	})
	sets.precast.WS.Proc = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Crepuscular Earring",ear2="Dignitary's Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Chirich Ring +1",
		back="Repulse Mantle",waist="Platinum Moogle Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Ilabrat Ring",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	
	sets.precast.WS['Aeolian Edge'].Proc = set_combine(sets.precast.WS.Proc, {})
	-- Midcast Sets
	
	sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {
		body="Gleti's Cuirass",hands="Adhemar Wristbands +1",ring2="Gere Ring",
		waist="Fotia Belt",legs="Gleti's Breeches"
	})
	
	sets.midcast.FastRecast = {hands="Leyline Gloves"}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {neck="Bathy Choker +1",
		ring1="Sheltered Ring",ring2="Defending Ring"}
	sets.ExtraRegen = {}
	

	-- Idle sets

	sets.idle = {
		head="Null Masque",neck="Republican Platinum Medal",ear1="Sherida Earring",ear2="Infused Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Null Belt",legs="Gleti's Breeches",feet="Skadi's Jambeaux +1"}

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = set_combine(sets.idle, {})
	
	-- Defense sets

	sets.defense.Evasion = {
		head="Malignance Chapeau",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		back=gear.back.melee,legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.PDT = set_combine(sets.defense.Evasion, {})

	sets.defense.MDT = set_combine(sets.defense.PDT, {back="Moonlight Cape"})
	
	sets.Kiting = {feet="Skadi's Jambeaux +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Etoile Gorget +2",ear1="Sherida Earring",ear2="Telos Earring",
		body="Horos Casaque +3",hands="Adhemar Wristbands +1",ring1="Lehko's Ring",ring2="Gere Ring",
		back=gear.back.melee,waist="Sailfi Belt +1",legs="Samnuha Tights",feet="Horos Toe Shoes +3"}
		
	sets.engaged.EP = set_combine(sets.engaged, {head="Maculele Tiara +3",body="Gleti's Cuirass",hands="Gleti's Gauntlets",legs="Gleti's Breeches"})
	
	sets.engaged.AM = set_combine(sets.engaged, {
		head="Maculele Tiara +3",body="Malignance Tabard",hands="Malignance Gloves",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		waist="Gerdr Belt +1",legs="Malignance Tights",feet="Horos Toe Shoes +3"})
	
	sets.engaged.Acc = set_combine(sets.engaged, 
		{neck="Etoile Gorget +2",ear1="Odr Earring",ear2="Telos Earring",
		ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.back.melee,waist="Null Belt",legs="Malignance Tights"})
	
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	
	sets.engaged.Evasion = set_combine(sets.engaged, sets.defense.Evasion)
	sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc, sets.defense.Evasion)

	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
	
	sets.engaged.Terpsichore = set_combine(sets.engaged, {})
	sets.engaged.Terpsichore.AM = set_combine(sets.engaged.Terpsichore, {
		head="Maculele Tiara +3",body="Malignance Tabard",hands="Malignance Gloves",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		waist="Gerdr Belt +1",legs="Malignance Tights",feet="Horos Toe Shoes +3"})
	
	sets.engaged.Twashtar = set_combine(sets.engaged, {})
	sets.engaged.Twashtar.AM = set_combine(sets.engaged.Twashtar, {
		body="Gleti's Cuirass",legs="Gleti's Breeches",
	})
end
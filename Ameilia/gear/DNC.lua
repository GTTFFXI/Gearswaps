function user_setup()
    state.OffenseMode:options('Normal', 'MidAcc', 'Acc','Hybrid')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Fodder')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    gear.default.weaponskill_neck = "Combatant's Torque"
    gear.default.weaponskill_waist = "Caudata Belt"
    
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
    -- Additional local binds
    send_command('bind ^= gs c cycle mainstep')
    send_command('bind != gs c cycle altstep')
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

	sets.precast.JA['No Foot Rise'] = {}

	sets.precast.JA['Trance'] = {head="Horos Tiara"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Horos Tiara",
		body="Maxixi Casaque",hands="Adhemar Wristbands +1",
		back="Toetapper Mantle",waist="Flume Belt +1",legs="Herculean Trousers",feet="Maxixi Toe Shoes"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Samba = {head="Dancer's Tiara",back="Senuna's Mantle"}

	sets.precast.Jig = {legs="Etoile Tights", feet="Maxixi Toe Shoes"}

	sets.precast.Step = {ring1=gear.rings.left,ring2=gear.rings.right,waist="Chaac Belt"}

	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {
		body="Maxixi Casaque",hands="Adhemar Wristbands +1",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Chaac Belt",legs="Herculean Trousers",feet="Herculean Boots"} -- magic accuracy
	sets.precast.Flourish1['Desperate Flourish'] = {
		neck="Combatant's Torque",
		body="Maxixi Casaque",hands="Adhemar Wristbands +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Toetapper Mantle",waist="Eschan Stone",legs="Herculean Trousers",feet="Herculean Boots"} -- acc gear

	sets.precast.Flourish2 = {}
	sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2"}

	sets.precast.Flourish3 = {}
	sets.precast.Flourish3['Striking Flourish'] = {}
	sets.precast.Flourish3['Climactic Flourish'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Herculean Helm",body="Dread Jupon",hands="Adhemar Wristbands +1",ring1="Kishar Ring",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Adhemar Jacket +1",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back="Senuna's Mantle",waist="Fotia Belt",legs="Lustratio Subligar +1",feet="Lustratio Leggings +1"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring"
	})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, 
		{head="Herculean Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",ring1="Shiva Ring +1",ring2="Ilabrat Ring",back="Toro Cape",waist="Orpheus's Sash"})
	
	
	-- Midcast Sets
	
	sets.midcast.FastRecast = {hands="Leyline Gloves"}
		
	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Bathy Choker +1",
		ring1="Sheltered Ring",ring2="Defending Ring"}
	sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
	

	-- Idle sets

	sets.idle = {
		head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Skadi's Jambeaux +1"}

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle
	
	-- Defense sets

	sets.defense.Evasion = {
		head="Malignance Chapeau",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Senuna's Mantle",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.PDT = sets.defense.Evasion

	sets.defense.MDT = set_combine(sets.defense.PDT, {back="Moonlight Cape"})
	
	sets.Kiting = {feet="Skadi's Jambeaux +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Gere Ring",ring2="Epona's Ring",
		back="Senuna's Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.engaged.MidAcc = set_combine(sets.engaged, {neck="Combatant's Torque",ear2="Telos Earring"})
	sets.engaged.Acc = set_combine(sets.engaged, 
		{neck="Combatant's Torque",ear1="Odr Earring",ear2="Telos Earring",
		ring1="Regal Ring",ring2="Ilabrat Ring",
		back="Senuna's Mantle",waist="Eschan Stone",legs="Malignance Tights"})
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	sets.engaged.Evasion = set_combine(sets.engaged, sets.defense.Evasion)
	sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc, sets.defense.Evasion)

	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end
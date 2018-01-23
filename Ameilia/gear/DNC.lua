function user_setup()
    state.OffenseMode:options('Normal', 'Trivial', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Fodder')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

    gear.default.weaponskill_neck = "Combatant's Torque"
    gear.default.weaponskill_waist = "Caudata Belt"
    gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}

    -- Additional local binds
    send_command('bind ^= gs c cycle mainstep')
    send_command('bind != gs c cycle altstep')
    send_command('bind ^- gs c toggle selectsteptarget')
    send_command('bind !- gs c toggle usealtstep')
    send_command('bind ^` input /ja "Chocobo Jig" <me>')
    send_command('bind !` input /ja "Chocobo Jig II" <me>')
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
		body="Maxixi Casaque",hands="Herculean Gloves",
		back="Toetapper Mantle",waist="Flume Belt",legs="Herculean Trousers",feet="Maxixi Toe Shoes"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Samba = {head="Dancer's Tiara"}

	sets.precast.Jig = {legs="Etoile Tights", feet="Maxixi Toe Shoes"}

	sets.precast.Step = {waist="Chaac Belt"}

	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {
		body="Maxixi Casaque",hands="Herculean Gloves",ring2="Sangoma Ring",
		waist="Chaac Belt",legs="Herculean Trousers",feet="Herculean Boots"} -- magic accuracy
	sets.precast.Flourish1['Desperate Flourish'] = {
		head="Dampening Tam",neck="Combatant's Torque",
		body="Maxixi Casaque",hands="Herculean Gloves",ring1="Patricius Ring",ring2="Cacoethic Ring +1",
		back="Toetapper Mantle",waist="Olseni Belt",legs="Herculean Trousers",feet="Herculean Boots"} -- acc gear

	sets.precast.Flourish2 = {}
	sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2"}

	sets.precast.Flourish3 = {}
	sets.precast.Flourish3['Striking Flourish'] = {}
	sets.precast.Flourish3['Climactic Flourish'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Herculean Helm",ear2="Loquacious Earring",hands="Herculean Gloves",ring1="Prolix Ring",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",hands="Herculean Gloves",ring1="Rufescent Ring",ring2="Ramuh Ring +1",
		back="Letalis Mantle",waist="Fotia Belt",legs="Lustratio Subligar",feet="Rawhide Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Herculean Vest",ring1="Rufescent Ring",ring2="Cacoethic Ring +1"
	})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, 
		{head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",ring1="Shiva Ring +1",ring2="Acumen Ring",back="Toro Cape",waist="Chaac Belt"})
	
	
	-- Midcast Sets
	
	sets.midcast.FastRecast = {head="Dampening Tam",ear2="Loquacious Earring",hands="Leyline Gloves"}
		
	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Bathy Choker +1",
		ring1="Sheltered Ring",ring2="Defending Ring"}
	sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
	

	-- Idle sets

	sets.idle = {
		head="Ocelomeh Headpiece +1",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Herculean Vest",hands="Herculean Gloves",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Herculean Trousers",feet="Skadi's Jambeaux +1"}

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle
	
	-- Defense sets

	sets.defense.Evasion = {
		head="Dampening Tam",neck="Loricate Torque +1",
		body="Herculean Vest",hands="Herculean Gloves",ring1="Patricius Ring",ring2="Defending Ring",
		back="Toetapper Mantle",waist="Flume Belt",legs="Herculean Trousers",feet="Herculean Boots"}

	sets.defense.PDT = {
		head="Dampening Tam",neck="Loricate Torque +1",
		body="Herculean Vest",hands="Herculean Gloves",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Herculean Trousers",feet="Herculean Boots"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {back="Moonbeam Cape"})
	
	sets.Kiting = {feet="Skadi's Jambeaux +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Sherida Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged, 
		{neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		ring1="Patricius Ring",ring2="Cacoethic Ring +1",
		back="Letalis Mantle",waist="Olseni Belt",legs="Herculean Trousers"})

	sets.engaged.Evasion = set_combine(sets.engaged, sets.defense.Evasion)
	sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc, sets.defense.Evasion)

	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end
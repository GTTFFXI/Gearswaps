-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Trivial')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan"
    
    select_movement_feet()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
    sets.precast.JA['Futae'] = {legs="Iga Tekko +2"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Dampening Tam",
        body="Mochi. Chainmail +1",hands="Herculean Gloves",
        back="Solemnity Cape",legs="Herculean Trousers",feet="Herculean Boots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        head="Dampening Tam",neck="Combatant's Torque",
        body="Mochi. Chainmail +1",hands="Herculean Gloves",ring1="Cacoethic Ring +1",ring2="Patricius Ring",
        back="Yokaze Mantle",waist="Chaac Belt",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {head="Herculean Helm",neck="Orunmila's Torque",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Prolix Ring"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +1",legs="Herculean Trousers"})

    -- Snapshot for ranged
    sets.precast.RA = {}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Ilabrat Ring",ring2="Shukuyu Ring",
        back="Yokaze Mantle",waist="Fotia Belt",legs="Hizamaru Hizayoroi +2",feet="Herculean Boots"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		hands="Herculean Gloves",ring1="Ramuh Ring +1",ring2="Cacoethic Ring +1"
	})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
        {head="Uk'uxaj Cap"})

    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,
        {head="Herculean Helm"})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, 
		{head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",ring1="Ilabrat Ring",ring2="Shukuyu Ring",
		back="Toro Cape"})
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head="Herculean Helm",neck="Orunmila's Torque",hands="Mochizuki Tekko",ear2="Loquacious Earring",ring1="Prolix Ring",feet="Herculean Boots"}

    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {neck="Incanter's Torque",feet="Iga Kyahan +2"})

    sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.FastRecast, {head="Herculean Helm",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Crematio Earring",ring1="Etana Ring",ring2="Acumen Ring",back="Toro Cape"})
	
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {back="Yokaze Mantle",ring2="Sangoma Ring"})

    sets.midcast.NinjutsuDebuff = sets.midcast.ElementalNinjutsu.Resistant
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {back="Yokaze Mantle"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	sets.acc = {neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Herculean Vest",hands="Herculean Gloves",ring1="Ramuh Ring +1",ring2="Cacoethic Ring +1",
		back="Yokaze Mantle",waist="Olseni Belt",legs="Hizamaru Haramaki +2",feet="Herculean Boots"}
	
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands="Herculean Gloves",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged, sets.acc)
		

	sets.idle = set_combine(sets.engaged, {
		head="Ocelomeh Headpiece +1",neck="Bathy Choker +1",ear1="Infused Earring",
		body="Hizamaru Haramaki +2",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Rao Haidate",feet=gear.MovementFeet})

	sets.idle.Town = set_combine(sets.idle, {})
    sets.idle.Weak = sets.idle

	-- Resting sets
    sets.resting = sets.idle
    
    -- Defense sets
    sets.defense.Evasion = {
        head="Dampening Tam",
        body="Herculean Vest",hands="Herculean Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        back="Yokaze Mantle",waist="Flume Belt",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.defense.PDT = {
        head="Dampening Tam",neck="Loricate Torque +1",
		body="Herculean Vest",hands="Herculean Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.defense.MDT = {
		head="Dampening Tam",neck="Loricate Torque +1",
		body="Herculean Vest",hands="Herculean Gloves",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Herculean Trousers",feet="Herculean Boots"}


    sets.Kiting = {feet=gear.MovementFeet}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

	sets.engaged.Evasion = set_combine(sets.engaged, sets.defense.Evasion)
    sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc, sets.defense.Evasion)
    sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
    sets.engaged.MDT = set_combine(sets.engaged, sets.defense.MDT)
    sets.engaged.Acc.MDT = set_combine(sets.engaged.Acc, sets.defense.MDT)
	
	--------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Iga Ningi +2"}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
end

function job_post_precast(spell, action, spellMap, eventArgs)
end
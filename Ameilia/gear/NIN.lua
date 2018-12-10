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
	
	send_command('bind !` eh cycle')
    
    select_movement_feet()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
    sets.precast.JA['Futae'] = {legs="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        
        body="Mochi. Chainmail +1",hands="Adhemar Wristbands +1",
        back="Solemnity Cape",feet="Herculean Boots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        neck="Combatant's Torque",
        body="Mochi. Chainmail +1",hands="Adhemar Wristbands +1",ring1="Cacoethic Ring +1",ring2="Patricius Ring",
        back="Yokaze Mantle",waist="Chaac Belt",feet="Herculean Boots"}

    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		head="Herculean Helm",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Kishar Ring",
		legs="Gyve Trousers"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +1",back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    -- Snapshot for ranged
    sets.precast.RA = {}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Fotia Belt",legs="Samnuha Tights",feet="Herculean Boots"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		hands="Adhemar Wristbands +1",ring1="Ramuh Ring +1",ring2="Regal Ring"
	})
	
	sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, {
		legs="Jokushu Haidate"
	})
	
	sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS, {
		ring2="Begrudging Ring",legs="Mummu Kecks +2"
	})

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, 
		{head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",ring1="Ilabrat Ring",ring2="Regal Ring",
		back="Toro Cape"})
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head="Herculean Helm",neck="Orunmila's Torque",hands="Leyline Gloves",ear2="Loquacious Earring",ring1="Kishar Ring",feet="Herculean Boots"}

    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {neck="Incanter's Torque",hands="Mochizuki Tekko",back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.FastRecast, {
		head="Herculean Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",hands="Hattori Tekko +1",ring1="Shiva Ring +1",ring2="Stikini Ring",
		back="Toro Cape",waist="Eschan Stone",legs="Gyve Trousers",feet="Hachiya Kyahan"})
	
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {back="Yokaze Mantle",ring2="Sangoma Ring"})

    sets.midcast.NinjutsuDebuff = sets.midcast.ElementalNinjutsu.Resistant
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {hands="Mochizuki Tekko",back="Yokaze Mantle"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	sets.acc = {head="Kendatsuba Jinpachi +1",neck="Moonlight Nodowa",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Hizamaru Haramaki +2",hands="Adhemar Wristbands +1",ring1="Ramuh Ring +1",ring2="Regal Ring",
		back="Andartia's Mantle",waist="Olseni Belt",legs="Hizamaru Haramaki +2",feet="Herculean Boots"}
	
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Moonlight Nodowa",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back="Andartia's Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged, sets.acc)
		

	sets.idle = set_combine(sets.engaged, {
		neck="Bathy Choker +1",ear1="Infused Earring",
		body="Hizamaru Haramaki +2",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Rao Haidate",feet=gear.MovementFeet})

	sets.idle.Town = set_combine(sets.idle, {})
    sets.idle.Weak = sets.idle

	-- Resting sets
    sets.resting = sets.idle
    
    -- Defense sets
    sets.defense.Evasion = {
		hands="Adhemar Wristbands +1",ring1="Patricius Ring",ring2="Defending Ring",
        back="Yokaze Mantle",waist="Flume Belt",feet="Herculean Boots"}

    sets.defense.PDT = {ammo="Staunch Tathlum",
        neck="Loricate Torque +1",
		body="Emet Harness +1",hands="Adhemar Wristbands +1",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Amm Greaves"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {
		ear1="Etiolation Earring",ear2="Odnowa Earring +1",ring1="Fortified Ring"
	})


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

    sets.buff.Migawari = {body="Hattori Ningi +1",back="Andartia's Mantle"}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
end

function job_post_precast(spell, action, spellMap, eventArgs)
end
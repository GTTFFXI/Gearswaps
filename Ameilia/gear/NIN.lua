-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan"
	
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
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
        back="Andartia's Mantle",waist="Chaac Belt",feet="Herculean Boots"}

    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		head="Herculean Helm",neck="Baetyl Pendant",ear1="Etiolation Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",
		legs="Gyve Trousers"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +1",back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    -- Snapshot for ranged
    sets.precast.RA = {}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Mpaca's Cap",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Andartia's Mantle",waist="Fotia Belt",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Malignance Chapeau",ear1="Telos Earring",ear1="Dignitary's Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Regal Ring",ring2="Ilabrat Ring"
	})
	
	sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, {
		ear1="Odr Earring",legs="Jokushu Haidate"
	})
	
	sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS, {
		ear1="Odr Earring",ring2="Begrudging Ring",legs="Kendatsuba Hakama +1"
	})

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, 
		{head="Herculean Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",ring1="Ilabrat Ring",ring2="Regal Ring",
		back="Toro Cape",waist="Orpheus's Sash"})
	sets.precast.WS["Blade: Chi"] = sets.precast.WS['Aeolian Edge']
	sets.precast.WS["Blade: Teki"] = sets.precast.WS['Aeolian Edge']
	sets.precast.WS["Blade: To"] = sets.precast.WS['Aeolian Edge']
	sets.precast.WS["Blade: Yu"] = sets.precast.WS['Aeolian Edge']
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head="Herculean Helm",neck="Baetyl Pendant",hands="Leyline Gloves",ring1="Kishar Ring",feet="Herculean Boots"}

    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {neck="Incanter's Torque",hands="Mochizuki Tekko",back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.FastRecast, {
		head="Herculean Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",hands="Hattori Tekko +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Toro Cape",waist="Eschan Stone",legs="Gyve Trousers",feet="Hachiya Kyahan"})
	
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})

    sets.midcast.NinjutsuDebuff = sets.midcast.ElementalNinjutsu.Resistant
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {hands="Mochizuki Tekko"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	sets.acc = {head="Kendatsuba Jinpachi +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Odr Earring",
		body="Tatenashi Haramaki +1",hands="Kendatsuba Tekko +1",ring1="Ramuh Ring +1",ring2="Regal Ring",
		back="Andartia's Mantle",waist="Eschan Stone",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}
	
	sets.engaged = {
		head="Kendatsuba Jinpachi +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Tatenashi Haramaki +1",hands="Kendatsuba Tekko +1",ring1="Gere Ring",ring2="Epona's Ring",
		back="Andartia's Mantle",waist="Windbuffet Belt +1",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged, sets.acc)
		

	sets.idle = set_combine(sets.engaged, {
		head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Infused Earring",
		body="Hizamaru Haramaki +2",hands="Malignance Gloves",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rao Haidate",feet=gear.MovementFeet})

	sets.idle.Town = set_combine(sets.idle, {})
    sets.idle.Weak = sets.idle

	-- Resting sets
    sets.resting = sets.idle
    
    -- Defense sets
    sets.defense.Evasion = {
		head="Malignance Chapeau",neck="Loricate Torque +1",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        back="Andartia's Mantle",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",
        back="Andartia's Mantle",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {
		ear1="Etiolation Earring",ear2="Tuisto Earring",ring1="Purity Ring"
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

	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	
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
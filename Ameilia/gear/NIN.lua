-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'StoreTP')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan"
	
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	gear.melee={}
	gear.melee.back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.nuke={}
	gear.nuke.back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.wsd={}
	gear.wsd.back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	send_command('bind !` eh cycle')
    
    select_movement_feet()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.enmity = {
		neck="Moonlight Torque",ear1="Trux Earring",ear2="Cryptic Earring",
		body="Emet Harness +1",hands="Kurys Gloves",ring1="Begrudging Ring",ring2="Supershear Ring",
		back="Reiki Cloak",waist="Sulla Belt",legs="Zoar Subligar +1",feet=""
	}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
    sets.precast.JA['Futae'] = {legs="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail +1"}
	sets.precast.JA['Provoke'] = sets.enmity


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
		hands="Leyline Gloves",ring1="Kishar Ring",
		legs="Gyve Trousers"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +1",back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    -- Snapshot for ranged
    sets.precast.RA = {}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Mpaca's Cap",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Epaminondas's Ring",ring2="Regal Ring",
        back=gear.melee.back,waist="Fotia Belt",legs="Mpaca's Hose",feet="Herculean Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Malignance Chapeau",ear1="Telos Earring",ear1="Crepuscular Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring"
	})
	sets.precast.WS.Proc = {
		head="Taeon Chapeau",neck="Combatant's Torque",ear1="Crepuscular Earring",ear2="Cryptic Earring",
		body="Taeon Tabard",hands="Taeon Gloves",ring1="Chirich Ring +1",ring2="Patricius Ring",
		back="Repulse Mantle",waist="Eschan Stone",legs="Taeon Tights",feet="Taeon Boots"}
	
	sets.precast.WS["Blade: Ten"] = set_combine(sets.precast.WS, {
		neck="Republican Platinum Medal",ear1="Ishvara Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gere Ring",ring2="Epaminondas's Ring",
		back=gear.wsd.back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
	sets.precast.WS["Savage Blade"] = sets.precast.WS["Blade: Ten"]
	sets.precast.WS["Blade: Metsu"] = set_combine(sets.precast.WS["Blade: Ten"], {
		head="Nyame Helm",ear2="Odr Earring",
	})
	sets.precast.WS["Blade: Metsu"].Proc = sets.precast.WS.Proc
	
	
	sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, {
		ear1="Odr Earring"
	})
	sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS, {
		head="Nyame Helm",ear1="Odr Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring2="Begrudging Ring",
		back=gear.wsd.back,legs="Mpaca's Hose",feet="Nyame Sollerets"
	})
	    
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, 
		{head="Mochizuki Hatsuburi +3",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Regal Ring",
		back=gear.wsd.back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	sets.precast.WS["Blade: Chi"] = sets.precast.WS['Aeolian Edge']
	sets.precast.WS["Blade: Teki"] = sets.precast.WS['Aeolian Edge']
	sets.precast.WS["Blade: To"] = sets.precast.WS['Aeolian Edge']
	sets.precast.WS["Blade: Yu"] = sets.precast.WS['Aeolian Edge']
	
	sets.precast.WS["Aeolian Edge"].Proc = sets.precast.WS.Proc
	sets.precast.WS["Blade: Shun"].Proc = sets.precast.WS.Proc
	sets.precast.WS["Blade: Hi"].Proc = sets.precast.WS.Proc
	sets.precast.WS["Blade: Chi"].Proc = sets.precast.WS.Proc
	sets.precast.WS["Blade: Teki"].Proc = sets.precast.WS.Proc
	sets.precast.WS["Blade: To"].Proc = sets.precast.WS.Proc
	sets.precast.WS["Blade: Yu"].Proc = sets.precast.WS.Proc
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head="Nyame Helm",neck="Baetyl Pendant",hands="Leyline Gloves",ring1="Kishar Ring",feet="Herculean Boots"}

    sets.midcast.Utsusemi = set_combine(sets.enmity, {neck="Incanter's Torque",hands="Mochizuki Tekko",back=gear.melee.back,feet="Hattori Kyahan +1"})

    sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.FastRecast, {
		head="Mochizuki Hatsuburi +3",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2=gear.rings.right,
		back=gear.nuke.back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})

    sets.midcast.NinjutsuDebuff = sets.midcast.ElementalNinjutsu.Resistant
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {hands="Mochizuki Tekko"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	sets.acc = {head="Mpaca's Cap",neck="Combatant's Torque",ear1="Telos Earring",ear2="Odr Earring",
		body="Tatenashi Haramaki +1",hands="Kendatsuba Tekko +1",ring1="Ramuh Ring +1",ring2="Regal Ring",
		back=gear.melee.back,waist="Eschan Stone",legs="Mpaca's Hose",feet="Kendatsuba Sune-Ate +1"}
	
	sets.engaged = {
		head="Mpaca's Cap",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Cessance Earring",
		body="Tatenashi Haramaki +1",hands="Mpaca's Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=gear.melee.back,waist="Windbuffet Belt +1",legs="Mpaca's Hose",feet="Kendatsuba Sune-Ate +1"}
	sets.engaged.StoreTP = set_combine(sets.engaged, {
		head="Ryuo Somen +1",neck="Ninja Nodowa +2",
		hands="Tatenashi Gote +1",ring2="Chirich Ring +1",
		waist="Gerdr Belt",legs="Tatenashi Haidate +1",feet="Tatenashi Sune-Ate +1"
	})
	sets.engaged.Acc = set_combine(sets.engaged, sets.acc)
		

	sets.idle = set_combine(sets.engaged, {
		head="Malignance Chapeau",neck="Republican Platinum Medal",ear1="Infused Earring",
		body="Hizamaru Haramaki +2",hands="Nyame Gauntlets",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rao Haidate",feet=gear.MovementFeet})

	sets.idle.Town = set_combine(sets.idle, {})
    sets.idle.Weak = sets.idle

	-- Resting sets
    sets.resting = sets.idle
    
    -- Defense sets
    sets.defense.Evasion = {
		head="Mpaca's Cap",neck="Loricate Torque +1",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        back=gear.melee.back,waist="Flume Belt +1",legs="Mpaca's Hose",feet="Malignance Boots"}

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Mpaca's Cap",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",ring2="Defending Ring",
        back=gear.melee.back,legs="Mpaca's Hose",feet="Malignance Boots"}

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
		head="Mpaca's Cap",body="Mpaca's Doublet",hands="Mpaca's Gloves",ring2="Defending Ring",legs="Mpaca's Hose",feet="Nyame Sollerets"
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

    sets.buff.Migawari = {body="Hattori Ningi +1",back=gear.melee.back}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
end

function job_post_precast(spell, action, spellMap, eventArgs)
end
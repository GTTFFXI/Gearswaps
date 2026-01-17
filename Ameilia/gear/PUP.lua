-- Define sets used by this job file.
function init_gear_sets()
	gear.back = {}
	gear.back.melee = { name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	gear.back.pet = { name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}}

    sets.engaged = {ammo="Automat. Oil +3",
        head="Mpaca's Cap",neck="Puppetmaster's Collar +2",ear1="Schere Earring",ear2="Sroda Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Lehko's Ring",ring2="Gere Ring",
        back="Null Shawl",waist="Moonbow Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}
		
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		head="Herculean Helm",neck="Baetyl Pendant",
		body="Zendik Robe",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Fi Follet Cape +1",legs="Gyve Trousers",feet="Regal Pumps +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe +1"}
    
    sets.precast.JA['Repair'] = {hands="Taeon Gloves",legs="Taeon Tights",feet="Foire Babouches +3"}

	sets.precast.JA['Overdrive'] = {body="Pitre Tobe +3"}

    sets.precast.JA.Maneuver = {body="Karagoz Farsetto +1",hands="Foire Dastanas +3",back=gear.back.pet}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = set_combine(sets.engaged, {
		head="Mpaca's Cap",neck="Fotia Gorget",ear2="Moonshade Earring",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Regal Ring",
		waist="Fotia Belt",legs="Mpaca's Hose",feet="Mpaca's Boots"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {ring1="Lehko's Ring",ring2="Gere Ring"})
    sets.precast.WS['Stringing Pummel'].Mod = set_combine(sets.precast.WS['Stringing Pummel'])

    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS['Stringing Pummel'])

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS)
	
	sets.precast.WS["Howling Fist"] = set_combine(sets.precast.WS, {
		body="Nyame Mail",hands="Nyame Gauntlets",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})

    
    -- Midcast Sets

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
        

    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {legs="Foire Churidars +3"}

    sets.midcast.Pet['Elemental Magic'] = {feet="Pitre Babouches +3"}

    sets.midcast.Pet.WeaponSkill = {head="Karagoz Cappello +1", hands="Mpaca's Gloves", legs="Mpaca's Hose"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {head="Pitre Taj +3",
        ring1="Sheltered Ring"}
    

    -- Idle sets

    sets.idle = {
        head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Sroda Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Sheltered Ring",ring2="Murky Ring",
        back=gear.back.pet,waist="Null Belt",legs="Mpaca's Hose",feet="Hermes' Sandals +1"}

    sets.idle.Town = set_combine(sets.idle, {})

    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = set_combine(sets.idle, {})

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
        head="Taeon Chapeau",neck="Shulmanu Collar",ear1="Crepuscular Earring",ear2="Karagoz Earring +1",
        body="Pitre Tobe +3",hands="Mpaca's Gloves",ring1="Cath Palug Ring",ring2="Varar Ring +1",
        back=gear.back.pet,waist="Incarnation Sash",legs="Heyoka Subligar +1",feet="Mpaca's Boots"}

	sets.idle.Pet.Engaged.Melee = set_combine(sets.idle.Pet.Engaged, {})

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {})

    sets.idle.Pet.Engaged.Nuke = set_combine(sets.idle.Pet.Engaged, {})

    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {})

	sets.idle.Pet.Engaged.Tank = set_combine(sets.idle.Pet.Engaged, {
		head="Taeon Chapeau",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Rao Togi +1",hands="Rao Kote +1",ring1="Cath Palug Ring",
		legs="Foire Churidars +3",feet="Rao Sune-Ate +1"
	})

    -- Defense sets

    sets.defense.PDT = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {})

    sets.Kiting = {feet="Hermes' Sandals +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

    sets.engaged.Acc = set_combine(sets.engaged, {})
    sets.engaged.DT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Pet = set_combine(sets.engaged, {waist="Klouskap Sash +1"})
end

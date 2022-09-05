-- Define sets used by this job file.
function init_gear_sets()
    sets.engaged = {ammo="Automaton Oil +3",
        head="Mpaca's Cap",neck="Shulmanu Collar",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Gere Ring",ring2="Niqmaddu Ring",
        back="Visucius's Mantle",waist="Moonbow Belt +1",legs="Mpaca's Hose",feet="Herculean Boots"}
		
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {head="Haruspex Hat",hands="Thaumas Gloves",neck="Baetyl Pendant"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Tactical Switch'] = {feet="Cirque Scarpe +2"}
    
    sets.precast.JA['Repair'] = {feet="Foire Babouches"}

    sets.precast.JA.Maneuver = {neck="Buffoon's Collar",body="Karagoz Farsetto +1",hands="Foire Dastanas +1",back="Visucius's Mantle"}



    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Whirlpool Mask",ear1="Roundel Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",legs="Nahtirah Trousers",feet="Thurandaut Boots +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = set_combine(sets.engaged, {
		head="Mpaca'a Cap",neck="Fotia Gorget",ear2="Moonshade Earring",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",
		waist="Fotia Belt",legs="Mpaca's Hose",feet="Nyame Sollerets"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {ring1="Begrudging Ring"})
    sets.precast.WS['Stringing Pummel'].Mod = set_combine(sets.precast.WS['Stringing Pummel'])

    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS['Stringing Pummel'])

    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS)

    
    -- Midcast Sets

    sets.midcast.FastRecast = {
        head="Haruspex Hat",
        body="Otronif Harness +1",hands="Regimen Mittens",
        legs="Manibozho Brais",feet="Otronif Boots +1"}
        

    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {legs="Foire Churidars"}

    sets.midcast.Pet['Elemental Magic'] = {feet="Pitre Babouches"}

    sets.midcast.Pet.WeaponSkill = {head="Cirque Cappello +2", hands="Cirque Guanti +2", legs="Cirque Pantaloni +2"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {head="Pitre Taj",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets

    sets.idle = {
        head="Pitre Taj",neck="Republican Platinum Medal",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Foire Tobe",hands="Regimen Mittens",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Hurch'lan Sash",legs="Foire Churidars",feet="Hermes' Sandals"}

    sets.idle.Town = set_combine(sets.idle, {main="Tinhaspa"})

    -- Set for idle while pet is out (eg: pet regen gear)
    sets.idle.Pet = sets.idle

    -- Idle sets to wear while pet is engaged
    sets.idle.Pet.Engaged = {
        head="Nyame Helm",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
        body="Tali'ah Manteel +2",hands="Tali'ah Gages +2",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Visucius's Mantle",waist="Klouskap Sash +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.idle.Pet.Engaged.Ranged = set_combine(sets.idle.Pet.Engaged, {legs="Nyame Flanchard",feet="Nyame Sollerets"})

    sets.idle.Pet.Engaged.Nuke = set_combine(sets.idle.Pet.Engaged, {legs="Nyame Flanchard",feet="Nyame Sollerets"})

    sets.idle.Pet.Engaged.Magic = set_combine(sets.idle.Pet.Engaged, {legs="Nyame Flanchard",feet="Nyame Sollerets"})


    -- Defense sets

    sets.defense.Evasion = {
        head="Whirlpool Mask",neck="Twilight Torque",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Beeline Ring",
        back="Ik Cape",waist="Hurch'lan Sash",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.PDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",
		body="Malignance Tabard",ring1="Defending Ring",
        back="Moonlight Cape",waist="Moonbow Belt",legs="Nahtirah Trousers",feet="Malignance Boots"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {ring2="Purity Ring"})

    sets.Kiting = {feet="Hermes' Sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

    sets.engaged.Acc = sets.engaged
    sets.engaged.DT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Pet = set_combine(sets.engaged, {waist="Klouskap Sash",feet="Nyame Sollerets"})
end

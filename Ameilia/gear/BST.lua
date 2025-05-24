-- Define sets and vars used by this job file.
function init_gear_sets()
	gear.melee = {}
	gear.melee.feet = { name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}}
	
	gear.wsdmg = {}
	gear.wsdmg.feet = { name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +3"}
    sets.precast.JA['Feral Howl'] = {body="Ankusa Jackcoat +3"}
    sets.precast.JA['Call Beast'] = {hands="Ankusa Gloves +3"}
    sets.precast.JA['Familiar'] = {legs="Ankusa Trousers +3"}
    sets.precast.JA['Tame'] = {head="Totemic Helm +1",ear1="Tamer's Earring",legs="Stout Kecks"}
    sets.precast.JA['Spur'] = {feet="Ferine Ocreae +2"}

    sets.precast.JA['Reward'] = {ammo=RewardFood,
        head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        body="Totemic Jackcoat +1",hands="Totemic Gloves +1",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
        back="Pastoralist's Mantle",waist="Crudelis Belt",legs="Ankusa Trousers +3",feet="Ankusa Gaiters +3"}

    sets.precast.JA['Charm'] = {ammo="Tsar's Egg",
        head="Totemic Helm +1",neck="Ferine Necklace",ear1="Enchanter's Earring",ear2="Reverie Earring +1",
        body="Ankusa Jackcoat +3",hands="Ankusa Gloves +3",ring1="Dawnsoul Ring",ring2="Dawnsoul Ring",
        back="Aisance Mantle +1",waist="Aristo Belt",legs="Ankusa Trousers +3",feet="Ankusa Gaiters +3"}

    -- CURING WALTZ
    sets.precast.Waltz = {ammo="Tsar's Egg",
        head="Totemic Helm +1",neck="Ferine Necklace",ear1="Enchanter's Earring",ear2="Reverie Earring +1",
        body="Gorney Haubert +1",hands="Totemic Gloves +1",ring1="Valseur's Ring",ring2="Asklepian Ring",
        back="Aisance Mantle +1",waist="Aristo Belt",legs="Osmium Cuisses",feet="Scamp's Sollerets"}

    -- HEALING WALTZ
    sets.precast.Waltz['Healing Waltz'] = {}

    -- STEPS
    sets.precast.Step = {ammo="Jukukik Feather",
        head="Yaoyotl Helm",neck="Ziel Charm",ear1="Choreia Earring",ear2="Heartseeker Earring",
        body="Mikinaak Breastplate",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Letalis Mantle",waist="Hurch'lan Sash",legs="Skadi's Chausses +1",feet="Gorney Sollerets +1"}

    -- VIOLENT FLOURISH
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {body="Ankusa Jackcoat +3",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

    sets.precast.FC = {ammo="Impatiens",neck="Baetyl Pendant",ring1="Prolix Ring"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

    -- WEAPONSKILLS
    -- Default weaponskill set.
	sets.precast.WS = {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Gere Ring",
		back="Artio's Mantle",waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS.WSAcc = set_combine(sets.precast.WS, {})
    -- Specific weaponskill sets.
    sets.precast.WS['Primal Rend'] = {ammo="Erlene's Notebook",
        head="Nyame Helm",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'])

	sets.precast.WS['Calamity'] = set_combine(sets.precast.WS, {
		head="Ankusa Helm +3",neck="Republican Platinum Medal",ear2="Thrud Earring",
		waist="Sailfi Belt +1"
	})

    --------------------------------------
    -- Midcast sets
    --------------------------------------
    
    sets.midcast.FastRecast = {ammo="Demonry Core",
        head="Iuitl Headgear +1",neck="Baetyl Pendant",
        body="Totemic Jackcoat +1",hands="Iuitl Wristbands +1",ring1="Prolix Ring",ring2="Dark Ring",
        back="Mollusca Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})


    -- PET SIC & READY MOVES
    sets.midcast.Pet.WS = {ammo="Demonry Core",
        head="Totemic Helm +1",neck="Ferine Necklace",ear1="Domesticator's Earring",ear2="Sabong Earring",
        body="Mirke Wardecors",hands="Ferine Manoplas +2",ring1="Angel's Ring",ring2="Angel's Ring",
        back="Ferine Mantle",waist="Hurch'lan Sash",legs="Desultor Tassets",feet="Totemic Gaiters +1"}

    sets.midcast.Pet.WS.Unleash = set_combine(sets.midcast.Pet.WS, {hands="Scorpion Mittens"})

    sets.midcast.Pet.Neutral = {legs="Desultor Tassets"}
    sets.midcast.Pet.Favorable = {head="Ferine Cabasset +2",legs="Desultor Tassets"}


    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- RESTING
    sets.resting = {ammo="Demonry Core",
        head="Twilight Helm",neck="Wiglen Gorget",ear1="Domesticator's Earring",ear2="Sabong Earring",
        body="Twilight Mail",hands="Totemic Gloves +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Pastoralist's Mantle",waist="Muscle Belt +1",legs="Ferine Quijotes +2",feet="Skadi's Jambeaux +1"}

    -- IDLE SETS
    sets.idle = {ammo="Demonry Core",
        head="Null Masque",neck="Republican Platinum Medal",ear1="Domesticator's Earring",ear2="Sabong Earring",
        body="Twilight Mail",hands="Totemic Gloves +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Pastoralist's Mantle",waist="Muscle Belt +1",legs="Malignance Tights",feet="Skadi's Jambeaux +1"}

    sets.idle.Refresh = {head="Null Masque",body="Twilight Mail",hands="Ogier's Gauntlets",legs="Ogier's Breeches"}

    sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

    sets.idle.Pet = set_combine(sets.idle, {})

    sets.idle.Pet.Engaged = {ammo="Demonry Core",
        head="Anwig Salade",neck="Ferine Necklace",ear1="Domesticator's Earring",ear2="Sabong Earring",
        body="Ankusa Jackcoat +3",hands="Totemic Gloves +1",ring1="Angel's Ring",ring2="Angel's Ring",
        back="Ferine Mantle",waist="Hurch'lan Sash",legs="Ankusa Trousers +3",feet="Armada Sollerets"}

    -- DEFENSE SETS
    sets.defense.PDT = {ammo="Jukukik Feather",
        head="Null Masque",neck="Loricate Torque +1",
        body="Malignance Tabard",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonlight Cape",waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.Hybrid = set_combine(sets.defense.PDT, {ring1="Purity Ring"})

    sets.defense.Killer = set_combine(sets.defense.Hybrid, {body="Ferine Gausape +2"})

    sets.defense.MDT = set_combine(sets.defense.PDT, {ammo="Sihirik",
        head="Null Masque",ear1="Flashward Earring",ear2="Spellbreaker Earring",
        body="Nocturnus Mail",ring1="Shadow Ring",
        back="Engulfer Cape",waist="Nierenschutz"})

    sets.Kiting = {ammo="Demonry Core",
        head="Iuitl Headgear +1",neck="Twilight Torque",
        body="Mekira Meikogai",hands="Iuitl Wristbands +1",ring1="Dark Ring",ring2="Defending Ring",
        back="Repulse Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights +1",feet="Skadi's Jambeaux +1"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    sets.engaged = {ammo="Coiste Bodhar",
		head="Nyame Helm",neck="Beastmaster Collar +2",ear1="Suppanomimi",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Emi. Gauntlets +1",ring1="Lehko's Ring",ring2="Gere Ring",
		back="Null Shawl",waist="Sailfi Belt +1",legs="Gleti's Breeches",feet="Nyame Sollerets"}

    sets.engaged.Acc = {ammo="Jukukik Feather",
        head="Yaoyotl Helm",neck="Ziel Charm",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
        body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Letalis Mantle",waist="Hurch'lan Sash",legs="Malignance Tights",feet="Whirlpool Greaves"}

    --sets.engaged.Killer = set_combine(sets.engaged, {body="Ferine Gausape +2",waist="Cetl Belt"})
    --sets.engaged.Killer.Acc = set_combine(sets.engaged.Acc, {body="Ferine Gausape +2",waist="Cetl Belt"})
    
    
    -- EXAMPLE SETS WITH PET MODES
    --[[
    sets.engaged.PetStance = {}
    sets.engaged.PetStance.Acc = {}
    sets.engaged.PetTank = {}
    sets.engaged.PetTank.Acc = {}
    sets.engaged.PetStance.Killer = {}
    sets.engaged.PetStance.Killer.Acc = {}
    sets.engaged.PetTank.Killer = {}
    sets.engaged.PetTank.Killer.Acc = {}
    ]]
    -- MORE EXAMPLE SETS WITH EXPANDED COMBAT FORMS
    --[[
    sets.engaged.DW.PetStance = {}
    sets.engaged.DW.PetStance.Acc = {}
    sets.engaged.DW.PetTank = {}
    sets.engaged.DW.PetTank.Acc = {}
    sets.engaged.KillerDW.PetStance = {}
    sets.engaged.KillerDW.PetStance.Acc = {}
    sets.engaged.KillerDW.PetTank= {}
    sets.engaged.KillerDW.PetTank.Acc = {}
    ]]
    
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    --sets.buff['Killer Instinct'] = {body="Ferine Gausape +2"}
    
end

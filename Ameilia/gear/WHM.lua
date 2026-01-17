function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main="Cath Palug Hammer",
		head="Bunzi's Hat",neck="Cleric's Torque +2",ear2="Malignance Earring",
		body="Zendik Robe",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +2"})

    sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC['Healing Magic'], {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {head="Piety Cap +3",ear1="Mendicant's Earring",feet="Vanya Clogs"})
    sets.precast.FC.Curaga = set_combine(sets.precast.FC.Cure, {})
    sets.precast.FC.CureSolace = set_combine(sets.precast.FC.Cure, {})
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}
	sets.precast.JA.Sublimation = {waist="Embla Sash"}
	sets.precast.JA.Devotion = {head="Piety Cap +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Cath Palug Crown",
        legs="Gendewitha Spats"}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shukuyu Ring",ring2="Epaminondas's Ring",
        waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
        ear1="Friomisi Earring",ear2="Regal Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Acumen Ring",ring2="Epaminondas's Ring",
        back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})

	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Cleric's Torque +2",ear1="Mendicant's Earring",ear2="Andoaa Earring",
		body="Ebers Bliaut +2",hands="Regal Cuffs",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Fi Follet Cape +1",waist="Fucho-no-Obi",legs="Inyanga Shalwar +2",feet="Regal Pumps +1"}

    -- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
    
    -- Cure sets
    gear.default.obi_waist = "Witful Belt"
    gear.default.obi_back = "Mending Cape"

    sets.midcast.Cure = {
		main="Queller Rod",sub="Archduke's Shield",ammo="Staunch Tathlum +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Glorious Earring",ear2="Ebers Earring +1",
        body="Ebers Bliaut +2",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pantaloons +2",feet="Vanya Clogs"}

    sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {body="Ebers Bliaut +2",back="Alaunus's Cape"})

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {body="Kaykaus Bliaut +1"})

    sets.midcast.CureMelee = set_combine(sets.midcast.Cure, {})
	
    sets.midcast.Cursna = {main="Gambanteinn",
        head="Ebers Cap +1",neck="Debilis Medallion",ear2="Ebers Earring +1",
        body="Ebers Bliaut +2",hands="Fanatic Gloves",ring1="Haoma's Ring",ring2="Haoma's Ring",
        back="Alaunus's Cape",waist="Gishdubar Sash",legs="Theophany Pantaloons +3",feet="Vanya Clogs"}

    sets.midcast.StatusRemoval = {main="Yagrush",
        head="Ebers Cap +1",hands="Ebers Mitts +1",legs="Ebers Pantaloons +2"}
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque +2"})
		
    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {main="Gada",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
        body="Telchine Chasuble",hands="Inyanga Dastanas +2",ring1=gear.rings.left,ring2=gear.rings.right,
        waist="Embla Sash",legs="Piety Pantaloons +3",feet="Regal Pumps +1"
	}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		head="Ebers Cap +1",body="Ebers Bliaut +2",hands="Ebers Mitts +1",legs="Piety Pantaloons +3"
	})

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",
        head="Inyanga Tiara +2",body="Piety Bliaut +3",hands="Ebers Mitts +1",ring1=gear.rings.left,ring2=gear.rings.right,
        legs="Theophany Pantaloons +3"})

    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	--start here
    sets.midcast['Divine Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",
		head="Bunzi's Hat",neck="Incanter's Torque",ear1="Crepuscular Earring",ear2="Malignance Earring",
		body="Shamash Robe",hands="Kaykaus Cuffs +1",ring1="Weatherspoon Ring +1",ring2=gear.rings.right,
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Nyame Sollerets"}

    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",
		head="Cath Palug Crown",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
		body="Shamash Robe",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Crepuscular Cloak"})
	
	
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Divine Magic'], {neck="Null Loop",back="Null Shawl"})
		
    sets.midcast['Dark Magic'] = set_combine(sets.midcast['Divine Magic'], {})

    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Divine Magic'], {
        body="Shamash Robe",})

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {})

    -- Sets to return to when not performing an action.
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main="Queller Rod", sub="Archduke's Shield",ammo="Homiliary",
		head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		body="Shamash Robe",hands="Bunzi's Gloves",ring1=gear.rings.left,ring2="Murky Ring",
		back="Alaunus's Cape",waist="Null Belt",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

    sets.idle.PDT = set_combine(sets.idle, {
        neck="Null Loop",ear1="Alabaster Earring"})

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = set_combine(sets.idle, {})

    -- Resting sets
    sets.resting = set_combine(sets.idle, {})
		
    -- Defense sets

    sets.defense.PDT = {
        neck="Null Loop",ear1="Alabaster Earring",
        hands="Gendewitha Gages +1",ring1="Murky Ring",ring2="Murky Ring",
        back="Alaunus's Cape",legs="Gendewitha Spats"}

    sets.defense.MDT = {
        head="Cath Palug Crown",neck="Null Loop",ear1="Alabaster Earring",
        ring1="Defending Ring",ring2="Murky Ring",
		back="Alaunus's Cape"
	}

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}	

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Bunzi's Hat",neck="Null Loop",ear1="Crepuscular Earring",ear2="Dignitary's Earring",
        body="Nyame Mail",hands="Bunzi's Gloves",ring1="Chirich Ring +1",ring2="Lehko's Ring",
        back="Null Shawl",waist="Windbuffet Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1"}
end

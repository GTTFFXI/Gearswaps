-- Define sets and vars used by this job file.
function init_gear_sets()
	gear.rings = {}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants +3"}
	sets.precast.JA['Sublimation'] = {head="Academic's Mortarboard +3",body="Pedagogy Gown +3",waist="Embla Sash"}

    -- Fast cast sets for spells

    sets.precast.FC = {
        head="Merlinic Hood",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Malignance Earring",
        body="Zendik Robe",hands="Academic's Bracers +3",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
        back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Pedagogy Loafers +3"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",legs="Chironic Hose",feet="Vanya Clogs"})

    sets.precast.FC.Curaga = set_combine(sets.precast.FC.Cure, {})

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Crepuscular Cloak"})

	sets.precast.WS = {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Telos Earring",ear2="Cessance Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Epaminondas's Ring",
        waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	
	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Halasz Earring",
		body="Academic's Gown +3",hands="Regal Cuffs",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Fi Follet Cape +1",waist="Fucho-no-Obi",legs="Pedagogy Pants +3",feet="Regal Pumps +1"}


    -- Midcast Sets

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {body="Zendik Robe"})

    sets.midcast.Cure = {main="Pedagogy Staff",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",
        body="Shamash Robe",hands="Pedagogy Bracers +3",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}

    sets.midcast.CureWithLightWeather = set_combine(sets.midcast.Cure, {})

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})

    sets.midcast.Cursna = {
		head="Vanya Hood",neck="Debilis Medallion",
		body="Pedagogy Gown +3",ring1="Haoma's Ring",ring2="Haoma's Ring",
		back="Oretania's Cape +1",legs="Academic's Pants +3",feet="Vanya Clogs"}

    sets.midcast['Enhancing Magic'] = {main="Pedagogy Staff",
        head="Telchine Cap",neck= "Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
        body="Pedagogy Gown +3", hands="Arbatel Bracers +3",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Fi Follet Cape +1",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Pedagogy Staff",head="Arbatel Bonnet +3",back="Bookworm's Cape"})
	sets.midcast.Embrava = set_combine(sets.midcast.Regen, {})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'])
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers +3"})

    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = set_combine(sets.midcast.Protect, {})

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = set_combine(sets.midcast.Shell, {})


    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {main="Mpaca's Staff",sub="Khonsu",
		head="Academic's Mortarboard +3",neck="Argute Stole +2",ear1="Regal Earring",ear2="Arbatel Earring +2",
		body="Academic's Gown +3",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Lugh's Cape",waist="Obstinate Sash",legs="Chironic Hose",feet="Academic's Loafers +3"
	}
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {neck="Null Loop",back="Null Shawl",legs="Academic's Pants +3"})
	
	sets.midcast.Frazzle = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	sets.midcast.Gravity = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.IntEnfeebles, {})
	sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast.IntEnfeebles.Resistant, {})

    sets.midcast['Dark Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast['Elemental Magic'] = {main="Mpaca's Staff",sub="Khonsu",ammo="Sroda Tathlum",
        head="Agwu's Cap",neck="Sibyl Scarf",ear1="Regal Earring",ear2="Arbatel Earring +2",
        body="Agwu's Robe",hands="Arbatel Bracers +3",ring1="Metamorph Ring +1",ring2="Freke Ring",
        back="Lugh's Cape",waist="Hachirin-no-Obi",legs="Agwu's Slops",feet="Arbatel Loafers +3"}
	
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
		head="Pedagogy Mortarboard +3",neck="Argute Stole +2",hands="Agwu's Gages"
	})
	
	sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {ring1="Mallquis Ring",waist="Skrymir Cord"})
	sets.midcast.Helix.Burst = set_combine(sets.midcast['Elemental Magic'].Burst, {waist="Skrymir Cord"})
	
	sets.midcast['Elemental Magic'].VagaryProc = {
		main="Warp Cudgel",
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Arbatel Earring +2",
		body="Agwu's Robe",hands="Gendewitha Gages +1",ring1="Metamorph Ring +1",ring2="Acumen Ring",
		back="Lugh's Cape",waist="Null Belt",legs="Volte Brais",feet="Arbatel Loafers +3"
	}
	
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
    sets.midcast.Kaustra = set_combine(sets.midcast['Elemental Magic'], {head="Pixie Hairpin +1",ring1="Archon Ring"})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Aspir = set_combine(sets.midcast.Drain, {})


-- ************ TODO: Look at stun ************ 

    sets.midcast.Stun = set_combine(sets.midcast.FastRecast, {main="Mpaca's Staff",sub="Khonsu",
		head="Academic's Mortarboard +3",neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Academic's Gown +3",hands="Academic's Bracers +3",ring1="Weatherspoon Ring +1",ring2=gear.rings.right,
		back="Lugh's Cape",waist="Witful Belt",legs="Academic's Pants +3",feet="Pedagogy Loafers +3"
	})

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Mpaca's Staff",sub="Khonsu",
		head="Academic's Mortarboard +3",neck="Null Loop",ear1="Regal Earring",ear2="Malignance Earring",
		body="Academic's Gown +3",hands="Academic's Bracers +3",ring1="Weatherspoon Ring +1",ring2=gear.rings.right,
		back="Lugh's Cape",waist="Witful Belt",legs="Academic's Pants +3",feet="Pedagogy Loafers +3"
	})

    -- Elemental Magic sets are default for handling low-tier nukes.


    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		neck="Null Loop",ring1=gear.rings.left,ring2=gear.rings.right,back="Null Shawl",feet="Arbatel Loafers +3"})
		
	

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant)

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=empty,body="Crepuscular Cloak"})


    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.idle = {main="Pedagogy Staff",sub="Khonsu",ammo="Homiliary",
        head="Null Masque",neck="Republican Platinum Medal",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Shamash Robe",hands="Nyame Gauntlets",ring1=gear.rings.left,ring2="Defending Ring",
        back="Moonlight Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}
	
	sets.resting = set_combine(sets.idle, {})

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town = set_combine(sets.idle, {})

    sets.idle.Field = set_combine(sets.idle, {})
    sets.idle.Field.Stun = set_combine(sets.idle, {})
    sets.idle.Weak = set_combine(sets.idle, {})
	
    -- Defense sets

    sets.defense.PDT = {
        head="Null Masque",neck="Loricate Torque +1",ear2="Malignance Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonlight Cape",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.defense.MDT = {
        head="Null Masque",neck="Loricate Torque +1",ear2="Malignance Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonlight Cape",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.Field.PDT = set_combine(sets.idle, sets.defense.PDT)
	sets.idle.Town.PDT = set_combine(sets.idle, sets.defense.PDT)
	sets.idle.PDT = set_combine(sets.idle, sets.defense.PDT)

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		head="Nyame Helm",neck="Null Loop",ear1="Telos Earring",ear2="Cessance Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Lehko's Ring",
        back="Null Shawl",waist="Witful Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +2"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +2"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +3"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +3"}

    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
end
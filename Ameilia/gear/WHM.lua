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
		head="Cath Palug Crown",neck="Baetyl Pendant",ear2="Malignance Earring",
		body="Zendik Robe",hands="Gendewitha Gages",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Gyve Trousers",feet="Regal Pumps +1"
	}
        
    sets.precast.FC['Enhancing Magic'] = sets.precast.FC

    sets.precast.FC.Stoneskin = sets.precast.FC['Enhancing Magic']

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {head="Piety Cap +1",ear1="Mendicant's Earring",back="Pahtli Cape",feet="Vanya Clogs"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}
	sets.precast.JA.Sublimation = {waist="Embla Sash"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Cath Palug Crown",
        legs="Gendewitha Spats"}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {        
		head="Blistering Sallet +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Cessance Earring",
        body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Shukuyu Ring",ring2="Cacoethic Ring +1",
        waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
    
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
        ear1="Friomisi Earring",ear2="Regal Earring",
        body="Chironic Doublet",hands="Inyanga Dastanas +2",ring1="Acumen Ring",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Orpheus's Sash",legs="Chironic Hose",feet="Chironic Slippers"})

	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Cleric's Torque +1",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Ebers Bliaud +1",hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Pahtli Cape",waist="Fucho-no-Obi",legs="Helios Spats",feet="Regal Pumps +1"}

    -- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {body="Zendik Robe",waist="Embla Sash"})
    
    -- Cure sets
    gear.default.obi_waist = "Goading Belt"
    gear.default.obi_back = "Mending Cape"

    sets.midcast.Cure = {
		main="Queller Rod",sub="Genbu's Shield",ammo="Esper Stone +1",
        head="Vanya Hood",neck="Incanter's Torque",ear2="Glorious Earring",
        body="Ebers Bliaud +1",hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Ebers Pantaloons +1",feet="Vanya Clogs"}

    sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {body="Ebers Bliaud +1",back="Alaunus's Cape"})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.CureMelee = sets.midcast.Cure
	
    sets.midcast.Cursna = {
        head="Ebers Cap +1",neck="Debilis Medallion",
        body="Ebers Bliaud +1",hands="Ebers Mitts +1",ring1="Haoma's Ring",ring2="Haoma's Ring",
        back="Alaunus's Cape",waist="Goading Belt",legs="Theophany Pantaloons +1",feet="Vanya Clogs"}

    sets.midcast.StatusRemoval = {
        head="Ebers Cap +1",hands="Ebers Mitts +1",legs="Ebers Pantaloons +1"}
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque +1"})
		
    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
        body="Telchine Chasuble",hands="Inyanga Dastanas +2",ring1=gear.rings.left,ring2=gear.rings.right,
        waist="Embla Sash",legs="Piety Pantaloons +1",feet="Regal Pumps +1"
	}

    sets.midcast.Stoneskin = sets.midcast['Enhancing Magic']

    sets.midcast.Auspice = sets.midcast['Enhancing Magic']

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		head="Ebers Cap +1",body="Ebers Bliaud +1",hands="Ebers Mitts +1",legs="Piety Pantaloons +1"
	})

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",
        head="Inyanga Tiara +2",body="Piety Briault +1",hands="Ebers Mitts +1",ring1=gear.rings.left,ring2=gear.rings.right,
        legs="Theophany Pantaloons +1"})

    sets.midcast.Protectra = sets.midcast['Enhancing Magic']

    sets.midcast.Shellra = sets.midcast['Enhancing Magic']

	--start here
    sets.midcast['Divine Magic'] = {main="Grioavolr",sub="Niobid Strap",
		head="Chironic Hat",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Malignance Earring",
		body="Chironic Doublet",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Chironic Slippers"}

    sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid Strap",
		head="Cath Palug Crown",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
		body="Chironic Doublet",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Alaunus's Cape",waist="Hachirin-no-Obi",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
	
	sets.midcast['Enfeebling Magic'] = sets.midcast['Divine Magic']
		
    sets.midcast['Dark Magic'] = sets.midcast['Divine Magic']

    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Divine Magic'], {
        body="Chironic Doublet",feet="Medium's Sabots"})

    sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles

    -- Sets to return to when not performing an action.
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main="Queller Rod", sub="Genbu's Shield",ammo="Homiliary",
		head="Volte Beret",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
		body="Piety Briault +1",hands="Bunzi's Gloves",ring1=gear.rings.left,ring2="Defending Ring",
		back="Moonlight Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

    sets.idle.PDT = set_combine(sets.idle, {
        neck="Loricate Torque +1",ring1="Defending Ring",ring2="Patricius Ring",back="Moonlight Cape"})

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle

    -- Resting sets
    sets.resting = sets.idle
		
    -- Defense sets

    sets.defense.PDT = {
        neck="Loricate Torque +1",
        hands="Gendewitha Gages",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonlight Cape",legs="Gendewitha Spats"}

    sets.defense.MDT = {
        head="Cath Palug Crown",neck="Loricate Torque +1",
        ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonlight Cape"
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
        head="Blistering Sallet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Chirich Ring +1",ring2="Cacoethic Ring +1",
        waist="Goading Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1"}
end

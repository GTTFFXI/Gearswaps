function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"
	}
        
    sets.precast.FC['Enhancing Magic'] = sets.precast.FC

    sets.precast.FC.Stoneskin = sets.precast.FC['Enhancing Magic']

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {head="Piety Cap +1",ear1="Mendicant's Earring",back="Pahtli Cape",feet="Vanya Clogs"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Nahtirah Hat",
        back="Kumbira Cape",legs="Gendewitha Spats"}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {        
		head="Chironic Hat",neck="Fotia Gorget",ear1="Telos Earring",ear2="Cessance Earring",
        body="Onca Suit",ring1="Shukuyu Ring",ring2="Cacoethic Ring +1",
        waist="Fotia Belt"}
    
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
        ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Witching Robe",hands="Chironic Gloves",ring1="Acumen Ring",ring2="Shiva Ring +1",
        back="Toro Cape",legs="Chironic Hose",feet="Chironic Slippers"})

	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Witching Robe",hands="Revealer's Mitts",ring1="Sangoma Ring",ring2="Stikini Ring",
		back="Pahtli Cape",waist="Fucho-no-Obi",legs="Helios Spats",feet="Regal Pumps +1"}

    -- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {body="Inyanga Jubbah +2",waist="Goading Belt"})
    
    -- Cure sets
    gear.default.obi_waist = "Goading Belt"
    gear.default.obi_back = "Mending Cape"

    sets.midcast.Cure = {
		main="Queller Rod",sub="Genbu's Shield",ammo="Esper Stone +1",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Halasz Earring",ear2="Glorious Earring",
        body="Ebers Bliaud +1",hands="Revealer's Mitts",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Vates Cape +1",waist="Hachirin-no-Obi",legs="Ebers Pantaloons +1",feet="Vanya Clogs"}

    sets.midcast.CureSolace = set_combine(sets.midcast.Cure, {body="Ebers Bliaud +1",back="Alaunus's Cape"})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.CureMelee = sets.midcast.Cure

    sets.midcast.Cursna = {
        head="Ebers Cap +1",neck="Malison Medallion",
        body="Ebers Bliaud +1",hands="Ebers Mitts +1",ring1="Ephedra Ring",ring2="Ephedra Ring",
        back="Alaunus's Cape",waist="Goading Belt",legs="Theophany Pantaloons +1",feet="Vanya Clogs"}

    sets.midcast.StatusRemoval = {
        head="Ebers Cap +1",hands="Ebers Mitts +1",legs="Ebers Pantaloons +1"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
		head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",
        body="Anhur Robe",hands="Inyanga Dastanas +2",
        legs="Piety Pantaloons +1",feet="Regal Pumps +1"
	}

    sets.midcast.Stoneskin = sets.midcast['Enhancing Magic']

    sets.midcast.Auspice = sets.midcast['Enhancing Magic']

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		head="Ebers Cap +1",body="Ebers Bliaud +1",hands="Ebers Mitts +1",legs="Piety Pantaloons +1"
	})

    sets.midcast.Regen = {main="Bolelabunga",
        body="Piety Briault +1",hands="Ebers Mitts +1",
        legs="Theophany Pantaloons +1"}

    sets.midcast.Protectra = sets.midcast['Enhancing Magic']

    sets.midcast.Shellra = sets.midcast['Enhancing Magic']

	--start here
    sets.midcast['Divine Magic'] = {main="Grioavolr",sub="Niobid Strap",
		head="Chironic Hat",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Dignitary's Earring",
		body="Chironic Doublet",hands="Chironic Gloves",ring1="Stikini Ring",ring2="Sangoma Ring",
		back="Kumbira Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Chironic Slippers"}

    sets.midcast['Dark Magic'] = sets.midcast['Divine Magic']

    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Divine Magic'], {
        body="Chironic Doublet",feet="Medium's Sabots"})

    sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles

    -- Sets to return to when not performing an action.
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main="Bolelabunga", sub="Genbu's Shield",ammo="Homiliary",
		head="Befouled Crown",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
		body="Witching Robe",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

    sets.idle.PDT = set_combine(sets.idle, {
        neck="Loricate Torque +1",ring1="Defending Ring",ring2="Patricius Ring",back="Moonbeam Cape"})

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle

    -- Resting sets
    sets.resting = sets.idle
		
    -- Defense sets

    sets.defense.PDT = {
        neck="Loricate Torque +1",
        hands="Gendewitha Gages",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",legs="Gendewitha Spats"}

    sets.defense.MDT = {
        head="Nahtirah Hat",neck="Loricate Torque +1",
        ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape"
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
        head="Chironic Hat",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Onca Suit",ring1="Patricius Ring",ring2="Cacoethic Ring +1",
        waist="Goading Belt"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1"}
end

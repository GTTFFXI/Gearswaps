-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants +1"}


    -- Fast cast sets for spells

    sets.precast.FC = {
        head="Nahtirah Hat",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Anhur Robe",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Veneficium Ring",
        back="Perimede Cape",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkarole Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Chironic Hose",feet="Vanya Clogs"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'])
    --sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

	sets.precast.WS = {
		head="Chironic Hat",neck="Fotia Gorget",ear1="Telos Earring",ear2="Cessance Earring",
        body="Onca Suit",ring1="Chirich Ring",ring2="Cacoethic Ring +1",
        waist="Fotia Belt"}

	
	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Witching Robe",hands="Revealer's Mitts",ring1="Sangoma Ring",ring2="Stikini Ring",
		back="Pahtli Cape",waist="Fucho-no-Obi",legs="Helios Spats",feet="Regal Pumps +1"}


    -- Midcast Sets

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {body="Merlinic Jubbah"})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",
        body="Chironic Doublet",hands="Revealer's Mitts",ring2="Sirona's Ring",
        back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}

    sets.midcast.CureWithLightWeather = sets.midcast.Cure

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Regen = {main="Bolelabunga",head="Arbatel Bonnet +1",back="Lugh's Cape"}

    sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}

    sets.midcast['Enhancing Magic'] = {
        head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",
        body="Anhur Robe",hands="Chironic Gloves",
        legs="Lengo Pants",feet="Regal Pumps +1"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'])

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers +1"})

    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Dignitary's Earring",
		body="Merlinic Jubbah",hands="Chironic Gloves",ring1="Stikini Ring",ring2="Sangoma Ring",
		back="Lugh's Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Medium's Sabots"
	}
	
    sets.midcast.MndEnfeebles = sets.midcast['Enfeebling Magic']

    sets.midcast.IntEnfeebles = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = sets.midcast['Enfeebling Magic']

	sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Barkarole Earring",
        body="Merlinic Jubbah",hands="Chironic Gloves",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back="Lugh's Cape",waist="Eschan Stone",legs="Merlinic Shalwar",feet="Merlinic Crackows"}
	
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
    sets.midcast.Kaustra = sets.midcast['Elemental Magic']

    sets.midcast.Drain = sets.midcast['Dark Magic']

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = sets.midcast.FastRecast

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun)

    -- Elemental Magic sets are default for handling low-tier nukes.


    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		body="Merlinic Jubbah",ear1="Gwati Earring",ear2="Dignitary's Earring",
		ring1="Stikini Ring",ring2="Sangoma Ring"})

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']

    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant)

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})


    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.idle = {main="Grioavolr",sub="Niobid Strap",ammo="Homiliary",
        head="Befouled Crown",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}
	
	sets.resting = sets.idle

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town = set_combine(sets.idle, {})

    sets.idle.Field = sets.idle

    sets.idle.Field.PDT = sets.idle

    sets.idle.Field.Stun = sets.idle

    sets.idle.Weak = sets.idle
	
    -- Defense sets

    sets.defense.PDT = {
        head="Nahtirah Hat",neck="Loricate Torque +1",ear2="Loquacious Earring",
        body="Merlinic Jubbah",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape"}

    sets.defense.MDT = {
        head="Nahtirah Hat",neck="Loricate Torque +1",ear2="Loquacious Earring",
        ring1="Patricius Ring",ring2="Defending Ring"}

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		head="Chironic Hat",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Onca Suit",ring1="Patricius Ring",ring2="Cacoethic Ring +1",
        waist="Goading Belt"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Savant's Pants +2"}
    sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}

    sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
end
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

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants +1"}


    -- Fast cast sets for spells

    sets.precast.FC = {
        head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Etiolation Earring",
        body="Zendik Robe",hands="Gendewitha Gages",ring1="Kishar Ring",ring2="Veneficium Ring",
        back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendicant's Earring",back="Pahtli Cape",legs="Chironic Hose",feet="Vanya Clogs"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

	sets.precast.WS = {
		head="Nyame Helm",neck="Fotia Gorget",ear1="Telos Earring",ear2="Cessance Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Chirich Ring +1",ring2="Cacoethic Ring +1",
        waist="Fotia Belt",legs="Amalric Slops +1",feet="Nyame Sollerets"}

	
	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Baetyl Pendant",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Amalric Doublet +1",hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Pahtli Cape",waist="Fucho-no-Obi",legs="Amalric Slops +1",feet="Regal Pumps +1"}


    -- Midcast Sets

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {body="Zendik Robe"})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",
        body="Chironic Doublet",hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}

    sets.midcast.CureWithLightWeather = sets.midcast.Cure

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}

    sets.midcast['Enhancing Magic'] = {
        head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
        body="Telchine Chasuble",hands="Jhakri Cuffs +2",ring1=gear.rings.left,ring2=gear.rings.right,
        waist="Embla Sash",legs="Telchine Braconi",feet="Regal Pumps +1"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",head="Arbatel Bonnet +1",ring1=gear.rings.left,ring2=gear.rings.right,back="Lugh's Cape"})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'])

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers +1"})

    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {main="Raetic Staff +1",sub="Khonsu",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Malignance Earring",ear2="Dignitary's Earring",
		body="Chironic Doublet",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Lugh's Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Medium's Sabots"
	}
	
    sets.midcast.MndEnfeebles = sets.midcast['Enfeebling Magic']

    sets.midcast.IntEnfeebles = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = sets.midcast['Enfeebling Magic']

	sets.midcast['Elemental Magic'] = {main="Raetic Staff +1",sub="Khonsu",ammo="Pemphredo Tathlum",
        head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Regal Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back="Lugh's Cape",waist="Eschan Stone",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
		neck="Mizukage-no-Kubikazari",ring2="Mujin Band",legs="Nyame Flanchard"
	})
	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Burst = sets.midcast['Elemental Magic'].Burst
	
	sets.midcast['Elemental Magic'].VagaryProc = {
		main="Warp Cudgel",ammo="Pemphredo Tathlum",
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Regal Earring",
		body="Amalric Doublet +1",hands="Gendewitha Gages",ring1="Shiva Ring +1",ring2="Acumen Ring",
		back="Lugh's Cape",waist="Eschan Stone",legs="Volte Brais",feet="Amalric Nails +1"
	}
	
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
    sets.midcast.Kaustra = sets.midcast['Elemental Magic']

    sets.midcast.Drain = sets.midcast['Dark Magic']

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = sets.midcast.FastRecast

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun)

    -- Elemental Magic sets are default for handling low-tier nukes.


    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		hands="Nyame Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		legs="Nyame Flanchard",feet="Nyame Sollerets"})
		
	

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']

    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant)

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=empty,body="Twilight Cloak"})


    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.idle = {main="Raetic Staff +1",sub="Khonsu",ammo="Homiliary",
        head="Volte Beret",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Etiolation Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1=gear.rings.left,ring2="Defending Ring",
        back="Moonlight Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}
	
	sets.resting = sets.idle

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town = set_combine(sets.idle, {})

    sets.idle.Field = sets.idle

    sets.idle.Field.PDT = sets.idle

    sets.idle.Field.Stun = sets.idle

    sets.idle.Weak = sets.idle
	
    -- Defense sets

    sets.defense.PDT = {
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Malignance Earring",
        body="Amalric Doublet +1",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonlight Cape",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.defense.MDT = {
        head="Nyame Helm",neck="Loricate Torque +1",ear1="Malignance Earring",
        ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonlight Cape",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		head="Blistering Sallet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Chirich Ring +1",ring2="Cacoethic Ring +1",
        waist="Goading Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Savant's Pants +2"}
    sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}

    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
end
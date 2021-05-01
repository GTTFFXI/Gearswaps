function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Burst')
    state.IdleMode:options('Normal', 'PDT')

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
	send_command('bind ^` input /ja "Entrust" <me>')
	send_command('bind !` eh cycle')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.skill = {main="Idris",sub="Genbu's Shield",head="Azimuth Hood +1",neck="Incanter's Torque",
		body="Bagua Tunic +1",hands="Geomancy Mitaines +2",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Nantosuelta's Cape",waist="Kobo Obi",feet="Medium's Sabots"}

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",back="Nantosuelta's Cape"}
	

    -- Fast cast sets for spells

    sets.precast.FC = {main="Idris",sub="Genbu's Shield",head="Cath Palug Crown",ear2="Malignance Earring", neck="Baetyl Pendant",
        body="Zendik Robe",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Gyve Trousers",feet="Vanya Clogs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Baetyl Pendant",hands="Bagua Mitaines"})
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Ea Hat +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Ea Houppelande +1",hands="Amalric Gages +1",ring1="Chirich Ring +1",ring2="Cacoethic Ring +1",
        waist="Fotia Belt",legs="Ea Slops",feet="Amalric Nails +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
        head="Ea Hat +1",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Ea Houppelande +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back="Toro Cape",waist="Orpheus's Sash"})


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = set_combine(sets.FC, {
        body="Ea Houppelande +1",hands="Bagua Mitaines",
        waist="Goading Belt"})

    sets.midcast.Geomancy = sets.skill
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Malignance Earring",
        hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}
    
    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    sets.midcast.Protectra = {neck="Incanter's Torque",ring1="Sheltered Ring"}

    sets.midcast.Shellra = {neck="Incanter's Torque",ring1="Sheltered Ring"}
	sets.midcast['Enhancing Magic'] = set_combine(sets.precast.FC, {
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Telchine Chasuble",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Embla Sash",legs="Telchine Braconi",feet="Regal Pumps +1"
	})
    sets.midcast['Elemental Magic'] = {main="Idris",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Ea Hat +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Ea Houppelande +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back="Nantosuelta's Cape",waist="Orpheus's Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {neck="Mizukage-no-Kubikazari",ring1="Freke Ring",ring2="Mujin Band",legs="Ea Slops"})
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		ring1=gear.rings.left,ring2=gear.rings.right})
	
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=empty,body="Twilight Cloak"})
	
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		head="Nyame Helm",body="Zendik Robe",hands="Jhakri Cuffs +2",legs="Nyame Flanchard",feet="Medium's Sabots"})
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.idle = {main="Idris",sub="Genbu's Shield",range="Dunna",
        head="Volte Beret",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Amalric Doublet +1",hands="Bagua Mitaines",ring1=gear.rings.left,ring2="Defending Ring",
        back="Moonlight Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

    sets.resting = sets.idle

    sets.idle.PDT = set_combine(sets.idle, {
        head="Nyame Helm",neck="Loricate Torque +1",
        hands="Geomancy Mitaines +2",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonlight Cape",legs="Nyame Flanchard",feet="Nyame Sollerets"})

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {main="Idris",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
		hands="Geomancy Mitaines +2",ring1=gear.rings.left,ring2="Defending Ring",
		back="Nantosuelta's Cape",legs="Telchine Braconi",feet="Bagua Sandals +1"
	})

    sets.idle.PDT.Pet = set_combine(sets.idle.PDT, sets.idle.Pet)

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle)
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet)
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT)
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet)

    sets.idle.Town = set_combine(sets.idle, {})

    sets.idle.Weak = sets.idle.PDT

    -- Defense sets

    sets.defense.PDT = {
        head="Nyame Helm",neck="Loricate Torque +1",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Geomancy Mitaines +2",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonlight Cape",waist="Goading Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.defense.MDT = {}

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		head="Blistering Sallet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Patricius Ring",ring2="Cacoethic Ring +1",
        waist="Goading Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

	sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
end

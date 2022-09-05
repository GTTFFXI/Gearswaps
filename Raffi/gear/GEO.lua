function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	
	send_command('bind ^` input /ja "Entrust" <me>')
	send_command('bind !` eh cycle')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.skill = {main="Solstice",sub="Genbu's Shield",range="Dunna",head="Azimuth Hood +1",neck="Incanter's Torque",
		body="Bagua Tunic +1",hands="Geomancy Mitaines +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Nantosuelta's Cape",waist="Kobo Obi",feet="Medium's Sabots"}

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",back="Nantosuelta's Cape"}
	

    -- Fast cast sets for spells

    sets.precast.FC = {main="Solstice",sub="Genbu's Shield",head="Nahtirah Hat",ear2="Loquacious Earring", neck="Baetyl Pendant",
        body="Zendik Robe",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Volte Brais",feet="Regal Pumps +1"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Gyve Trousers",feet="Vanya Clogs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Sanctity Necklace",ear1="Barkarole Earring",hands="Bagua Mitaines"})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Ea Hat",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Ea Houppelande",hands="Amalric Gages +1",ring1="Chirich Ring",ring2="Cacoethic Ring +1",
        waist="Fotia Belt",legs="Ea Slops",feet="Amalric Nails +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
        head="Ea Hat",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Ea Houppelande",ring1="Acumen Ring",ring2="Shiva Ring +1",
        back="Toro Cape"})


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = set_combine(sets.FC, {
        body="Ea Houppelande",hands="Bagua Mitaines",
        waist="Goading Belt"})

    sets.midcast.Geomancy = sets.skill
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Loquacious Earring",
        hands="Revealer's Mitts",ring1="Sirona's Ring",
        legs="Gyve Trousers",feet="Vanya Clogs"}
    
    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    sets.midcast.Protectra = {neck="Incanter's Torque",ring1="Sheltered Ring"}

    sets.midcast.Shellra = {neck="Incanter's Torque",ring1="Sheltered Ring"}

    sets.midcast['Elemental Magic'] = {main="Idris",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Ea Hat",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Ea Houppelande",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back="Nantosuelta's Cape",waist="Eschan Stone",legs="Ea Slops",feet="Amalric Nails +1"}
	
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		ear1="Gwati Earring",ear2="Dignitary's Earring",ring1="Stikini Ring",ring2="Sangoma Ring"})
	
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		head="Jhakri Coronal +2",body="Zendik Robe",hands="Jhakri Cuffs +2",legs="Jhakri Slops +2",feet="Medium's Sabots"})
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.idle = {main="Solstice",sub="Genbu's Shield",range="Dunna",
        head="Nahtirah Hat",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Bagua Mitaines",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Herald's Gaiters"}

    sets.resting = sets.idle

    sets.idle.PDT = set_combine(sets.idle, {
        head="Vanya Hood",neck="Loricate Torque +1",
        hands="Geomancy Mitaines +1",ring1="Patricius Ring",ring2="Defending Ring",
        back="Mecistopins Mantle",feet="Azimuth Gaiters +1"})

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {main="Idris",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
		hands="Geomancy Mitaines +1",ring1="Thurandaut Ring +1",ring2="Defending Ring",
		back="Mecistopins Mantle",legs="Telchine Braconi",feet="Bagua Sandals +1"
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
        neck="Loricate Torque +1",ear2="Loquacious Earring",
        body="Witching Robe",hands="Geomancy Mitaines +2",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Goading Belt"}

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
		head="Jhakri Coronal +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Patricius Ring",ring2="Cacoethic Ring +1",
        waist="Goading Belt",legs="Jhakri Slops +2"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

	sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
end

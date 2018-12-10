function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Burst', 'Resistant', 'Proc', 'Exp')
    state.IdleMode:options('Normal', 'PDT', 'Death')
    state.Nuke = M{['description']='Nuke'}
	
    state.MagicBurst = M(false, 'Magic Burst')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

	state.Nuke:options('Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder')
		
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>')
	send_command('bind !` eh cycle')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	sets.magicAcc = {
		head="Ea Hat",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Dignitary's Earring",
		body="Ea Houppelande",hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Sangoma Ring",
		back="Taranus's Cape",legs="Ea Slops",feet="Amalric Nails +1"}

	sets.FC = {head="Nahtirah Hat",ear1="Etiolation Earring",ear2="Loquacious Earring", neck="Orunmila's Torque",
        body="Zendik Robe",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}

	sets.FCmAcc = set_combine(sets.FC, {
		head="Ea Hat",body="Ea Houppelande",hands="Amalric Gages +1",ring2="Sangoma Ring",legs="Ea Slops"})
		
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back="Taranus's Cape",feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = sets.FC

    sets.precast.FC['Enhancing Magic'] = sets.precast.FC

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {head="Goetia Petasos +2",neck="Sanctity Necklace",ear1="Barkarole Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Gyve Trousers",feet="Vanya Clogs"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.Death = set_combine(sets.precast.FC, {ammo="Psilomene",
		head="Amalric Coif",hands="Amalric Gages +1",ring1="Mephitas's Ring +1",ring2="Kishar Ring",back="Taranus's Cape",waist="Hachirin-no-Obi",legs="Psycloth Lappas"
	})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Ea Hat",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Ea Houppelande",hands="Amalric Gages +1",ring1="Shukuyu Ring",ring2="Cacoethic Ring +1",
        back="Taranus's Cape",waist="Fotia Belt",legs="Ea Slops",feet="Amalric Nails +1"}

	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Witching Robe",hands="Revealer's Mitts",ring1="Sangoma Ring",ring2="Stikini Ring",
		back="Pahtli Cape",waist="Fucho-no-Obi",legs="Helios Spats",feet="Regal Pumps +1"}

    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Ea Houppelande",ring1="Kishar Ring",
        back="Perimede Cape",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"
	})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Loquacious Earring",
        hands="Revealer's Mitts",ring2="Sirona's Ring",
        back="Solemnity Cape",feet="Vanya Clogs"}
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    
	sets.midcast['Enhancing Magic'] = {neck="Incanter's Torque",ring1="Stikini Ring"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast['Enfeebling Magic'] = set_combine(sets.magicAcc, {
		main="Grioavolr",sub="Niobid Strap"
    })
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = sets.FCmAcc

    sets.midcast.Drain = set_combine(sets.midcast.FastRecast, {neck="Incanter's Torque",waist="Fucho-no-Obi"})
	sets.midcast.Aspir = set_combine(sets.midcast.Drain, {ring1="Mephitas's Ring +1",legs="Psycloth Lappas"})

    sets.midcast.Stun = sets.FCmAcc
    sets.midcast.BardSong = sets.FCmAcc

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head="Ea Hat",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Barkarole Earring",
        body="Ea Houppelande",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back="Taranus's Cape",waist="Eschan Stone",legs="Ea Slops",feet="Amalric Nails +1"}
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
		neck="Mizukage-no-Kubikazari",ring2="Mujin Band"
	})
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
	sets.midcast.Comet = set_combine(sets.midcast['Elemental Magic'].Burst, {
		head="Pixie Hairpin +1",ear1="Static Earring",ring2="Archon Ring"
	})
	sets.midcast.Death = set_combine(sets.midcast.Comet, {ammo="Psilomene",
		ring1="Mephitas's Ring +1",legs="Amalric Slops"
	})

	sets.midcast.Comet = sets.midcast.Death
	
    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], sets.magicAcc)
	sets.midcast['Elemental Magic'].Exp = set_combine(sets.midcast['Elemental Magic'], {body="Spaekona's Coat +1"})
	
    sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = sets.midcast['Elemental Magic'].Resistant

    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = sets.magicAcc

    -- Sets to return to when not performing an action.
    
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
        head="Volte Beret",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

	sets.idle.Death = set_combine(sets.idle, {ammo="Psilomene",
		head="Amalric Coif",neck="Loricate Torque +1",hands="Amalric Gages +1",ring1="Mephitas's Ring +1",back="Pahtli Cape",waist="Fucho-no-Obi",legs="Amalric Slops"
	})	
		
    -- Town gear.
	sets.idle.Town = set_combine(sets.idle, {})      

	sets.resting = sets.idle
    
	-- Defense sets

    sets.defense.PDT = {
        head="Nahtirah Hat",neck="Loricate Torque +1",
        body="Ea Houppelande",hands="Merlinic Dastanas",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Fucho-no-obi"}

    sets.defense.MDT = sets.defense.PDT

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
    

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Nahtirah Hat",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Onca Suit",ring1="Patricius Ring",ring2="Cacoethic Ring +1",
        back="Taranus's Cape",waist="Goading Belt"}

end
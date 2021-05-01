function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'MPReturn', 'Burst', 'MPReturnBurst', 'Resistant', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'Death')
    state.Nuke = M{['description']='Nuke'}
	
    state.MagicBurst = M(false, 'Magic Burst')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

	state.Nuke:options('Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder')

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
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
		head="Cath Palug Crown",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
		body="Spaekona's Coat +3",hands="Nyame Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Taranus's Cape",legs="Ea Slops",feet="Nyame Sollerets"}

	sets.FC = {head="Cath Palug Crown",ear1="Etiolation Earring",ear2="Malignance Earring", neck="Baetyl Pendant",
        body="Zendik Robe",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"}

	sets.FCmAcc = set_combine(sets.FC, {
		head="Cath Palug Crown",body="Ea Houppelande +1",hands="Amalric Gages +1",ring2=gear.rings.right,legs="Ea Slops"})
		
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back="Taranus's Cape",feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = sets.FC

    sets.precast.FC['Enhancing Magic'] = sets.precast.FC

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Baetyl Pendant"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Gyve Trousers",feet="Vanya Clogs"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.Death = set_combine(sets.precast.FC, {ammo="Psilomene",
		head="Amalric Coif",hands="Amalric Gages +1",ring1="Mephitas's Ring +1",ring2="Kishar Ring",back="Taranus's Cape",waist="Hachirin-no-Obi"
	})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Ea Hat +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Ea Houppelande +1",hands="Amalric Gages +1",ring1="Shukuyu Ring",ring2="Cacoethic Ring +1",
        back="Taranus's Cape",waist="Orpheus's Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}

	sets.precast.WS['Myrkr'] = {
		head="Vanya Hood",neck="Baetyl Pendant",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Amalric Doublet +1",hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Pahtli Cape",waist="Fucho-no-Obi",legs="Amalric Slops +1",feet="Regal Pumps +1"}

    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
        head="Cath Palug Crown",ear2="Malignance Earring",
        body="Ea Houppelande +1",ring1="Kishar Ring",
        back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"
	})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Malignance Earring",
        hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Solemnity Cape",feet="Vanya Clogs"}
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    
	sets.midcast['Enhancing Magic'] = set_combine(sets.precast.FC, {
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Telchine Chasuble",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Embla Sash",legs="Telchine Braconi",feet="Regal Pumps +1"
	})
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast['Enfeebling Magic'] = set_combine(sets.magicAcc, {
		main="Raetic Staff +1",sub="Khonsu"
    })
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = sets.FCmAcc

    sets.midcast.Drain = set_combine(sets.midcast.FastRecast, {neck="Incanter's Torque",waist="Fucho-no-Obi"})
	sets.midcast.Aspir = set_combine(sets.midcast.Drain, {ring1="Mephitas's Ring +1",legs="Volte Brais"})

    sets.midcast.Stun = sets.FCmAcc
    sets.midcast.BardSong = sets.FCmAcc

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {main="Raetic Staff +1",sub="Khonsu",ammo="Pemphredo Tathlum",
		head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Ea Houppelande +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back="Taranus's Cape",waist="Eschan Stone",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
		head="Ea Hat +1",neck="Mizukage-no-Kubikazari",ring1="Freke Ring",ring2="Mujin Band",legs="Ea Slops"
	})
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
	sets.midcast.Comet = set_combine(sets.midcast['Elemental Magic'].Burst, {
		head="Pixie Hairpin +1",ear1="Static Earring",ring2="Archon Ring"
	})
	sets.midcast.Death = set_combine(sets.midcast.Comet, {ammo="Psilomene",
		ring2="Mephitas's Ring +1",legs="Amalric Slops +1"
	})
	 
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], sets.magicAcc)
	sets.midcast['Elemental Magic'].MPReturn = set_combine(sets.midcast['Elemental Magic'], {body="Spaekona's Coat +3"})
	sets.midcast['Elemental Magic'].MPReturnBurst = set_combine(sets.midcast['Elemental Magic'].Burst, {body="Spaekona's Coat +3"})
	
    sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=empty,body="Twilight Cloak"})

    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = sets.magicAcc

    -- Sets to return to when not performing an action.
    
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Raetic Staff +1",sub="Khonsu",ammo="Pemphredo Tathlum",
        head="Volte Beret",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1=gear.rings.left,ring2="Defending Ring",
        back="Moonlight Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

	sets.idle.Death = set_combine(sets.idle, {ammo="Psilomene",
		head="Amalric Coif",neck="Loricate Torque +1",hands="Amalric Gages +1",ring2="Mephitas's Ring +1",back="Pahtli Cape",waist="Fucho-no-Obi",legs="Amalric Slops +1"
	})	
		
    -- Town gear.
	sets.idle.Town = set_combine(sets.idle, {})      

	sets.resting = sets.idle
    
	-- Defense sets

    sets.defense.PDT = {
        head="Nyame Helm",neck="Loricate Torque +1",
        body="Ea Houppelande +1",hands="Merlinic Dastanas",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonlight Cape",waist="Fucho-no-obi",legs="Nyame Flanchard",feet="Nyame Sollerets"}

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
		head="Blistering Sallet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Patricius Ring",ring2="Chirich Ring +1",
        back="Taranus's Cape",waist="Goading Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

end
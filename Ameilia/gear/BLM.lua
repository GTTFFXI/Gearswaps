function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'MPReturn', 'Burst', 'MPReturnBurst', 'ResistantBurst', 'Resistant', 'Proc', 'Ongo')
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
	
	gear.back={}
	gear.back.melee={ name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.back.nuke={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	
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
		head="Cath Palug Crown",neck="Null Loop",ear1="Regal Earring",ear2="Malignance Earring",
		body="Wicce Coat +3",hands="Spaekona's Gloves",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",waist="Acuity Belt +1",legs="Wicce Chausses +3",feet="Wicce Sabots +3"}

	sets.FC = {head="Merlinic Hood",neck="Baetyl Pendant",ear2="Malignance Earring",
        body="Zendik Robe",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"}

	sets.FCmAcc = set_combine(sets.FC, sets.magicAcc, {
		head="Cath Palug Crown",hands="Spaekona's Gloves",ring2=gear.rings.right})
		
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back=gear.back.nuke,feet="Wicce Sabots +3"}

    sets.precast.JA.Manafont = {body="Archmage's Coat +3"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = set_combine(sets.FC, {})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {head="Wicce Petasos +3",neck="Baetyl Pendant"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",legs="Gyve Trousers",feet="Vanya Clogs"})
    sets.precast.FC.Curaga = set_combine(sets.precast.FC.Cure, {})
	
	sets.precast.Death = set_combine(sets.precast.FC, {ammo="Psilomene",
		head="Null Masque",hands="Agwu's Gages",ring1="Mephitas's Ring +1",ring2="Kishar Ring",back=gear.back.nuke,waist="Hachirin-no-Obi"
	})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Oshasha's Treatise",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shukuyu Ring",ring2="Epaminondas's Ring",
        back=gear.back.nuke,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Myrkr'] = {
		head="Null Masque",neck="Baetyl Pendant",ear1="Mendicant's Earring",ear2="Andoaa Earring",
		body="Wicce Coat +3",hands="Spaekona's Gloves",ring1="Metamorph Ring +1",ring2="Lebeche Ring",
		back="Fi Follet Cape +1",waist="Acuity Belt +1",legs="Wicce Chausses +3",feet="Wicce Sabots +3"}

	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS, {ammo="Sroda Tathlum",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Moonshade Earring",ring1="Archon Ring"
	})
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Cataclysm'], {
		head="Nyame Helm",ring1="Metamorph Ring +1"
	})
	sets.precast.WS['Earth Crusher'] = set_combine(sets.precast.WS['Aeolian Edge'], {})
	sets.precast.WS['Vidohunir'] = set_combine(sets.precast.WS['Aeolian Edge'], {ear2="Malignance Earring"})

    ---- Midcast Sets ----

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
        head="Merlinic Hood",ear2="Malignance Earring",
        body="Ea Houppelande +1",ring1="Kishar Ring",
        back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"
	})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Malignance Earring",
        body="Shamash Robe",hands="Regal Cuffs",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}
	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})
	sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    
	sets.midcast['Enhancing Magic'] = set_combine(sets.precast.FC, {
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Telchine Chasuble",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Embla Sash",legs="Telchine Braconi",feet="Regal Pumps +1"
	})
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

    sets.midcast['Enfeebling Magic'] = set_combine(sets.magicAcc, {
		main="Bunzi's Rod",sub="Ammurapi Shield",
    })
        
    sets.midcast.ElementalEnfeeble = set_combine(sets.magicAcc, {head="Wicce Petasos +3",body="Archmage's Coat +3",legs="Agwu's Slops",feet="Archmage's Sabots +4"})

    sets.midcast['Dark Magic'] = set_combine(sets.FCmAcc, {})

    sets.midcast.Drain = set_combine(sets.midcast.FastRecast, {neck="Incanter's Torque",waist="Fucho-no-Obi"})
	sets.midcast.Aspir = set_combine(sets.midcast.Drain, {legs="Volte Brais"})

    sets.midcast.Stun = set_combine(sets.FCmAcc, {})
    sets.midcast.BardSong = set_combine(sets.FCmAcc, {})

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Sroda Tathlum",
		head="Agwu's Cap",neck="Sorcerer's Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Wicce Coat +3",hands="Agwu's Gages",ring1="Metamorph Ring +1",ring2="Freke Ring",
        back=gear.back.nuke,waist="Hachirin-no-Obi",legs="Wicce Chausses +3",feet="Wicce Sabots +3"}
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
		head="Ea Hat +1",neck="Sorcerer's Stole +2",waist="Hachirin-no-Obi",legs="Agwu's Slops",feet="Agwu's Pigaches"
	})
	sets.midcast['Elemental Magic'].Ongo = set_combine(sets.midcast['Elemental Magic'].Burst, {
		hands="Agwu's Gages",ring1=gear.rings.left,feet="Agwu's Pigaches"
	})
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
	sets.midcast.Comet = set_combine(sets.midcast['Elemental Magic'].Burst, {
		head="Pixie Hairpin +1",ring2="Archon Ring"
	})
	sets.midcast.Death = set_combine(sets.midcast.Comet, {ammo="Psilomene",
		ring2="Mephitas's Ring +1",legs="Wicce Chausses +3"
	})
	 
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], sets.magicAcc)
	sets.midcast['Elemental Magic'].MPReturn = set_combine(sets.midcast['Elemental Magic'], {body="Spaekona's Coat +4"})
	sets.midcast['Elemental Magic'].MPReturnBurst = set_combine(sets.midcast['Elemental Magic'].Burst, {body="Spaekona's Coat +4"})
	sets.midcast['Elemental Magic'].ResistantBurst = set_combine(sets.midcast['Elemental Magic'].Burst, {neck="Sorcerer's Stole +2",hands="Spaekona's Gloves",back=gear.back.nuke,feet="Archmage's Sabots +4"})
	
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})

	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=empty,body="Crepuscular Cloak"})

    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = set_combine(sets.magicAcc, {})

    -- Sets to return to when not performing an action.
    
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
        head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
        body="Shamash Robe",hands="Nyame Gauntlets",ring1=gear.rings.left,ring2="Murky Ring",
        back=gear.back.nuke,waist="Null Belt",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

	sets.idle.Death = set_combine(sets.idle, {ammo="Psilomene",
		head="Null Masque",neck="Null Loop",hands="Agwu's Gages",ring2="Mephitas's Ring +1",waist="Fucho-no-Obi",legs="Wicce Chausses +3"
	})	
		
    -- Town gear.
	sets.idle.Town = set_combine(sets.idle, {})      

	sets.resting = set_combine(sets.idle, {})
    
	-- Defense sets

    sets.defense.PDT = {
        head="Nyame Helm",neck="Null Loop",ear1="Alabaster Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Murky Ring",
        back=gear.back.nuke,waist="Fucho-no-obi",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {})

    sets.Kiting = {feet="Crier's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Wicce Sabots +3"}
    
	sets.JAs = {legs="Wicce Chausses +3"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Wicce Petasos +3",neck="Null Loop",ear1="Suppanomimi",ear2="Eabani Earring",
        body="Wicce Coat +3",hands="Nyame Gauntlets",ring1="Lehko's Ring",ring2="Chirich Ring +1",
        back="Null Shawl",waist="Null Belt",legs="Wicce Chausses +3",feet="Wicce Sabots +3"}

end
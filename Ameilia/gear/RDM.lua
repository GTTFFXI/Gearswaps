-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'DW', 'Hybrid', 'StoreTP')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant', 'Burst')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
	gear.capes = {}
	gear.capes.magic = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	gear.capes.melee = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.wsdmg = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.capes.magicws = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
	
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
	send_command('bind !` eh cycle')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitiation Tabard +3"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
	sets.precast.FC = {
		head="Atrophy Chapeau +3",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Lethargy Earring +1",
		body="Vitiation Tabard +3",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Carmine Greaves +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})
		
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Oshasha's Treatise",
        head="Vitiation Chapeau +4",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Ilabrat Ring",
        back=gear.capes.wsdmg,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Lethargy Houseaux +3"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Burning Blade'] = set_combine(sets.precast.WS, {ammo="Sroda Tathlum",
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Regal Earring",
        body="Nyame Mail",ring1="Epaminondas's Ring",ring2="Freke Ring",
        back=gear.capes.magicws,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lethargy Houseaux +3"})
	sets.precast.WS['Red Lotus Blade'] = set_combine(sets.precast.WS['Burning Blade'], {})
	sets.precast.WS['Shining Blade'] = set_combine(sets.precast.WS['Burning Blade'], {ring2="Weatherspoon Ring +1"})
	sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS['Shining Blade'], {})
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Burning Blade'], {ear2="Malignance Earring"})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Burning Blade'], {head="Pixie Hairpin +1",ring1="Archon Ring",ring2="Epaminondas's Ring"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ring1="Begrudging Ring",ring2="Lehko's Ring",feet="Lethargy Houseaux +3"})
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Republican Platinum Medal",ring2="Sroda Ring",waist="Sailfi Belt +1"})
	sets.precast.WS['Death Blossom'] = set_combine(sets.precast.WS['Savage Blade'], {
		ammo="Coiste Bodhar",ear1="Sherida Earring",ear2="Regal Earring"		
	})
	sets.precast.WS['Fast Blade II'] = set_combine(sets.precast.WS['Savage Blade'], {
		head="Bunzi's Hat",ear1="Sherida Earring",
		hands="Bunzi's Gloves",ring2="Hetairoi Ring",
		back="Null Shawl",
	})
	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {})
    -- Midcast Sets
    
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Malignance Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
        back=gear.capes.magic,waist="Embla Sash",legs="Volte Brais",feet="Vanya Clogs"}
	sets.midcast.Cursna = {neck="Debilis Medallion",body="Vitiation Tabard +3",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})
    sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {})

    sets.midcast['Enhancing Magic'] = {
        head="Telchine Cap",neck="Duelist's Torque +2",ear1="Mimir Earring",ear2="Lethargy Earring +1",
        body="Vitiation Tabard +3",hands="Atrophy Gloves +3",ring1=gear.rings.left,ring2=gear.rings.right,
        back=gear.capes.magic,waist="Embla Sash",legs="Telchine Braconi",feet="Lethargy Houseaux +3"}

	sets.midcast.Enspell = set_combine(sets.midcast['Enhancing Magic'], {main="Pukulatmuj +1",sub="Pukulatmuj",
		head="Befouled Crown",neck="Incanter's Torque",ear2="Andoaa Earring",
		hands="Vitiation Gloves +3",
		legs="Atrophy Tights +3",back="Ghostfyre Cape",waist="Olympus Sash"})
	
	sets.midcast.Temper = set_combine(sets.midcast.Enspell, {})
	sets.midcast['Temper II'] = set_combine(sets.midcast.Temper, {})
		
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Lethargy Fuseau +3"})

    sets.midcast.Stoneskin = {}
    
    sets.midcast['Enfeebling Magic'] = {ammo="Regal Gem",
        head="Vitiation Chapeau +4",neck="Duelist's Torque +2",ear1="Crepuscular Earring",ear2="Snotra Earring",
        body="Lethargy Sayon +3",hands="Lethargy Gantherots +3",ring1="Kishar Ring",ring2=gear.rings.right,
        back=gear.capes.magic,waist="Obstinate Sash",legs="Chironic Hose",feet="Vitiation Boots +4"}

	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {range="Ullr",
		ear1="Regal Earring",body="Lethargy Sayon +3",hands="Lethargy Gantherots +3",ring1=gear.rings.left,back="Null Shawl"
	})
	
	sets.midcast.Dispel = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +4"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +4", back=gear.capes.magicws})
	sets.midcast['Paralyze II'] = set_combine(sets.midcast['Slow II'], {})
	sets.midcast['Addle II'] = set_combine(sets.midcast['Slow II'], {})
    sets.midcast['Frazzle II'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {neck="Null Loop",ring1="Metamorph Ring +1"})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast['Enfeebling Magic'], {
		body="Lethargy Sayon +3",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,back=gear.capes.magicws})
	sets.midcast['Distract III'] = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.capes.magicws})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.capes.magicws})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.capes.magicws})

	sets.midcast['Silence'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	sets.midcast['Sleepga'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Sleep'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		ring1="Kishar Ring"
	})
	sets.midcast['Sleep II'] = set_combine(sets.midcast['Sleep'], {})
	sets.midcast['Bind'] = set_combine(sets.midcast['Sleep'], {})
	
	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs"})
	
    sets.midcast['Elemental Magic'] = {ammo="Sroda Tathlum",
        head="Lethargy Chappel +2",neck="Sibyl Scarf",ear1="Regal Earring",ear2="Malignance Earring",
        body="Lethargy Sayon +3",hands="Lethargy Gantherots +3",ring1="Metamorph Ring +1",ring2="Freke Ring",
        back=gear.capes.magic,waist="Acuity Belt +1",legs="Lethargy Fuseau +3",feet="Lethargy Houseaux +3"}
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'],{
		neck="Duelist's Torque +2",
		hands="Lethargy Gantherots +3",ring1=gear.rings.left,ring2=gear.rings.right,
		legs="Ea Slops +1"
	})
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
		head="Ea Hat +1",body="Ea Houppelande +1",hands="Bunzi's Gloves"
	})
        
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=empty,body="Crepuscular Cloak"})

    sets.midcast['Dark Magic'] = {
        head="Atrophy Chapeau +3",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        body="Atrophy Tabard +3",hands="Lethargy Gantherots +3",ring1=gear.rings.left,ring2=gear.rings.right,
        back=gear.capes.magic,waist="Witful Belt",legs="Nyame Flanchard",feet="Lethargy Houseaux +3"}

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {waist="Null Belt"})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-Obi"})

    sets.midcast.Aspir = set_combine(sets.midcast.Drain, {})

	sets.Gain = {hands="Vitiation Gloves +3"}
	sets.BoostStat = {hands="Vitiation Gloves +3"}

    -- Sets for special buff conditions on spells.

	sets.midcast.EnhancingDuration = {ear2="Lethargy Earring +1",hands="Atrophy Gloves +3",waist="Embla Sash",back=gear.capes.magic,feet="Lethargy Houseaux +3"}

    sets.buff.ComposureOther = set_combine(sets.midcast['Enhancing Magic'], {head="Lethargy Chappel +2",
        body="Lethargy Sayon +3",legs="Lethargy Fuseau +3",feet="Lethargy Houseaux +3"})

    sets.buff.Saboteur = {hands="Lethargy Gantherots +3"}
	
	-- full duration because Stymie is essentially capped macc
	sets.buff.Stymie = {
		head="Lethargy Chappel +2",neck="Duelist's Torque +2",ear2="Snotra Earring",
		body="Lethargy Sayon +3",hands="Regal Cuffs",ring1="Kishar Ring",
		back="Aurist's Cape +1",waist="Obstinate Sash",legs="Lethargy Fuseau +3",feet="Lethargy Houseaux +3"
	}

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
        head="Vitiation Chapeau +4",neck="Bathy Choker +1",ear2="Infused Earring",
        body="Lethargy Sayon +3",ring1=gear.rings.left,ring2="Murky Ring",
        waist="Fucho-no-Obi"}
    
    -- Idle sets
    sets.idle = {ammo="Homiliary",
        head="Vitiation Chapeau +4",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
        body="Lethargy Sayon +3",hands="Nyame Gauntlets",ring1=gear.rings.left,ring2="Murky Ring",
        back=gear.capes.wsdmg,waist="Null Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
	sets.idle.Town = set_combine(sets.idle, {})
    
    -- Defense sets
    sets.defense.PDT = {
        head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {ring1="Defending Ring"})

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Sroda Tathlum",
        head="Bunzi's Hat",neck="Sibyl Scarf",ear1="Sherida Earring",ear2="Lethargy Earring +1",
        body="Malignance Tabard",hands="Ayanmo Manopolas +2",ring1="Chirich Ring +1",ring2="Lehko's Ring",
        back="Null Shawl",waist="Orpheus's Sash",legs="Malignance Tights",feet="Malignance Boots"}


	sets.engaged.DW = set_combine(sets.engaged, {
		ear2="Suppanomimi",legs="Carmine Cuisses +1"
	})
	
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",ring2="Murky Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	sets.engaged.StoreTP = set_combine(sets.engaged, {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu Torque",ear2="Suppanomimi",
		body="Malignance Tabard",hands="Malignance Gloves",
		waist="Gerdr Belt +1",legs="Malignance Tights",feet="Malignance Boots"})
end
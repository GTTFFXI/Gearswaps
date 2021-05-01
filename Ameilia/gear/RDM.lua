-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'DW', 'Hybrid')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant', 'Burst')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
	gear.capes = {}
	gear.capes.magic = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	gear.capes.melee = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.wsdmg = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.capes.magicws = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
	
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
	send_command('bind !` eh cycle')
    select_default_macro_book()
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
		head="Atrophy Chapeau +3",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Malignance Earring",
		body="Vitiation Tabard +3",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Amalric Nails +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})
		
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Vitiation Chapeau +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Vitiation Tabard +3",hands="Jhakri Cuffs +2",ring1="Shukuyu Ring",ring2="Ilabrat Ring",
        back=gear.capes.wsdmg,waist="Sailfi Belt +1",legs="Augury Cuisses +1",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Burning Blade'] = set_combine(sets.precast.WS, {ammo="Pemphredo Tathlum",
        head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Regal Earring",
        body="Amalric Doublet +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.capes.magicws,waist="Orpheus's Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"})
	sets.precast.WS['Red Lotus Blade'] = sets.precast.WS['Burning Blade']
	sets.precast.WS['Shining Blade'] = sets.precast.WS['Burning Blade']
	sets.precast.WS['Seraph Blade'] = sets.precast.WS['Burning Blade']
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Burning Blade'], {ear2="Malignance Earring"})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS['Burning Blade'], {head="Pixie Hairpin +1",ring1="Archon Ring"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ring2="Begrudging Ring",feet="Thereoid Greaves"})
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {neck="Caro Necklace",waist="Sailfi Belt +1"})
    -- Midcast Sets
    
    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
        body="Chironic Doublet",hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
        back=gear.capes.magic,waist="Embla Sash",legs="Volte Brais",feet="Vanya Clogs"}
	sets.midcast.Cursna = {neck="Debilis Medallion",body="Vitiation Tabard +3",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        head="Telchine Cap",neck="Duelist's Torque +2",ear1="Andoaa Earring",ear2="Mimir Earring",
        body="Vitiation Tabard +3",hands="Atrophy Gloves +3",ring1=gear.rings.left,ring2=gear.rings.right,
        back=gear.capes.magic,waist="Embla Sash",legs="Telchine Braconi",feet="Lethargy Houseaux +1"}

	sets.midcast.Enspell = set_combine(sets.midcast['Enhancing Magic'], {
		head="Carmine Mask +1",neck="Incanter's Torque",hands="Vitiation Gloves +1",waist="Olympus Sash",legs="Carmine Cuisses +1",back="Ghostfyre Cape"})
	
	sets.midcast.Temper = sets.midcast.Enspell
	sets.midcast['Temper II'] = sets.midcast.Temper
		
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",body="Atrophy Tabard +3",legs="Lethargy Fuseau +1"})

    sets.midcast.Stoneskin = {}
    
    sets.midcast['Enfeebling Magic'] = {ammo="Regal Gem",
        head="Vitiation Chapeau +3",neck="Duelist's Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
        body="Lethargy Sayon +1",hands="Kaykaus Cuffs +1",ring1="Kishar Ring",ring2=gear.rings.right,
        back=gear.capes.magic,waist="Eschan Stone",legs="Chironic Hose",feet="Vitiation Boots +3"}

	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
		body="Atrophy Tabard +3",ring1=gear.rings.left
	})
	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +3"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +3"})
    sets.midcast['Frazzle II'] = sets.midcast['Enfeebling Magic'].Resistant
	sets.midcast['Silence'] = sets.midcast['Enfeebling Magic'].Resistant
	
    sets.midcast['Elemental Magic'] = {ammo="Pemphredo Tathlum",
        head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.capes.magic,waist="Eschan Stone",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'],{
		neck="Duelist's Torque +2",
		hands="Atrophy Gloves +3",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Eschan Stone",legs="Ea Slops",feet="Nyame Sollerets"
	})
	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {head="Ea Hat +1",neck="Mizukage-no-Kubikazari",body="Ea Houppelande +1",ring1="Mujin Band"})
        
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].Resistant, {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {
        head="Atrophy Chapeau +3",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        body="Atrophy Tabard +3",hands="Leyline Gloves",ring1=gear.rings.left,ring2=gear.rings.right,
        back=gear.capes.magic,waist="Goading Belt",legs="Nyame Flanchard",feet="Amalric Nails +1"}

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {waist="Eschan Stone"})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain



    -- Sets for special buff conditions on spells.

	sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +3",waist="Embla Sash",back=gear.capes.magic,feet="Lethargy Houseaux +1"}

    sets.buff.ComposureOther = set_combine(sets.midcast['Enhancing Magic'], {head="Lethargy Chappel +1",
        body="Lethargy Sayon +1",legs="Lethargy Fuseau +1",feet="Lethargy Houseaux +1"})

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
        head="Vitiation Chapeau +3",neck="Bathy Choker +1",ear2="Infused Earring",
        body="Amalric Doublet +1",ring1=gear.rings.left,ring2="Defending Ring",
        waist="Fucho-no-Obi"}
    
    -- Idle sets
    sets.idle = {ammo="Homiliary",
        head="Vitiation Chapeau +3",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Amalric Doublet +1",hands="Malignance Gloves",ring1=gear.rings.left,ring2="Defending Ring",
        back="Moonlight Cape",waist="Fucho-no-Obi",legs="Carmine Cuisses +1",feet="Malignance Boots"}
	sets.idle.Town = set_combine(sets.idle, {})
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",
        back=gear.capes.melee,legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {ring1="Purity Ring"})

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Aurgelmir Orb",
        head="Blistering Sallet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Chirich Ring +1",ring2="Ilabrat Ring",
        back=gear.capes.melee,waist="Orpheus's Sash",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DW = set_combine(sets.engaged, {
		ear2="Suppanomimi",legs="Carmine Cuisses +1"
	})
	
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",ring2="Defending Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
end
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'DW')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant', 'Burst')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
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
    sets.precast.JA['Chainspell'] = {body="Vitiation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
	sets.precast.FC = {
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Vitiation Tabard",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Ayanmo Cosciales +2",feet="Amalric Nails +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})
		
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Jhakri Robe +2",hands="Atrophy Gloves +2",ring1="Shukuyu Ring",ring2="Ilabrat Ring",
        back="Letalis Mantle",waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Amalric Nails +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
        head="Ea Hat",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back="Toro Cape",legs="Jhakri Slops +2",feet="Amalric Nails +1"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ring2="Begrudging Ring",feet="Thereoid Greaves"})
    -- Midcast Sets
    
    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {
        head="Vanya Hood",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Chironic Doublet",hands="Revealer's Mitts",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="sucellos's Cape",waist="Witful Belt",legs="Lengo Pants",feet="Vanya Clogs"}
	sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        head="Carmine Mask +1",neck="Incanter's Torque",
        body="Vitiation Tabard",hands="Atrophy Gloves +2",ring1="Kishar Ring",ring2="Stikini Ring",
        back="sucellos's Cape",waist="Gishdubar Sash",legs="Carmine Cuisses +1",feet="Lethargy Houseaux +1"}

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",legs="Lethargy Fuseau +1"})

    sets.midcast.Stoneskin = {}
    
    sets.midcast['Enfeebling Magic'] = {ammo="Regal Gem",
        head="Vitiation Chapeau +1",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Dignitary's Earring",
        body="Lethargy Sayon +1",hands="Leyline Gloves",ring1="Sangoma Ring",ring2="Stikini Ring",
        back="sucellos's Cape",waist="Eschan Stone",legs="Chironic Hose",feet="Medium's Sabots"}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +1"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +1"})
    
    sets.midcast['Elemental Magic'] = {
        head="Ea Hat",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Ea Houppelande",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back="Toro Cape",waist="Eschan Stone",legs="Ea Slops",feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {neck="Mizukage-no-Kubikazari",ring2="Mujin Band"})
        
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {
        head="Ea Hat",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Dignitary's Earring",
        body="Ea Houppelande",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Sangoma Ring",
        back="sucellos's Cape",waist="Dynamic Belt +1",legs="Ayanmo Cosciales +2",feet="Amalric Nails +1"}

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {waist="Eschan Stone"})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

	sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +2",back="sucellos's Cape",feet="Lethargy Houseaux +1"}

    sets.buff.ComposureOther = set_combine(sets.midcast['Enhancing Magic'], {head="Lethargy Chappel +1",
        body="Lethargy Sayon +1",legs="Lethargy Fuseau +1",feet="Lethargy Houseaux +1"})

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
        head="Vitiation Chapeau +1",neck="Bathy Choker +1",ear2="Infused Earring",
        body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
        waist="Fucho-no-Obi",legs="Lengo Pants",feet="Serpentes Sabots"}
    

    -- Idle sets
    sets.idle = {ammo="Homiliary",
        head="Vitiation Chapeau +1",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Carmine Cuisses +1",feet="Serpentes Sabots"}
	sets.idle.Town = set_combine(sets.idle, {})
    
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum",
        neck="Loricate Torque +1",
        body="Ayanmo Corazza +2",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Ayanmo Cosciales +2",feet="Ayanmo Gambieras +2"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {ring1="Fortified Ring"})

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Ginsen",
        head="Chironic Hat",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
        body="Ayanmo Corazza +2",hands="Atrophy Gloves +2",ring1="Chirich Ring",ring2="Ilabrat Ring",
        back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Ayanmo Cosciales +2",feet="Ayanmo Gambieras +2"}

	sets.engaged.DW = set_combine(sets.engaged, {
		ear2="Suppanomimi"
	})
end
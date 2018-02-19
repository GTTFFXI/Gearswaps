-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'DW')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard +1",hands="Leyline Gloves",
        back="Kumbira Cape",legs="Hagondes Pants +1",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
	sets.precast.FC = {
		head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquac. Earring",hands="Gendewitha Gages",
		body="Anhur Robe",back="Perimede Cape",waist="Witful Belt",ring1="Prolix Ring",legs="Lengo Pants",feet="Merlinic Crackows"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {back="Pahtli Cape",feet="Vanya Clogs"})
		
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Lithelimb Cap",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Ischemia Chasuble",hands="Leyline Gloves",ring1="Rufescent Ring",ring2="Petrov Ring",
        back="Letalis Mantle",waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Taeon Boots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
        head="Merlinic Hood",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Witching Robe",hands="Hagondes Gloves",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back="Toro Cape",legs="Hagondes Pants +1",feet="Helios Boots"})

    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Vitivation Tabard",hands="Gendewitha Gages",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Gendewitha Caubeen",neck="Incanter's Torque",ear1="Roundel Earring",ear2="Loquacious Earring",
        hands="Revealer's Mitts",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Swith Cape",waist="Witful Belt",legs="Carmine Cuisses +1",feet="Vanya Clogs"}
	sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Atrophy Chapeau +1",neck="Incanter's Torque",
        body="Vitivation Tabard",hands="Atrophy Gloves +1",ring1="Prolix Ring",
        back="Estoqueur's Cape",waist="Olympus Sash",legs="Atrophy Tights",feet="Estoqueur's Houseaux +2"}

    sets.midcast.Refresh = {legs="Estoqueur's Fuseau +2"}

    sets.midcast.Stoneskin = {waist="Siegel Sash"}
    
    sets.midcast['Enfeebling Magic'] = {main="Lehbrailg +2",sub="Niobid Strap",ammo="Kalboron Stone",
        head="Atrophy Chapeau +1",neck="Incanter's Torque",ear1="Gwati Earring",ear2="Dignitary's Earring",
        body="Atrophy Tabard +1",hands="Leyline Gloves",ring1="Etana Ring",ring2="Sangoma Ring",
        back="Kumbira Cape",waist="Demonry Sash",legs="Merlinic Shalwar",feet="Bokwus Boots"}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    
    sets.midcast['Elemental Magic'] = {
        head="Merlinic Hood",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Amalric Doublet",hands="Hagondes Gloves",ring1="Shiva Ring +1",ring2="Acumen Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Merlinic Shalwar",feet="Helios Boots"}
        
	sets.WeatherObi = {waist="Hachirin-no-Obi"}
	
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Niobid Strap",ammo="Kalboron Stone",
        head="Merlinic Hood",neck="Incanter's Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Amalric Doublet",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Kumbira Cape",waist="Goading Belt",legs="Merlinic Shalwar",feet="Bokwus Boots"}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

	sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +2",back="Estoqueur's Cape",feet="Lethargy Houseaux +1"}
	sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {body="Jhakri Robe +2", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2",})

    sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
        head="Vitivation Chapeau",neck="Bathy Choker +1",
        body="Atrophy Tabard +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    

    -- Idle sets
    sets.idle = {
        head="Vitivation Chapeau",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Witching Robe",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Carmine Cuisses +1",feet="Serpentes Sabots"}
	sets.idle.Town = set_combine(sets.idle, {})
    
    
    -- Defense sets
    sets.defense.PDT = {
        head="Atrophy Chapeau +1",neck="Loricate Torque +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Amalric Doublet",hands="Gendewitha Gages",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Loricate Torque +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Blood Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Lithelimb Cap",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
        body="Ischemia Chasuble",hands="Leyline Gloves",ring1="Rajas Ring",ring2="Petrov Ring",
        back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Taeon Boots"}

	sets.engaged.DW = set_combine(sets.engaged, {
		ear1="Brutal Earring",ear2="Suppanomimi"
	})

    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Combatant's Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="Petrov Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Taeon Tights",feet="Taeon Boots"}

end
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
    pick_tp_weapon()
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Terpander'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
    send_command('bind !` input /ma "Chocobo Mazurka" <me>')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquac. Earring",hands="Gendewitha Gages",
		body="Inyanga Jubbah +2",back="Perimede Cape",waist="Witful Belt",ring1="Prolix Ring",ring2="Veneficium Ring",legs="Lengo Pants"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Chironic Hose",feet="Vanya Clogs"})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC)

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.BardSong = {main="Grioavolr",sub="Niobid Strap",range="Gjallarhorn",
		head="Fili Calot +1",neck="Moonbow Whistle",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Bihu Slippers"}
		
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
			
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps +1"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {range="Gjallarhorn",
		head="Nahtirah Hat",
		body="Ischemia Chasuble",hands="Leyline Gloves",
		back="Kumbira Cape",legs="Gendewitha Spats"}
	
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
	    range="Linos",head="Chironic Hat",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Ayanmo Corazza +2",hands="Leyline Gloves",ring1="Ilabrat Ring",ring2="Begrudging Ring",
		back="Intarabus's Cape",waist="Fotia Belt",legs="Lustratio Subligar",feet="Aya. Gambieras +1"}

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Grioavolr",sub="Niobid Strap",
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Chironic Slippers"}
		
	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {}
	sets.midcast.Madrigal = {head="Fili Calot +1",back="Intarabus's Cape"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Prelude = {back="Intarabus's Cape"}
	sets.midcast.Minne = {}
	sets.midcast.Paeon = {}
	sets.midcast.Carol = {head="Fili Calot +1",
		body="Fili Hongreline +1",hands="Fili Manchettes +1",
		legs="Fili Rhingrave +1",feet="Fili Cothurnes +1"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {legs="Fili Rhingrave +1",feet="Chironic Slippers"}

	sets.midcast.Mazurka = {range=info.DaurdablaInstrument}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {range="Gjallarhorn",
		head="Fili Calot +1",neck="Moonbow Whistle",ear2="Loquacious Earring",
		body="Fili Hongreline +1",hands="Fili Manchettes +1",ring1="Prolix Ring",
		back="Kumbira Cape",waist="Kobo Obi",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}

	sets.midcast['Honor March'] = set_combine(sets.midcast.SongEffect, {range="Marsyas"})
		
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Grioavolr",sub="Niobid Strap",range="Gjallarhorn",
		head="Chironic Hat",neck="Moonbow Whistle",ear1="Gwati Earring",ear2="Dignitary's Earring",
		body="Chironic Doublet",hands="Inyanga Dastanas +2",ring1="Stikini Ring",ring2="Sangoma Ring",
		back="Kumbira Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Chironic Slippers"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = sets.midcast.SongDebuff
	
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {ear2="Loquacious Earring",
		ring1="Prolix Ring",
		back="Kumbira Cape",legs="Fili Rhingrave +1",feet="Chironic Slippers"}

	--sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.DaurdablaInstrument})

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = {range=info.ExtraSongInstrument,
		head="Nahtirah Hat",neck="Orunmila's Torque",hands="Fili Manchettes +1",ring1="Prolix Ring",
		back="Perimede Cape",legs="Fili Rhingrave +1",feet="Chironic Slippers"}

	-- Other general spells and classes.
	sets.midcast.Cure = {
		head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",
		body="Chironic Doublet",hands="Revealer's Mitts",ring2="Sirona's Ring",
		back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}
		
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Stoneskin = {
		head="Nahtirah Hat",neck="Incanter's Torque",
		body="Ischemia Chasuble",hands="Gendewitha Gages"}
		
	sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
	
	-- Sets to return to when not performing an action.
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		head="Wivre Hairpin",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
		body="Ischemia Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Fili Cothurnes +1"}

	sets.idle.PDT = set_combine(sets.idle, {
		body="Ischemia Chasuble",hands="Gendewitha Gages",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Gendewitha Spats",feet="Fili Cothurnes +1"})

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle
	
	-- Resting sets	
	sets.resting = set_combine(sets.idle, {feet="Serpentes Sabots"})
	
	-- Defense sets

	sets.defense.PDT = {
		neck="Loricate Torque +1",
		body="Ischemia Chasuble",hands="Gendewitha Gages",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Gendewitha Spats"}

	sets.defense.MDT = {
		head="Nahtirah Hat",neck="Loricate Torque +1",
		body="Ischemia Chasuble",hands="Gendewitha Gages",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Bihu Cannions +1"}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
    sets.engaged = {
	    range="Linos",head="Chironic Hat",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Leyline Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring",
		back="Intarabus's Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	-- Sets with weapons defined.
	sets.engaged.Dagger = sets.engaged
	
	-- Set if dual-wielding
	sets.engaged.DualWield = sets.engaged
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
    pick_tp_weapon()
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
    send_command('bind !` eh cycle')
	send_command('bind !- input /ma "Goddess\'s Hymnus" Kyoko')
	gear.capes = {}
	gear.capes.fc = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	gear.capes.ws = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {head="Nahtirah Hat",neck="Voltsurge Torque",ear2="Loquac. Earring",hands="Gendewitha Gages +1",
		body="Inyanga Jubbah +2",back="Swith Cape",waist="Witful Belt",ring1="Weatherspoon Ring +1",ring2="Veneficium Ring",legs="Gyve Trousers"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Gyve Trousers",feet="Vanya Clogs"})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC)

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.BardSong = {main="Oranyan",sub="Niobid Strap",range="Gjallarhorn",
		head="Fili Calot +3",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Veneficium Ring",
		back="Swith Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Fili Cothurnes +2"}
		
	sets.precast.FC['Paeon'] = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
			
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {range="Gjallarhorn",
		head="Nahtirah Hat",
		body="Ischemia Chasuble",hands="Leyline Gloves",
		back="Kumbira Cape",legs="Gyve Trousers"}
	
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
	    range="Linos",head="Nyame Helm",neck="Platinum Republican Medal",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Bihu Justaucorps +3",hands="Nyame Gauntlets",ring1="Karieyh Ring",ring2="Cornelia's Ring",
		back=gear.capes.ws,waist="Cornelia's Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Midcast Sets

		-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = {range=info.ExtraSongInstrument,
		head="Nahtirah Hat",neck="Voltsurge Torque",hands="Fili Manchettes +2",ring1="Kishar Ring",
		back="Swith Cape",legs="Fili Rhingrave +2",feet="Chironic Slippers"}

	
	-- General set for recast times.
	sets.midcast.FastRecast = {main="Oranyan",sub="Niobid Strap",
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Gendewitha Gages",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Chironic Slippers"}
		
	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +2"}
	sets.midcast.Lullaby = {}
	sets.midcast.Madrigal = {head="Fili Calot +3",back=gear.capes.fc}
	sets.midcast.March = {hands="Fili Manchettes +2"}
	sets.midcast.Minuet = {body="Fili Hongreline +3"}
	sets.midcast.Prelude = {back=gear.capes.fc}
	--sets.midcast.Minne = sets.midcast.DaurdablaDummy
	sets.midcast.Paeon = sets.midcast.DaurdablaDummy
	sets.midcast.Carol = {head="Fili Calot +3",
		body="Fili Hongreline +3",hands="Fili Manchettes +2",
		legs="Fili Rhingrave +2",feet="Fili Cothurnes +2"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +2"}
	sets.midcast['Magic Finale'] = {legs="Fili Rhingrave +2",feet="Chironic Slippers"}

	sets.midcast.Mazurka = {range=info.DaurdablaInstrument}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {range="Gjallarhorn",
		head="Fili Calot +3",neck="Moonbow Whistle +1",ear2="Loquacious Earring",
		body="Fili Hongreline +3",hands="Fili Manchettes +2",ring1="Kishar Ring",
		back="Kumbira Cape",waist="Kobo Obi",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}

	sets.midcast['Honor March'] = set_combine(sets.midcast.SongEffect, {range="Marsyas"})
		
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Oranyan",sub="Niobid Strap",range="Gjallarhorn",
		head="Chironic Hat",neck="Moonbow Whistle +1",ear1="Gwati Earring",ear2="Dignitary's Earring",
		body="Fili Hongreline +3",hands="Inyanga Dastanas +2",ring1="Stikini Ring",ring2="Sangoma Ring",
		back="Kumbira Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Brioso Slippers +2"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = sets.midcast.SongDebuff
	
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {ear2="Loquacious Earring",
		ring1="Kishar Ring",
		back="Kumbira Cape",legs="Fili Rhingrave +2",feet="Chironic Slippers"}

	--sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.DaurdablaInstrument})

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = {range=info.ExtraSongInstrument,
		head="Nahtirah Hat",neck="Voltsurge Torque",hands="Fili Manchettes +2",ring1="Kishar Ring",
		back="Swith Cape",legs="Fili Rhingrave +2",feet="Chironic Slippers"}

	-- Other general spells and classes.
	sets.midcast.Cure = {
		head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",
		body="Chironic Doublet",hands="Telchine Gloves",ring2="Sirona's Ring",
		back="Oretania's Cape +1",legs="Gyve Trousers",feet="Vanya Clogs"}
		
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Stoneskin = {
		head="Nahtirah Hat",neck="Incanter's Torque",
		body="Ischemia Chasuble",hands="Gendewitha Gages +1"}
		
	sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
	
	-- Sets to return to when not performing an action.
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		head="Volte Beret",neck="Bathy Choker +1",ear1="Etiolation Earring",ear2="Infused Earring",
		body="Artsieq Jubbah",hands="Inyanga Dastanas +2",ring1="Sheltered Ring",ring2="Inyanga Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Fili Cothurnes +2"}

	sets.idle.PDT = set_combine(sets.idle, {
		body="Ischemia Chasuble",hands="Gendewitha Gages",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Gendewitha Spats",feet="Fili Cothurnes +2"})

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle
	
	-- Resting sets	
	sets.resting = set_combine(sets.idle, {feet="Serpentes Sabots"})
	
	-- Defense sets

    sets.defense.PDT = {
        head="Nyame Helm",neck="Loricate Torque +1",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Nyame Flanchard",feet="Nyame Sollerets"
	}

    sets.defense.MDT = {
        head="Nyame Helm",neck="Loricate Torque +1",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Nyame Flanchard",feet="Nyame Sollerets"
	}

	sets.Kiting = {feet="Fili Cothurnes +2"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
    sets.engaged = {
	    head="Fili Calot +3",neck="Null Loop",left_ear="Telos Earring",right_ear="Crepuscular Earring",
		body="Bihu Justaucorps +3",hands="Bunzi's Gloves",left_ring="Ilabrat Ring",right_ring="Chirich Ring",
		back="Null Shawl",waist="Null Belt",legs="Fili Rhingrave +2",feet="Fili Cothurnes +2"
	}

	-- Sets with weapons defined.
	sets.engaged.Dagger = sets.engaged
	
	-- Set if dual-wielding
	sets.engaged.DualWield = sets.engaged
end

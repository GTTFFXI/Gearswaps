-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
    pick_tp_weapon()
    
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
    send_command('bind !` eh cycle')
	send_command('bind != input /ma "Chocobo Mazurka" <me>')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = {range=info.ExtraSongInstrument,
		head="Cath Palug Crown",neck="Baetyl Pendant",hands="Fili Manchettes +1",ring1="Kishar Ring",
		back="Perimede Cape",legs="Fili Rhingrave +1",feet="Chironic Slippers"}

	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {head="Cath Palug Crown",neck="Baetyl Pendant",hands="Gendewitha Gages",
		body="Zendik Robe",back="Perimede Cape",waist="Embla Sash",ring1="Kishar Ring",ring2="Veneficium Ring",legs="Gyve Trousers"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Chironic Hose",feet="Vanya Clogs"})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC)

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.BardSong = {
		head="Fili Calot +1",neck="Moonbow Whistle +1",ear1="Etiolation Earring",
		body="Zendik Robe",hands="Gendewitha Gages",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Gendewitha Spats",feet="Bihu Slippers +1"}
		
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
			
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {range="Gjallarhorn",
		head="Cath Palug Crown",
		body="Ischemia Chasuble",hands="Leyline Gloves",
		legs="Gendewitha Spats"}
	
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
	    range="Linos",head="Blistering Sallet +1",neck="Bard's Charm +1",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Bihu Justaucorps +3",hands="Bunzi's Gloves",ring1="Ilabrat Ring",ring2="Begrudging Ring",
		back="Intarabus's Cape",waist="Fotia Belt",legs="Lustratio Subligar +1",feet="Lustratio Leggings +1"}

	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
		head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Friomisi",ear2="Regal Earring",
		body="Chironic Doublet",hands="Bunzi's Gloves",ring1="Acumen Ring",ring2="Shiva's Ring +1",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {
		head="Cath Palug Crown",
		body="Zendik Robe",hands="Gendewitha Gages",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Gendewitha Spats",feet="Chironic Slippers"}
		
	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {}
	sets.midcast.Madrigal = {head="Fili Calot +1",back="Intarabus's Cape"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Prelude = {back="Intarabus's Cape"}
	sets.midcast.Minne = {}
	sets.midcast.Paeon = sets.midcast.DaurdablaDummy
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast.Carol = {head="Fili Calot +1",
		body="Fili Hongreline +1",hands="Mousai Gages +1",
		legs="Fili Rhingrave +1",feet="Fili Cothurnes +1"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {ring1=gear.rings.left,ring2=gear.rings.right,legs="Fili Rhingrave +1",feet="Chironic Slippers"}

	sets.midcast.Mazurka = {range=info.DaurdablaInstrument}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {range="Gjallarhorn",
		head="Fili Calot +1",neck="Moonbow Whistle +1",
		body="Fili Hongreline +1",hands="Fili Manchettes +1",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Kobo Obi",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}

	sets.midcast['Honor March'] = set_combine(sets.midcast.SongEffect, {range="Marsyas"})
		
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {range="Gjallarhorn",
		head="Brioso Roundlet +2",neck="Moonbow Whistle +1",ear1="Regal Earring",ear2="Dignitary's Earring",
		body="Chironic Doublet",hands="Inyanga Dastanas +2",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Perimede Cape",waist="Hachirin-no-Obi",legs="Chironic Hose",feet="Brioso Slippers +2"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = sets.midcast.SongDebuff
	
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {ring1="Kishar Ring",legs="Fili Rhingrave +1",feet="Chironic Slippers"}

	--sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.DaurdablaInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",
		body="Chironic Doublet",hands="Revealer's Mitts",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}
		
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.precast.FC, {
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Telchine Chasuble",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Embla Sash",legs="Telchine Braconi"
	})
	
	sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
	
	-- Sets to return to when not performing an action.
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		head="Volte Beret",neck="Bard's Charm +1",ear1="Etiolation Earring",ear2="Infused Earring",
		body="Ischemia Chasuble",hands="Inyanga Dastanas +2",ring1=gear.rings.left,ring2="Defending Ring",
		back="Moonlight Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Fili Cothurnes +1"}

	sets.idle.PDT = set_combine(sets.idle, {
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Nyame Mail",hands="Bunzi's Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Fili Cothurnes +1"})

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle
	
	-- Resting sets	
	sets.resting = set_combine(sets.idle, {})
	
	-- Defense sets

	sets.defense.PDT = {
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Nyame Mail",hands="Bunzi's Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = set_combine(sets.defense.PDT,{ring1="Moonlight Ring"})

	sets.Kiting = {feet="Fili Cothurnes +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
    sets.engaged = {
	    range="Linos",head="Blistering Sallet +1",neck="Bard's Charm +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back="Intarabus's Cape",waist="Windbuffet Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Sets with weapons defined.
	sets.engaged.Dagger = sets.engaged
	
	-- Set if dual-wielding
	sets.engaged.DualWield = sets.engaged
end

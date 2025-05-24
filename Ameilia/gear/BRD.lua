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

	gear.back={}
	gear.back.melee={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.back.ws={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(true, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind ^- input /nin "Monomi: Ichi" <me>')
	send_command('bind ^= input /nin "Tonko: Ni" <me>')
    send_command('bind !` eh cycle')
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
		head="Cath Palug Crown",neck="Baetyl Pendant",hands="Fili Manchettes +2",ring1="Kishar Ring",
		back="Perimede Cape",legs="Fili Rhingrave +2",feet="Nyame Sollerets"}

	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {head="Bunzi's Hat",neck="Baetyl Pendant",
		body="Zendik Robe",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Gyve Trousers",feet="Fili Cothurnes +2"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",legs="Chironic Hose",feet="Vanya Clogs"})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC)

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.BardSong = {
		head="Fili Calot +2",neck="Moonbow Whistle +1",ear1="Etiolation Earring",
		body="Zendik Robe",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Gendewitha Spats",feet="Bihu Slippers +3"}
		
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})
	sets.precast.FC['Aria of Passion'] = set_combine(sets.precast.FC.BardSong, {range="Loughnashade"})

    sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
			
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {range="Gjallarhorn",
		head="Cath Palug Crown",
		hands="Leyline Gloves",
		legs="Gendewitha Spats"}
	
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {range="Linos",
		head="Nyame Helm",neck="Bard's Charm +2",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Bihu Justaucorps +3",hands="Nyame Gauntlets",ring1="Lehko's Ring",ring2="Epaminondas's Ring",
		back=gear.back.ws,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ring1="Sroda Ring",waist="Sailfi Belt +1"
	})
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Fast Blade II'] = set_combine(sets.precast.WS['Savage Blade'], {
		head="Bunzi's Hat",
		body="Nyame Mail",hands="Bunzi's Gloves",ring1="Hetairoi Ring",
		back="Null Shawl"})

	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
		head="Nyame Helm",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Acumen Ring",ring2="Epaminondas's Ring",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {
		head="Cath Palug Crown",
		body="Zendik Robe",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Gendewitha Spats",feet="Nyame Sollerets"}
		
	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +2"}
	sets.midcast.Lullaby = {range="Daurdabla"} 
	sets.midcast.Madrigal = {head="Fili Calot +2",back=gear.back.ws}
	sets.midcast.March = {hands="Fili Manchettes +2"}
	sets.midcast.Minuet = {body="Fili Hongreline +3"}
	sets.midcast.Prelude = {back=gear.back.ws}
	sets.midcast.Minne = {}
	sets.midcast.Paeon = set_combine(sets.midcast.DaurdablaDummy, {})
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast.Carol = {head="Fili Calot +2",
		body="Fili Hongreline +3",hands="Mousai Gages +1",
		legs="Fili Rhingrave +2",feet="Fili Cothurnes +2"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +2"}
	sets.midcast['Magic Finale'] = {ring1=gear.rings.left,ring2=gear.rings.right,legs="Fili Rhingrave +2",feet="Nyame Sollerets"}

	sets.midcast.Mazurka = {range=info.DaurdablaInstrument}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Carnwenhan",range="Gjallarhorn",
		head="Fili Calot +2",neck="Moonbow Whistle +1",
		body="Fili Hongreline +3",hands="Fili Manchettes +2",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Kobo Obi",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}

	sets.midcast['Honor March'] = set_combine(sets.midcast.SongEffect, {range="Marsyas"})
	sets.midcast['Aria of Passion'] = set_combine(sets.midcast.SongEffect, {range="Loughnashade"})
		
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {range="Gjallarhorn",
		head="Brioso Roundlet +3",neck="Moonbow Whistle +1",ear1="Regal Earring",ear2="Fili Earring +1",
		body="Fili Hongreline +3",hands="Inyanga Dastanas +2",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",waist="Acuity Belt +1",legs="Fili Rhingrave +2",feet="Brioso Slippers +3"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = set_combine(sets.midcast.SongDebuff, {})
	
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {ring1="Kishar Ring",legs="Fili Rhingrave +2",feet="Nyame Sollerets"}

	--sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.DaurdablaInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",
		body="Zendik Robe",hands="Kaykaus Cuffs +1",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}
		
	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.precast.FC, {
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Telchine Chasuble",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Embla Sash",legs="Telchine Braconi"
	})
	
	sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
	
	-- Sets to return to when not performing an action.
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		head="Null Masque",neck="Bard's Charm +2",ear1="Etiolation Earring",ear2="Infused Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1=gear.rings.left,ring2="Defending Ring",
		back="Moonlight Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Fili Cothurnes +2"}

	sets.idle.PDT = set_combine(sets.idle, {
		head="Null Masque",neck="Loricate Torque +1",
		body="Nyame Mail",hands="Bunzi's Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		waist="Null Belt",legs="Nyame Flanchard",feet="Fili Cothurnes +2"})

	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = set_combine(sets.idle, {})
	
	-- Resting sets	
	sets.resting = set_combine(sets.idle, {})
	
	-- Defense sets

	sets.defense.PDT = {
		head="Null Masque",neck="Loricate Torque +1",
		body="Nyame Mail",hands="Bunzi's Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = set_combine(sets.defense.PDT,{ring1="Moonlight Ring"})

	sets.Kiting = {feet="Fili Cothurnes +2"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
    sets.engaged = {range="Linos",
		head="Bunzi's Hat",neck="Bard's Charm +2",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ashera Harness",hands="Bunzi's Gloves",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Gerdr Belt +1",legs="Volte Tights",feet="Nyame Sollerets"}

	-- Sets with weapons defined.
	sets.engaged.Dagger = set_combine(sets.engaged, {})
	
	-- Set if dual-wielding
	sets.engaged.DualWield = set_combine(sets.engaged, {})
end

function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'RetaliationTank', 'Subtle', 'StoreTP')
    state.WeaponskillMode:options('Normal', 'Acc', 'WSD', 'AccWSD', 'Proc', 'Subtle')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')

	gear.melee = {}
	gear.melee.feet = { name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}}
	gear.melee.back = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}
	gear.wsdmg.feet = { name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}}
    gear.wsdmg.daback = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.wsdmg.wsdback = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.wsdmg.vitback = { name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','"Regen"+5',}}
	gear.wsdmg.critback = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}

	gear.rings = {}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	
	update_combat_form()
end


function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.enmity = {ammo="Perfect Lucky Egg",neck="Moonlight Necklace",ear1="Cryptic Earring",ear2="Trux Earring",
		body="Volte Jupon",hands="Yorium Gauntlets",ring1="Apeile Ring",ring2="Apeile Ring +1",
		waist="Chaac Belt",back="Reiki Cloak",feet="Eschite Greaves"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA.Berserk = {body="Pummeler's Lorica +3",feet="Agoge Calligae +3",back=gear.melee.back}
	sets.precast.JA['Aggressor'] = {body="Agoge Lorica +3"}
	sets.precast.JA['Provoke'] = set_combine(sets.enmity, {})
	sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers +3"}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +3"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +4"}
	sets.precast.JA['Tomahawk'] = {ammo="Throwing Tomahawk",feet="Agoge Calligae +3"}
	
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
			
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Sakpata's Helm",body="Sacro Breastplate",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
   
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
   	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.Lugra = {ear1="Thrud Earring"}
	
	sets.WSD = {ammo="Knobkierrie",
		head="Agoge Mask +4",neck="Warrior's Bead Necklace +2",ear1="Thrud Earring",
		body="Nyame Mail",hands="Boii Mufflers +3",ring1="Epaminondas's Ring",ring2="Sroda Ring",
		back=gear.wsdmg.wsdback,legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.WSCrit = {ammo="Yetshila +1",
		head="Agoge Mask +4",ear2="Boii Earring +2",
		body="Hjarrandi Breastplate",ring1="Lehko's Ring",ring2="Niqmaddu Ring",
		back=gear.wsdmg.critback,waist="Sailfi Belt +1",feet="Boii Calligae +3"
	}
	sets.WSMAcc = {
		head="Sakpata's Helm",neck="Null Loop",ear1="Crepuscular Earring",ear2="Boii Earring +2",
		body="Crepuscular Mail",hands="Sakpata's Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",waist="Null Belt",legs="Boii Cuisses +3",feet="Boii Calligae +3"
	}
	sets.WSMAB = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Acumen Ring",
		back=gear.wsdmg.wsdback,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"
	}

	sets.WSProc = set_combine(sets.WSMAcc, {
		head="Volte Cap",ear2="Dignitary's Earring",
		hands="Pummeler's Mufflers +3",
		back="Solemnity Cape",legs="Volte Tights",feet="Flamma Gambieras +2"
	})


	sets.precast.WS = {ammo="Coiste Bodhar",
		head="Agoge Mask +4",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.wsdmg.daback,waist="Fotia Belt",legs="Boii Cuisses +3",feet="Sakpata's Leggings"}

	sets.precast.WS.WSD = set_combine(sets.precast.WS, sets.WSD)

	sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, sets.WSD)
	sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS['Scourge'], {})
	
	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS.WSD, {
		ring1="Niqmaddu Ring",ring2="Regal Ring",back=gear.wsdmg.vitback,waist="Sailfi Belt +1",legs="Boii Cuisses +3"})

	sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS.WSD, sets.WSCrit, {ear1="Schere Earring",body="Sakpata's Breastplate",legs="Boii Cuisses +3"})
	sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS.WSD, {ring1="Niqmaddu Ring",ring2="Regal Ring",legs="Boii Cuisses +3"})
	sets.precast.WS["King's Justice"].Proc = set_combine(sets.WSProc, {})
	sets.precast.WS["Metatron Torment"] = set_combine(sets.precast.WS.WSD, {})

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		neck="Warrior's Bead Necklace +2",ear1="Crepuscular Earring",ear2="Boii Earring +2",
		body="Pummeler's Lorica +3",ring1="Lehko's Ring",ring2="Regal Ring",
		legs="Sakpata's Cuisses"})
	sets.precast.WS.AccWSD = set_combine(sets.precast.WS.Acc, sets.WSD)
	
	sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, sets.WSCrit)
	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS.WSD,{waist="Sailfi Belt +1"})
	sets.precast.WS['Judgment'] = set_combine(sets.precast.WS.WSD,{waist="Sailfi Belt +1"})
	sets.precast.WS['True Strike'] = set_combine(sets.precast.WS, sets.WSCrit)
	sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Seraph Strike'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Seraph Strike'].Proc = set_combine(sets.WSProc, {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS.WSD,{waist="Sailfi Belt +1"})
	sets.precast.WS['Savage Blade'].Subtle = set_combine(sets.precast.WS['Savage Blade'],{body="Founder's Breastplate"})
	sets.precast.WS['Circle Blade'] = set_combine(sets.precast.WS.WSD, {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Seraph Blade'].Proc = set_combine(sets.WSProc, {})
	sets.precast.WS['Red Lotus Blade'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Red Lotus Blade'].Proc = set_combine(sets.WSProc, {})
	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, sets.WSCrit)
	
	sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Upheaval'].WSD = set_combine(sets.precast.WS['Upheaval'], {})
	sets.precast.WS['Upheaval'].AccWSD = set_combine(sets.precast.WS['Upheaval'].Acc, sets.WSD)
	sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Scourge'].WSD = set_combine(sets.precast.WS['Scourge'], sets.WSD)
	sets.precast.WS['Scourge'].AccWSD = set_combine(sets.precast.WS['Scourge'].Acc, sets.WSD)
	sets.precast.WS['Fell Cleave'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Fell Cleave'].WSD = set_combine(sets.precast.WS['Fell Cleave'], sets.WSD)
	sets.precast.WS['Fell Cleave'].AccWSD = set_combine(sets.precast.WS['Fell Cleave'].Acc, sets.WSD)

	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Decimation'] = set_combine(sets.precast.WS, sets.WSD, {ear1="Schere Earring"})
	sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, sets.WSCrit)
	
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, sets.WSCrit)
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS.WSD, sets.WSCrit)
	
	sets.precast.WS['Vorpal Scythe'] = set_combine(sets.precast.WS, sets.WSCrit)
	sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, sets.WSD)
	sets.precast.WS['Entropy'] = set_combine(sets.precast.WS)
	
	sets.precast.WS['Backhand Blow'] = set_combine(sets.precast.WS, sets.WSCrit)
	sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS)
	sets.precast.WS['One Inch Punch'] = set_combine(sets.precast.WS, sets.WSD)
	sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS)
	
	sets.precast.WS['Full Swing'] = set_combine(sets.precast.WS, sets.WSD)
	sets.precast.WS['Retribution'] = set_combine(sets.precast.WS, sets.WSD)
	sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS)
	sets.precast.WS['Rock Crusher'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Earth Crusher'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Starburst'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Sunburst'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, sets.WSD, sets.WSMAB)
	
	--breaks, magic acc
	sets.precast.WS['Armor Break'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Full Break'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Shield Break'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Weapon Break'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Nightmare Scythe'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Shell Crusher'] = set_combine(sets.precast.WS, sets.WSMAcc)
		
	--stuns, magic acc
	sets.precast.WS['Brainshaker'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Smash Axe'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Flat Blade'] = set_combine(sets.precast.WS, sets.WSMAcc)
	sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, sets.WSMAcc)

	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Sakpata's Helm",
		body="Sacro Breastplate",ring1="Kishar Ring",
		feet="Nyame Sollerets"}
			
	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu = set_combine(sets.midcast.FastRecast, {})

	-- any ninjutsu cast on enemies
	sets.midcast.Ninjutsu = {}

	--sets.midcast.Ninjutsu.Resistant = {}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Coiste Bodhar",
		head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		body="Sacro Breastplate",hands="Sakpata's Gauntlets",ring1="Sheltered Ring",ring2="Murky Ring",
		back=gear.wsdmg.vitback,waist="Null Belt",legs="Sakpata's Cuisses",feet="Hermes' Sandals +1"}

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Twilight = set_combine(sets.idle.Town, sets.Twilight)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Twilight)
	
	-- Defense sets

	sets.defense.PDT = {
		head="Sakpata's Helm",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring2="Murky Ring",
		legs="Sakpata's Cuisses",feet="Sakpata's Leggings" }
	sets.defense.Twilight = set_combine(sets.defense.PDT, sets.Twilight)
	sets.defense.MDT = set_combine(sets.defense.PDT, {})
	
	sets.Kiting = {feet="Hermes' Sandals +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.hybrid = {legs="Sakpata's Cuisses"}

	sets.DW = {ear1="Suppanomimi",hands="Emicho Gauntlets +1"}
	-- Normal melee group
	
	sets.engaged = {ammo="Coiste Bodhar",
	    head="Sakpata's Helm",neck="Warrior's Bead Necklace +2",ear1="Schere Earring",ear2="Boii Earring +2",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back=gear.wsdmg.daback,waist="Ioskeha Belt +1",legs="Agoge Cuisses +4",feet="Boii Calligae +3"}
		
	sets.engaged.StoreTP = {ammo="Coiste Bodhar",
		head="Hjarrandi Helm",neck="Warrior's Bead Necklace +2",ear1="Schere Earring",ear2="Dedition Earring",
		body="Boii Lorica +3",hands="Sakpata's Gauntlets",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back=gear.melee.back,waist="Gerdr Belt +1",legs="Tatenashi Haidate +1",feet="Tatenashi Sune-Ate +1"
	}
	
	sets.engaged.Chango = set_combine(sets.engaged, {})
	sets.engaged.Conqueror = set_combine(sets.engaged, {})
	sets.engaged.Ukonvasara = set_combine(sets.engaged, {})
	sets.engaged.Scythe = set_combine(sets.engaged, {ear1="Schere Earring"})
	sets.engaged.H2H = set_combine(sets.engaged, {})
	sets.engaged.Nandaka = set_combine(sets.engaged, {})
	sets.engaged['Shining One'] = set_combine(sets.engaged.Nandaka, {})
	sets.engaged.Ragnarok = set_combine(sets.engaged.Nandaka, {back=gear.melee.back})
	

	sets.engaged.Acc = set_combine(sets.engaged, {
		neck="Warrior's Bead Necklace +2",ear1="Crepuscular Earring",ear2="Boii Earring +2",
		hands="Emicho Gauntlets +1",
		legs="Sakpata's Cuisses"})

	sets.engaged.Hybrid = set_combine(sets.engaged, sets.hybrid)

	sets.engaged.RetaliationTank = set_combine(sets.engaged, {ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",
		body="Sakpata's Breastplate",hands="Pummeler's Mufflers +3",ring2="Murky Ring",
		legs="Sakpata's Cuisses",feet="Boii Calligae +3"})

	sets.engaged.Ragnarok.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Ragnarok.StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged.Ragnarok.Hybrid = set_combine(sets.engaged.Ragnarok, sets.hybrid)
	sets.engaged.Chango.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Chango.StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged.Chango.Hybrid = set_combine(sets.engaged.Chango, sets.hybrid)
	sets.engaged.Conqueror.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Conqueror.StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged.Conqueror.Hybrid = set_combine(sets.engaged.Conqueror, sets.hybrid)
	sets.engaged.Ukonvasara.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Ukonvasara.StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged.Ukonvasara.Hybrid = set_combine(sets.engaged.Ukonvasara, sets.hybrid)
	sets.engaged.Scythe.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Scythe.StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged.Scythe.Hybrid = set_combine(sets.engaged.Chango, sets.hybrid)
	sets.engaged.H2H.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.H2H.StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged.H2H.Hybrid = set_combine(sets.engaged.Chango, sets.hybrid)	
	sets.engaged.Nandaka.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Nandaka.StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged.Nandaka.Hybrid = set_combine(sets.engaged.Nandaka, sets.hybrid)
	sets.engaged['Shining One'].Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged['Shining One'].StoreTP = set_combine(sets.engaged.StoreTP, {})
	sets.engaged['Shining One'].Hybrid = set_combine(sets.engaged['Shining One'], sets.hybrid)
	sets.engaged['Shining One'].Subtle = set_combine(sets.engaged['Shining One'], {
		head="Sakpata's Helm",neck="Bathy Choker +1",ear1="Dignitary's Earring",ear2="Boii Earring +2",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.melee.back,waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"
	})
	sets.engaged.Chango.Subtle = set_combine(sets.engaged['Shining One'].Subtle, {})
	sets.engaged.Conqueror.Subtle = set_combine(sets.engaged['Shining One'].Subtle, {})
	sets.engaged.Ukonvasara.Subtle = set_combine(sets.engaged['Shining One'].Subtle, {})
	sets.engaged.Subtle = set_combine(sets.engaged['Shining One'].Subtle, {})
	
	sets.engaged.Conqueror.AM = set_combine(sets.engaged.Conqueror, sets.engaged.StoreTP)
	sets.engaged.Ukonvasara.AM = set_combine(sets.engaged.Ukonvasara, {})
		
	sets.engaged.DW = set_combine(sets.engaged, sets.DW)
	sets.engaged.DW.Acc = set_combine(sets.engaged.Acc, sets.DW)
	sets.engaged.DW.StoreTP = set_combine(sets.engaged.StoreTP, sets.DW)
	sets.engaged.DW.Hybrid = set_combine(sets.engaged.Hybrid, sets.DW)
	
	sets.engaged.Twilight = set_combine(sets.engaged, sets.Twilight)
	sets.engaged.Acc.Twilight = set_combine(sets.engaged.Acc, sets.Twilight)
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end

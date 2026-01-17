-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'StoreTP','DW')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'PDL', 'Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')
	state.IdleMode:options('Normal','DW')
	
    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan +3"
	
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	gear.melee={}
	gear.melee.back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.nuke={}
	gear.nuke.back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.wsd={}
	gear.wsd.back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','"Regen"+5',}}
	gear.dw={}
	gear.dw.back={ name="Andartia's Mantle", augments={'"Dual Wield"+10',}}
	
	send_command('bind !` eh cycle')
    
    select_movement_feet()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.enmity = {
		neck="Moonlight Necklace",ear1="Trux Earring",ear2="Cryptic Earring",
		body="Emet Harness +1",hands="Kurys Gloves",ring1="Begrudging Ring",ring2="Supershear Ring",
		back="Reiki Cloak",waist="Sulla Belt",legs="Zoar Subligar +1",feet=""
	}

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +3"}
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +2"}
    sets.precast.JA['Sange'] = {body="Mochizuki Chainmail +3"}
	sets.precast.JA['Provoke'] = set_combine(sets.enmity, {})


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        
        body="Mochizuki Chainmail +3",hands="Adhemar Wristbands +1",
        back="Solemnity Cape",feet="Herculean Boots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        neck="Null Loop",
        body="Volte Jupon",hands="Adhemar Wristbands +1",ring1="Lehko's Ring",
        back="Andartia's Mantle",waist="Chaac Belt",feet="Herculean Boots"}

    sets.precast.Flourish1 = {body="Volte Jupon",waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		head="Herculean Helm",neck="Baetyl Pendant",
		hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		legs="Gyve Trousers"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Mochizuki Chainmail +3",back="Andartia's Mantle",feet="Hattori Kyahan +1"})

    -- Snapshot for ranged
    sets.precast.RA = {}
    
	sets.PDL = {neck="Ninja Nodowa +2",ear2="Hattori Earring +1",ring1="Sroda Ring"}
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Mpaca's Cap",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Epaminondas's Ring",ring2="Regal Ring",
        back="Null Shawl",waist="Fotia Belt",legs="Mpaca's Hose",feet="Herculean Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Malignance Chapeau",ear1="Crepuscular Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring"
	})
	sets.precast.WS.Proc = {
		head="Null Masque",neck="Null Loop",ear1="Crepuscular Earring",ear2="Cryptic Earring",
		body="Taeon Tabard",hands="Taeon Gloves",ring1="Chirich Ring +1",ring2="Murky Ring",
		back="Repulse Mantle",waist="Null Belt",legs="Taeon Tights",feet="Taeon Boots"}
	
	sets.precast.WS["Blade: Ten"] = set_combine(sets.precast.WS, {
		neck="Republican Platinum Medal",ear1="Ishvara Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sroda Ring",ring2="Epaminondas's Ring",
		back=gear.wsd.back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS["Blade: Ten"], {})
	sets.precast.WS["Savage Blade"].PDL = set_combine(sets.precast.WS["Savage Blade"], sets.PDL)
	sets.precast.WS["Blade: Metsu"] = set_combine(sets.precast.WS["Blade: Ten"], {
		head="Nyame Helm",ear2="Odr Earring",
	})
	sets.precast.WS["Blade: Metsu"].Proc = set_combine(sets.precast.WS.Proc, {})
	
	
	sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, {
		ear1="Odr Earring"
	})
	sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS, {
		head="Nyame Helm",ear1="Odr Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Lehko's Ring",ring2="Begrudging Ring",
		back=gear.wsd.back,legs="Mpaca's Hose",feet="Nyame Sollerets"
	})
	    
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, 
		{head="Mochizuki Hatsuburi +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Gere Ring",
		back=gear.wsd.back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	sets.precast.WS["Blade: Chi"] = set_combine(sets.precast.WS['Aeolian Edge'], {})
	sets.precast.WS["Blade: Chi"].PDL = set_combine(sets.precast.WS["Blade: Chi"], sets.PDL)
	sets.precast.WS["Blade: Teki"] = set_combine(sets.precast.WS['Aeolian Edge'], {})
	sets.precast.WS["Blade: To"] = set_combine(sets.precast.WS['Aeolian Edge'], {})
	sets.precast.WS["Blade: Yu"] = set_combine(sets.precast.WS['Aeolian Edge'], {})
	
	sets.precast.WS["Aeolian Edge"].Proc = set_combine(sets.precast.WS.Proc, {})
	sets.precast.WS["Blade: Shun"].Proc = set_combine(sets.precast.WS.Proc, {})
	sets.precast.WS["Blade: Hi"].Proc = set_combine(sets.precast.WS.Proc, {})
	sets.precast.WS["Blade: Chi"].Proc = set_combine(sets.precast.WS.Proc, {})
	sets.precast.WS["Blade: Teki"].Proc = set_combine(sets.precast.WS.Proc, {})
	sets.precast.WS["Blade: To"].Proc = set_combine(sets.precast.WS.Proc, {})
	sets.precast.WS["Blade: Yu"].Proc = set_combine(sets.precast.WS.Proc, {})
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {head="Nyame Helm",neck="Baetyl Pendant",hands="Leyline Gloves",ring1="Kishar Ring",feet="Herculean Boots"}

    sets.midcast.Utsusemi = set_combine(sets.enmity, {neck="Incanter's Torque",hands="Mochizuki Tekko +3",back=gear.wsd.back,feet="Hattori Kyahan +1"})

    sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.FastRecast, {
		head="Mochizuki Hatsuburi +3",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2=gear.rings.right,
		back=gear.nuke.back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {neck="Null Loop",back="Null Shawl"})

    sets.midcast.NinjutsuDebuff = set_combine(sets.midcast.ElementalNinjutsu.Resistant, {ear1="Crepuscular Earring",ear2="Hattori Earring +1",waist="Null Belt"})
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {hands="Mochizuki Tekko +3"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	sets.acc = {head="Mpaca's Cap",neck="Null Loop",ear1="Crepuscular Earring",ear2="Odr Earring",
		body="Tatenashi Haramaki +1",hands="Tatenashi Gote +1",ring1="Lehko's Ring",ring2="Regal Ring",
		back="Null Shawl",waist="Null Belt",legs="Tatenashi Haidate +1",feet="Tatenashi Sune-Ate +1"}
	
	sets.engaged = {
		head="Mpaca's Cap",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Hattori Earring +1",
		body="Tatenashi Haramaki +1",hands="Mpaca's Gloves",ring1="Lehko's Ring",ring2="Gere Ring",
		back="Null Shawl",waist="Windbuffet Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}
	sets.engaged.StoreTP = set_combine(sets.engaged, {
		head="Ryuo Somen +1",neck="Ninja Nodowa +2",
		hands="Tatenashi Gote +1",ring2="Chirich Ring +1",
		waist="Gerdr Belt +1",legs="Tatenashi Haidate +1",feet="Tatenashi Sune-Ate +1"
	})
	sets.engaged.Acc = set_combine(sets.engaged, sets.acc)
	sets.engaged.DW = set_combine(sets.engaged, {
		head="Ryuo Somen +1",neck="Republican Platinum Medal",ear1="Eabani Earring",ear2="Suppanomimi",
		body="Mochizuki Chainmail +3",hands="Floral Gauntlets",
		back=gear.dw.back,waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"
	})
		

	sets.idle = set_combine(sets.engaged, {
		head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		body="Hizamaru Haramaki +2",hands="Nyame Gauntlets",ring1="Sheltered Ring",ring2="Murky Ring",
		back=gear.wsd.back,waist="Null Belt",legs="Nyame Flanchard",feet=gear.MovementFeet})

	sets.idle.Town = set_combine(sets.idle, {})
    sets.idle.Weak = set_combine(sets.idle, {})
	sets.idle.DW = set_combine(sets.idle, {
		head="Ryuo Somen +1",neck="Republican Platinum Medal",ear1="Eabani Earring",ear2="Suppanomimi",
		body="Mochizuki Chainmail +3",hands="Floral Gauntlets",
		back=gear.dw.back,waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"
	})

	-- Resting sets
    sets.resting = set_combine(sets.idle, {})
    
    -- Defense sets
    sets.defense.Evasion = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.PDT = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {})


    sets.Kiting = {feet=gear.MovementFeet}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Mpaca's Cap",body="Mpaca's Doublet",hands="Mpaca's Gloves",ring2="Murky Ring",legs="Mpaca's Hose",feet="Nyame Sollerets"
	})
	
	sets.engaged.Evasion = set_combine(sets.engaged, sets.defense.Evasion)
    sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc, sets.defense.Evasion)
    sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
    sets.engaged.MDT = set_combine(sets.engaged, sets.defense.MDT)
    sets.engaged.Acc.MDT = set_combine(sets.engaged.Acc, sets.defense.MDT)
	
	--------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi +2",back=gear.wsd.back}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
end

function job_post_precast(spell, action, spellMap, eventArgs)
end
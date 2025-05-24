function user_setup()
    state.OffenseMode:options('Normal', 'DD', 'Acc', 'Reraise')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant', 'SIRD')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'MP', 'Charm')
    state.MagicalDefenseMode:options('MDT', 'HP', 'MP', 'Charm')
	state.IdleMode:options('Normal','DT')
    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
    state.EquipShield = M(false, 'Equip Shield w/Defense')

    update_defense_mode()
	
	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
	gear.capes={}
	gear.capes.sird={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	gear.capes.melee={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}
	gear.capes.wsd={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
    send_command('bind @f10 gs c toggle EquipShield')
    send_command('bind @f11 gs c toggle EquipShield')
end

function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.enmity = {
		head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Trux Earring",ear2="Cryptic Earring",
		body="Chevalier's Cuirass +3",hands="Yorium Gauntlets",ring1="Apeile Ring",ring2="Apeile Ring +1",
		back="Reiki Cloak",waist="Creed Baudrier",legs="Caballarius Breeches +3",feet="Chevalier's Sabatons +3"
	}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {back="Repulse Mantle",legs="Dashing Subligar"}
    sets.MP = {head="Chevalier's Armet +3",ear1="Ethereal Earring",waist="Flume Belt +1",feet="Reverence Leggings +3"}
    sets.MP_Knockback = set_combine(sets.Knockback, sets.MP)
    
	sets.engaged = {ammo="Staunch Tathlum +1",
		head="Chevalier's Armet +3",neck="Sacro Gorget",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Moonlight Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Chevalier's Cuisses +2",feet="Souveran Schuhs +1"}

	sets.engaged.Knockback = set_combine(sets.engaged, sets.Knockback)
	sets.engaged.MP = set_combine(sets.engaged, sets.MP)
	sets.engaged.MP_Knockback = set_combine(sets.engaged, sets.MP_Knockback)
	
    sets.defense.PDT = set_combine(sets.engaged, {})
    sets.defense.HP = set_combine(sets.engaged, {})
	
	sets.SIRD = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Moonlight Necklace",
		body="Chevalier's Cuirass +3",hands="Regal Gauntlets",
		back=gear.capes.sird,legs="Founder's Hose"}
	
	--------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.enmity, {legs="Caballarius Breeches +3"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.enmity, {feet="Reverence Leggings +3"})
    sets.precast.JA['Shield Bash'] = set_combine(sets.enmity, {hands="Caballarius Gauntlets +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.enmity, {feet="Caballarius Leggings +3"})
    sets.precast.JA['Rampart'] = set_combine(sets.enmity, {head="Caballarius Coronet +3"})
    sets.precast.JA['Fealty'] = set_combine(sets.enmity, {body="Caballarius Surcoat +3"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.enmity, {feet="Chevalier's Sabatons +3"})
    sets.precast.JA['Cover'] = set_combine(sets.enmity, {head="Reverence Coronet +1"})
	sets.precast.JA['Provoke'] = set_combine(sets.enmity, {})
	sets.precast.JA['Sepulcher'] = set_combine(sets.enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.enmity, {})
	
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
        head="Caballarius Coronet +3",
        body="Caballarius Surcoat +3",hands="Caballarius Gauntlets +3",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Reiki Cloak",legs="Caballarius Breeches +3",feet="Caballarius Leggings +3"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {body="Volte Jupon",waist="Chaac Belt"}
    sets.precast.Flourish1 = {body="Volte Jupon",waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Chevalier's Armet +3",neck="Baetyl Pendant",ear1="Etiolation Earring",
		body="Reverence Surcoat +3",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Weatherspoon Ring +1",
		back=gear.capes.sird,legs="Founder's Hose",feet="Chevalier's Sabatons +3"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)
	sets.precast.FC['Divine Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Sacro Breastplate",ear1="Mendicant's Earring"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
 	sets.precast.WS = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Shukuyu Ring",ring2="Regal Ring",
		back=gear.capes.wsd,waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Null Masque",ear1="Telos Earring",ear2="Crepuscular Earring",
		ring1="Lehko's Ring",ring2="Regal Ring",
		legs="Carmine Cuisses +1"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Archon Ring",
        back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})
    
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
		ear1="Thrud Earring",ring1="Lehko's Ring",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Republican Platinum Medal",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",
		back=gear.capes.wsd,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})
    
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Knights of Round'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS['Savage Blade'], {})
    --------------------------------------
    -- Midcast sets
    --------------------------------------

        
    sets.midcast.Enmity = set_combine(sets.enmity, {})

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.enmity, sets.SIRD)
	
    sets.midcast.Stun = set_combine(sets.midcast.Flash, {})
	
    sets.midcast.FastRecast = set_combine(sets.midcast.Flash, {})

    sets.midcast["Divine Magic"] = {
		head="Nyame Helm",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Reverence Surcoat +3",hands="Sakpata's Gauntlets",ring1=gear.rings.left,ring2="Weatherspoon Ring +1",
		back="Toro Cape",waist="Asklepian Belt",feet="Odyssean Greaves"}
	
	sets.midcast.Cure = set_combine(sets.defense.HP, {neck="Sacro Gorget",waist="Sroda Belt"})
	sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, sets.SIRD)
	sets.midcast['Magic Fruit'] = set_combine(sets.midcast.Cure, {})

    sets.midcast['Enhancing Magic'] = {hands="Regal Gauntlets",ear1="Andoaa Earring",ear2="Mimir Earring",ring1=gear.rings.left,ring2=gear.rings.right,legs="Founder's Hose",feet="Odyssean Greaves"}
    
	sets.midcast.Phalanx = set_combine(sets.midcast["Enhancing Magic"], {
		head="Odyssean Helm",body="Odyssean Chestplate",hands="Souveran Handschuhs +1",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"
	})
	
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
    sets.resting = {ring1=gear.rings.left}
    
	sets.Kiting = {legs="Carmine Cuisses +1"}
    -- Idle sets
    sets.idle = set_combine(sets.engaged, {ammo="Homiliary",
		head="Null Masque",neck="Republican Platinum Medal",body="Crepuscular Mail",hands="Nyame Gauntlets",ring1=gear.rings.left,back=gear.capes.melee,legs="Carmine Cuisses +1",feet="Nyame Sollerets"})

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Reraise = set_combine(sets.idle.Town, sets.Reraise)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Reraise)
	sets.idle.DT = set_combine(sets.idle, {neck="Loricate Torque +1",body="Reverence Surcoat +3",ring1="Moonlight Ring",ring2="Defending Ring"})
	    
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
    
    

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Srivatsa"} -- Ochain
    sets.MagicalShield = {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = set_combine(sets.engaged, {})
    sets.defense.HP = set_combine(sets.engaged, {})
    sets.defense.Reraise = set_combine(sets.defense.HP, sets.Reraise)
    sets.defense.Charm = set_combine(sets.defense.HP, {
		neck="Unmoving Collar +1",ear1="Arete del Luna +1",back="Solemnity Cape"
	})
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = set_combine(sets.defense.PDT, {})


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
	sets.engaged.DD = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Null Loop",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back=gear.capes.melee,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.engaged.DD.Knockback = set_combine(sets.engaged.DD4, sets.Knockback)
	sets.engaged.DD.MP = set_combine(sets.engaged.DD, sets.MP)
	sets.engaged.DD.MP_Knockback = set_combine(sets.engaged.DD, sets.MP_Knockback)

	sets.engaged.Acc = set_combine(sets.engaged.DD, {ear2="Crepuscular Earring",waist="Null Belt"})
	sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
	sets.engaged.MDT = set_combine(sets.engaged, sets.defense.MDT)
	sets.engaged.Acc.MDT = set_combine(sets.engaged.Acc, sets.defense.MDT)
	sets.engaged.Charm = set_combine(sets.engaged, sets.defense.Charm)
	sets.engaged.Acc.Charm = set_combine(sets.engaged.Acc, sets.defense.Charm)
	
	--------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom = {neck="Nicander's Necklace",ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +3"}
end
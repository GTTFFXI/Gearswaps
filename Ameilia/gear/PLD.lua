function user_setup()
    state.OffenseMode:options('Normal', 'DD', 'Acc', 'Reraise')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'Reraise', 'Charm')
    state.MagicalDefenseMode:options('MDT', 'HP', 'Reraise', 'Charm')
	state.IdleMode:options('Normal','DT')
    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
    state.EquipShield = M(false, 'Equip Shield w/Defense')

    update_defense_mode()
	
	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
    send_command('bind @f10 gs c toggle EquipShield')
    send_command('bind @f11 gs c toggle EquipShield')
	
	windower.add_to_chat(8, 'REMINDER: Your JSE is on storage slips 18 and 25. //lua l porterpacker and //po unpack to get it.')
end

function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.enmity = {ammo="Paeapua",
		head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Cryptic Earring",
		body="Reverence Surcoat +3",hands="Yorium Gauntlets",ring1="Apeile Ring",ring2="Apeile Ring +1",
		back="Reiki Cloak",waist="Creed Baudrier",legs="Caballarius Breeches +1",feet="Eschite Greaves"
	}

	sets.engaged = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Sacro Gorget",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Moonlight Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
	
    sets.defense.PDT = sets.engaged
    sets.defense.HP = sets.engaged
	
	--------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.enmity, {legs="Caballarius Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.enmity, {feet="Reverence Leggings +1"})
    sets.precast.JA['Shield Bash'] = set_combine(sets.enmity, {hands="Caballarius Gauntlets +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.enmity, {feet="Caballarius Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.enmity, {head="Caballarius Coronet +1"})
    sets.precast.JA['Fealty'] = set_combine(sets.enmity, {body="Caballarius Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.enmity, {feet="Creed Sabatons +2"})
    sets.precast.JA['Cover'] = set_combine(sets.enmity, {head="Reverence Coronet +1"})
	sets.precast.JA['Provoke'] = sets.enmity
	sets.precast.JA['Sepulcher'] = sets.enmity
	sets.precast.JA['Palisade'] = sets.enmity
	sets.precast.JA['Defender'] = sets.enmity
	
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
        head="Caballarius Coronet +1",
        body="Caballarius Surcoat +1",hands="Caballarius Gauntlets +1",ring1=gear.rings.left,ring2=gear.rings.right,
        back="Reiki Cloak",legs="Caballarius Breeches +1",feet="Caballarius Leggings +1"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Etiolation Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Veneficium Ring",ring2="Kishar Ring",
		legs="Founder's Hose",feet="Odyssean Greaves"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)
	sets.precast.FC['Divine Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Sacro Breastplate",ear1="Mendicant's Earring"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
 	sets.precast.WS = {ammo="Aurgelmir Orb",
		head=gear.wsdmg.head,neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Shukuyu Ring",ring2="Regal Ring",
		back="Reiki Cloak",waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		ring1="Cacoethic Ring +1",ring2="Regal Ring",
		legs="Carmine Cuisses +1"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.engaged, {
		neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Sacro Breastplate",ring1="Shiva Ring +1",ring2="Archon Ring",
        back="Toro Cape",waist="Orpheus's Sash"})
    
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",ear1="Thrud Earring",ring1="Ramuh Ring +1",legs="Lustratio Subligar +1",feet="Thereoid Greaves"})
	
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",body="Sacro Breastplate",legs="Carmine Cuisses +1"
	})
	
    --------------------------------------
    -- Midcast sets
    --------------------------------------

        
    sets.midcast.Enmity = sets.enmity

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {waist="Goading Belt"})
	sets.midcast['Blue Magic'] = sets.enmity
	
    sets.midcast.Stun = sets.midcast.Flash

    sets.midcast.FastRecast = sets.midcast.Flash

    sets.midcast["Divine Magic"] = {
		head="Jumalik Helm",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Reverence Surcoat +3",hands="Eschite Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Toro Cape",waist="Asklepian Belt",feet="Odyssean Greaves"}
	
	sets.midcast.Cure = set_combine(sets.defense.HP, {neck="Sacro Gorget"})

    sets.midcast['Enhancing Magic'] = {hands="Regal Gauntlets",ear1="Andoaa Earring",ear2="Mimir Earring",ring1=gear.rings.left,ring2=gear.rings.right,legs="Founder's Hose",feet="Odyssean Greaves"}
    
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
		head="Souveran Schaller +1",body="Sacro Breastplate",hands="Souveran Handschuhs +1",ring1=gear.rings.left,legs="Carmine Cuisses +1"})

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Reraise = set_combine(sets.idle.Town, sets.Reraise)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Reraise)
	sets.idle.DT = set_combine(sets.engaged, sets.Kiting)
	    
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
    
    

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1"}
    sets.MP_Knockback = {waist="Flume Belt +1"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Srivatsa"} -- Ochain
    sets.MagicalShield = {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = sets.engaged
    sets.defense.HP = sets.engaged
    sets.defense.Reraise = set_combine(sets.defense.HP, sets.Reraise)
    sets.defense.Charm = set_combine(sets.defense.HP, {
		back="Solemnity Cape"
	})
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = set_combine(sets.defense.PDT, {})


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
	sets.engaged.DD = {ammo="Aurgelmir Orb",
		head="Sakpata's Helm",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Regal Ring",
		back="Letalis Mantle",waist="Goading Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.engaged.Acc = set_combine(sets.engaged.DD, {
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		hands="Souveran Handschuhs +1",ring1="Chirich Ring +1",ring2="Regal Ring",
		waist="Eschan Stone",legs="Carmine Cuisses +1",feet="Valorous Greaves"})
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

    sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +1"}
end
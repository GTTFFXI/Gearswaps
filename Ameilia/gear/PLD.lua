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
	sets.enmity = {ammo="Paeapua",
		head="Loess Barbuta +1",neck="Moonbeam Necklace",ear1="Friomisi Earring",ear2="Cryptic Earring",
		body="Reverence Surcoat +2",hands="Yorium Gauntlets",ring1="Apeile Ring",ring2="Apeile Ring +1",
		back="Reiki Cloak",waist="Creed Baudrier",legs="Caballarius Breeches +1",feet="Eschite Greaves"
	}

	sets.engaged = {ammo="Staunch Tathlum",
		head="Arke Zuchetto +1",neck="Lavalier +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Reverence Surcoat +2",hands="Souveran Handschuhs +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Creed Baudrier",legs="Arke Cosciales +1",feet="Souveran Schuhs +1"}
	
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
    sets.precast.JA['Rampart'] = set_combine(sets.enmity, {head="Caballarius Coronet"})
    sets.precast.JA['Fealty'] = set_combine(sets.enmity, {body="Caballarius Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.enmity, {feet="Creed Sabatons +2"})
    sets.precast.JA['Cover'] = set_combine(sets.enmity, {head="Reverence Coronet +1"})
	sets.precast.JA['Provoke'] = sets.enmity
	sets.precast.JA['Sepulcher'] = sets.enmity
	sets.precast.JA['Palisade'] = sets.enmity
	sets.precast.JA['Defender'] = sets.enmity
	
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
        head="Caballarius Coronet",
        body="Caballarius Surcoat +1",hands="Caballarius Gauntlets +1",
        back="Reiki Cloak",legs="Caballarius Breeches +1",feet="Caballarius Leggings +1"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		hands="Leyline Gloves",ring2="Kishar Ring",
		legs="Founder's Hose",feet="Odyssean Greaves"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)
	sets.precast.FC['Divine Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Jumalik Mail",ear1="Mendicant's Earring"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
 	sets.precast.WS = {ammo="Ginsen",
		head=gear.wsdmg.head,neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Valorous Mitts",ring1="Shukuyu Ring",ring2="Regal Ring",
		back="Reiki Cloak",waist="Fotia Belt",legs="Valorous Hose",feet="Sulevia's Leggings +2"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		ring1="Cacoethic Ring +1",ring2="Regal Ring",
		legs="Carmine Cuisses +1"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.engaged, {
		neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Jumalik Mail",ring1="Shiva Ring +1",ring2="Archon Ring",
        back="Toro Cape"})
    
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",ear1="Mache Earring",ring1="Ramuh Ring +1",legs="Lustratio Subligar",feet="Thereoid Greaves"})
	
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		head="Carmine Mask +1",legs="Carmine Cuisses +1"
	})
	
    --------------------------------------
    -- Midcast sets
    --------------------------------------

        
    sets.midcast.Enmity = sets.enmity

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {waist="Dynamic Belt +1"})
	sets.midcast['Blue Magic'] = sets.enmity
	
    sets.midcast.Stun = sets.midcast.Flash

    sets.midcast.FastRecast = sets.midcast.Flash

    sets.midcast["Divine Magic"] = {ammo="Paeapua",
		head="Jumalik Helm",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Reverence Surcoat +2",hands="Eschite Gauntlets",ring1="Stikini Ring",ring2="Acumen Ring",
		back="Toro Cape",waist="Asklepian Belt",feet="Odyssean Greaves"}
	
	sets.midcast.Cure = sets.defense.HP

    sets.midcast['Enhancing Magic'] = {legs="Founder's Hose",feet="Odyssean Greaves"}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
    sets.resting = {ring1="Sheltered Ring"}
    
	sets.Kiting = {legs="Carmine Cuisses +1"}
    -- Idle sets
    sets.idle = set_combine(sets.engaged, {ammo="Homiliary",
		head="Jumalik Helm",body="Jumalik Mail",ring1="Sheltered Ring",legs="Carmine Cuisses +1"})

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
    sets.MP = {waist="Flume Belt"}
    sets.MP_Knockback = {waist="Flume Belt"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Priwen"} -- Ochain
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
    
	sets.engaged.DD = {ammo="Ginsen",
		head="Flamma Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Dagon Breastplate",hands="Souveran Handschuhs +1",ring1="Petrov Ring",ring2="Regal Ring",
		back="Letalis Mantle",waist="Dynamic Belt +1",legs="Valorous Hose",feet="Flamma Gambieras +2"}

	sets.engaged.Acc = set_combine(sets.engaged.DD, {
		head="Carmine Mask +1",ear1="Telos Earring",ear2="Dignitary's Earring",
		hands="Souveran Handschuhs +1",ring1="Patricius Ring",ring2="Regal Ring",
		waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Valorous Greaves"})
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
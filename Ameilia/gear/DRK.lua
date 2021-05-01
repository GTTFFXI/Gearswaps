-- Define sets and vars used by this job file.
function init_gear_sets()
	gear.melee = {}
	gear.melee.back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.melee.feet = { name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}}
	gear.melee.legs = { name="Valor. Hose", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+4','STR+8','Accuracy+13','Attack+5',}}

	
	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Odyssean Helm", augments={'Weapon skill damage +3%','VIT+13','Attack+15',}}
	gear.wsdmg.hands = { name="Odyssean Gauntlets", augments={'Attack+5','Weapon skill damage +3%','Quadruple Attack +2','Accuracy+11 Attack+11',}}
	gear.wsdmg.back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.wsdmg.feet = { name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}}
	gear.wsdmg.vitback = { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	
	sets.HP = {head="Hjarrandi Helm",neck="Bathy Choker +1",ear1="Cryptic Earring",ear2="Etiolation Earring",
		body="Ignominy Cuirass +3",hands="Ignominy Gauntlets +2",ring1="Moonlight Ring",ring2="Regal Ring",
		back="Moonlight Cape",waist="Eschan Stone",legs="Flamma Dirs +2",feet="Ratri Sollerets"}
	
	sets.precast.FC = {head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Etiolation Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Veneficium Ring",
		waist="Ioskeha Belt +1",legs="Eschite Cuisses",feet="Odyssean Greaves"}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +1"}
	sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +1"}
	sets.precast.JA['Diabolic Eye'] = {body="Fallen's Finger Gauntlets +1"}
	sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets +2"}
	
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.Lugra = {ear1="Thrud Earring"}
	
	sets.precast.WS = {ammo="Seething Bomblet +1",
		head="Stinger Helm +1",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.melee.back,waist="Fotia Belt",legs="Ignominy Flanchard +3",feet="Sakpata's Leggings"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Valorous Hose"})
	
	-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {
		head="Ignominy Burgonet +3",ear1="Schere Earring",hands="Ignominy Gauntlets +2",feet="Sulevia's Leggings +2"})
	sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS, {ear1="Schere Earring"})
	sets.precast.WS['Entropy'].Acc = sets.precast.WS.Acc
	
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS)
	sets.precast.WS['Resolution'].Acc = sets.precast.WS.Acc
	
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head=gear.wsdmg.head,neck="Abyssal Beads +2",ear1="Thrud Earring",body="Ignominy Cuirass +3",hands=gear.wsdmg.hands,back=gear.wsdmg.vitback,legs="Fallen's Flanchard +3",feet="Sulevia's Leggings +2"
	})
	sets.precast.WS['Torcleaver'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Scourge'] = sets.precast.WS['Torcleaver']
	sets.precast.WS['Scourge'].Acc = sets.precast.WS['Torcleaver'].Acc
	
	sets.precast.WS['Cross Reaper'] = sets.precast.WS['Torcleaver']
	sets.precast.WS['Cross Reaper'].Acc = sets.precast.WS['Torcleaver'].Acc
	sets.precast.WS['Quietus'] = sets.precast.WS['Torcleaver']
	sets.precast.WS['Quietus'].Acc = sets.precast.WS['Torcleaver'].Acc
	sets.precast.WS['Catastrophe'] = sets.precast.WS['Torcleaver']
	sets.precast.WS['Catastrophe'].Acc = sets.precast.WS['Torcleaver'].Acc
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask +1",ear1="Malignance Earring",
		body="Sacro Breastplate",ring1="Kishar Ring",
		feet="Nyame Sollerets"}
	
	sets.midcast['Dark Magic'] = {head="Flamma Zucchetto +2",neck="Erra Pendant",ear1="Malignance Earring",ear2="Dignitary's Earring",
		body="Carmine Scale Mail",hands="Fallen's Finger Gauntlets +1",ring1="Evanescence Ring",ring2="Archon Ring",
		back="Niht Mantle",waist="Eschan Stone",legs="Nyame Flanchard",feet="Ratri Sollerets"
	}
	
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {head="Fallen's Burgeonet +1",legs="Heathen's Flanchard +1"})
	
	sets.midcast.Aspir = sets.midcast['Dark Magic']
	
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {head="Ignominy Burgonet +3",back="Ankou's Mantle"})
	
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
		head="Flamma Zucchetto +2",hands="Flamma Manopolas +2",body="Sacro Breastplate",ring1=gear.rings.left,ring2=gear.rings.right,feet="Flamma Gambieras +2"
	})
	
	sets.midcast['Elemental Magic'] = {
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shiva Ring +1",ring2="Acumen Ring",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"
	}
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.midcast['Dread Spikes'] = sets.HP
	
	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu = sets.midcast.FastRecast

	-- any ninjutsu cast on enemies
	sets.midcast.Ninjutsu = {}

	--sets.midcast.Ninjutsu.Resistant = {}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Aurgelmir Orb",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Lugra Cloak +1",hands="Sakpata's Gauntlets",ring1=gear.rings.left,ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Sakpata's Leggings"}

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Twilight = set_combine(sets.idle.Town, sets.Twilight)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Twilight)

	-- Defense sets

	sets.defense.PDT = {
		head="Sakpata's Helm",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring2="Defending Ring",
		back=gear.melee.back,legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.defense.Twilight = set_combine(sets.defense.PDT, sets.Twilight)
	sets.defense.MDT = set_combine(sets.defense.PDT, {})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Aurgelmir Orb",
		head="Flamma Zucchetto +2",neck="Abyssal Beads +2",ear1="Telos Earring",ear2="Cessance Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.melee.back,waist="Ioskeha Belt +1",legs="Ignominy Flanchard +3",feet="Flamma Gambieras +2"}
	sets.engaged.Ragnarok = set_combine(sets.engaged, {})
	sets.engaged.Caladbolg = set_combine(sets.engaged,{})
	sets.engaged.Scythe = set_combine(sets.engaged, {ear2="Schere Earring"})
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Ignominy Burgonet +3",neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Ignominy Cuirass +3",hands="Ignominy Gauntlets +2",ring2="Regal Ring",
		waist="Ioskeha Belt +1",feet="Flamma Gambieras +2"})
		
	sets.engaged.Ragnarok.Acc = sets.engaged.Acc
	sets.engaged.Caladbolg.Acc = sets.engaged.Acc
	sets.engaged.Scythe.Acc = sets.engaged.Acc

	sets.engaged.Caladbolg.AM = set_combine(sets.engaged.Caladbolg, {
		ammo="Yetshila +1",head="Blistering Sallet +1",body="Hjarrandi Breastplate",hands="Flamma Manopolas +2",ring2="Hetairoi Ring"
	})
	sets.engaged.Caladbolg.Acc.AM = sets.engaged.Acc
	sets.engaged.Hybrid = set_combine(sets.engaged, sets.defense.PDT, {ear2="Odnowa Earring +1",ring1="Moonlight Ring",ring2="Chirich Ring +1"})
	sets.engaged.Ragnarok.Hybrid = set_combine(sets.engaged.Ragnarok, sets.defense.PDT)
	sets.engaged.Caladbolg.Hybrid = set_combine(sets.engaged.Caladbolg, sets.defense.PDT)
	sets.engaged.Scythe.Hybrid = set_combine(sets.engaged.Scythe, sets.defense.PDT)
	
	sets.engaged.Twilight = set_combine(sets.engaged, sets.Twilight)
	sets.engaged.Acc.Twilight = set_combine(sets.engaged.Acc, sets.Twilight)
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end

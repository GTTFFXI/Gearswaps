-- Define sets and vars used by this job file.
function init_gear_sets()
	gear.melee = {}
	gear.melee.back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	
	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Mag. Acc.+25','Weapon skill damage +5%','Accuracy+10','Attack+13',}}
	gear.wsdmg.back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

	sets.precast.FC = {head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Etiolation Earring",
		body="Odyssean Chestplate",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Veneficium Ring",
		waist="Ioskeha Belt",legs="Eschite Cuisses",feet="Odyssean Greaves"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +1"}
	sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +1"}
	sets.precast.JA['Diabolic Eye'] = {body="Fallen's Finger Gauntlets +1"}
	
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.Lugra = {ear1="Lugra Earring +1"}
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Argosy Celata +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Argosy Mufflers +1",ring1="Ifrit Ring +1",ring2="Shukuyu Ring",
		back=gear.melee.back,waist="Fotia Belt",legs="Argosy Breeches +1",feet="Argosy Sollerets +1"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		ring1="Cacoethic Ring +1",ring2="Shukuyu Ring",
		legs="Valorous Hose"})
	

	-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS)
	sets.precast.WS['Resolution'].Acc = sets.precast.WS.Acc
	
	sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
		head=gear.wsdmg.head,body="Valorous Mail",hands="Valorous Mitts",back=gear.wsdmg.back,legs="Valorous Hose",feet="Sulevia's Leggings +2"
	})
	sets.precast.WS['Torcleaver'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Scourge'] = sets.precast.WS['Torcleaver']
	sets.precast.WS['Scourge'].Acc = sets.precast.WS['Torcleaver'].Acc
	
	--sets.precast.WS['Cross Reaper'] = sets.precast.WS['Torcleaver']
	--sets.precast.WS['Cross Reaper'].Acc = sets.precast.WS['Torcleaver'].Acc
	sets.precast.WS['Quietus'] = sets.precast.WS['Torcleaver']
	sets.precast.WS['Quietus'].Acc = sets.precast.WS['Torcleaver'].Acc
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask +1",ear2="Loquacious Earring",
		hands="Founder's Gauntlets",ring1="Prolix Ring",
		feet="Founder's Greaves"}
	
	sets.midcast.Drain = {head="Fallen's Burgeonet +1",neck="Erra Pendant",ear1="Gwati Earring",ear2="Dignitary's Earring",
		body="Carmine Scale Mail",hands="Fallen's Finger Gauntlets +1",ring1="Evanescence Ring",ring2="Archon Ring",
		back="Niht Mantle",waist="Eschan Stone",legs="Heathen's Flanchard +1",feet="Odyssean Greaves"
	}
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Stun = set_combine(sets.midcast.Drain, {
		head="Flamma Zucchetto +2",hands="Flamma Manopolas +2",ring2="Stikini Ring"
	})
	
	sets.midcast['Elemental Magic'] = {
		head="Jumalik Helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Carmine Scale Mail",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Acumen Ring",
		back="Toro Cape",waist="Eschan Stone",legs="Eschite Cuisses",feet="Odyssean Greaves"
	}
	
	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu = sets.midcast.FastRecast

	-- any ninjutsu cast on enemies
	sets.midcast.Ninjutsu = {}

	--sets.midcast.Ninjutsu.Resistant = {}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Ginsen",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Lugra Cloak +1",hands="Sulevia's Gauntlets +2",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Sulevia's Leggings +2"}

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Twilight = set_combine(sets.idle.Town, sets.Twilight)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Twilight)

	-- Defense sets

	sets.defense.PDT = {
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Cessance Earring",
		body="Chozoron Coselete",hands="Sulevia's Gauntlets +2",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Valorous Hose",feet="Sulevia's Leggings +2"}
	sets.defense.Twilight = set_combine(sets.defense.PDT, sets.Twilight)
	sets.defense.MDT = set_combine(sets.defense.PDT, {head="Loess Barbuta +1",feet="Sulevia's Leggings +2"})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Flamma Zucchetto +2",neck="Ganesha's Mala",ear1="Telos Earring",ear2="Cessance Earring",
		body="Dagon Breastplate",hands="Argosy Mufflers +1",ring1="Petrov Ring",ring2="Flamma Ring",
		back=gear.melee.back,waist="Ioskeha Belt",legs="Argosy Breeches +1",feet="Argosy Sollerets +1"}
	sets.engaged.Ragnarok = set_combine(sets.engaged, {legs="Argosy Breeches +1"})
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		hands="Odyssean Gauntlets",ring1="Cacoethic Ring +1",
		waist="Olseni Belt",legs="Carmine Cuisses +1"})
	sets.engaged.Twilight = set_combine(sets.engaged, sets.Twilight)
	sets.engaged.Acc.Twilight = set_combine(sets.engaged.Acc, sets.Twilight)
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end

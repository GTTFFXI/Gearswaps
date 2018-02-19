function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')

	gear.melee = {}
	gear.melee.feet = { name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}}
	
	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}
	gear.wsdmg.feet = { name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}}
    
	update_combat_form()
end


function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA.Berserk = {body="Pummeler's Lorica +1",feet="Agoge Calligae +1",back="Cichol's Mantle"}
	sets.precast.JA['Aggressor'] = {}
	sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers"}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +1"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +1"}
	
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
			
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ear2="Loquacious Earring",ring1="Prolix Ring",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
   
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
   	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.Lugra = {ear1="Lugra Earring +1"}
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Argosy Celata +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Argosy Mufflers +1",ring1="Niqmaddu Ring",ring2="Shukuyu Ring",
		back="Cichol's Mantle",waist="Fotia Belt",legs="Argosy Breeches +1",feet=gear.wsdmg.feet}
	sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {head=gear.wsdmg.head,body="Valorous Mail",hands="Valorous Mitts",legs="Valorous Hose",feet="Valorous Greaves"})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		ring1="Niqmaddu Ring",ring2="Cacoethic Ring +1",
		legs="Pummeler's Cuisses +3"})
	
	-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Valorous Mask",ear2="Loquacious Earring",
		ring1="Prolix Ring",
		legs="Acro Breeches",feet="Founder's Greaves"}
			
	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu = sets.midcast.FastRecast

	-- any ninjutsu cast on enemies
	sets.midcast.Ninjutsu = {}

	--sets.midcast.Ninjutsu.Resistant = {}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Ginsen",head=gear.wsdmg.head,neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Chozoron Coselete",hands="Valorous Mitts",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Odyssean Cuisses",feet="Hermes' Sandals"}

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Twilight = set_combine(sets.idle.Town, sets.Twilight)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Twilight)
	
	-- Defense sets

	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Arke Zuchetto",neck="Loricate Torque +1",
		body="Souveran Cuirass",hands="Sulevia's Gauntlets +2",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Arke Cosciales" }
	sets.defense.Twilight = set_combine(sets.defense.PDT, sets.Twilight)
	sets.defense.MDT = set_combine(sets.defense.PDT, {})
	
	sets.Kiting = {feet="Hermes' Sandals"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Flamma Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Dagon Breastplate",hands="Argosy Mufflers +1",ring1="Niqmaddu Ring",ring2="Petrov Ring",
		back="Cichol's Mantle",waist="Ioskeha Belt",legs="Argosy Breeches +1",gear.melee.feet}
	sets.engaged.Ragnarok = set_combine(sets.engaged, {legs="Argosy Breeches +1"})
	sets.engaged.Acc = set_combine(sets.engaged, {
		neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Valorous Mail",ring1="Niqmaddu Ring",ring2="Cacoethic Ring +1",
		waist="Olseni Belt",legs="Pummeler's Cuisses +3"})
	sets.engaged.Twilight = set_combine(sets.engaged, sets.Twilight)
	sets.engaged.Acc.Twilight = set_combine(sets.engaged.Acc, sets.Twilight)
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end

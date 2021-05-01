-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal', 'MidAcc', 'Acc', 'Hybrid', 'StoreTP')
	state.DefenseMode:options('None','Normal', 'Physical', 'Magical', 'Reraise')
	state.WeaponskillMode:options('Normal', 'Acc', 'Crit')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT', 'Reraise')
	state.MagicalDefenseMode:options('MDT')

	jumps = S{'Jump','High Jump','Super Jump','Spirit Jump','Soul Jump'}

	gear.melee = {}
	gear.melee.back = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	gear.melee.legs = { name="Valorous Hose", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+4','STR+8','Accuracy+13','Attack+5',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}
	gear.wsdmg.back = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.wsdmg.legs = { name="Valor. Hose", augments={'Attack+29','Weapon skill damage +5%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	
	--state.Defense.PhysicalMode = 'PDT'

	-- Additional local binds
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	sets.engaged = {ammo="Aurgelmir Orb",
		head="Hjarrandi Helm",neck="Dragoon's Collar +2",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Dagon Breastplate",hands="Sulevia's Gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.wsdmg.back,waist="Ioskeha Belt +1",legs=gear.melee.legs,feet="Flamma Gambieras +2"}
	
	sets.engaged.StoreTP = {ammo="Aurgelmir Orb",
		head="Flamma Zucchetto +2",neck="Dragoon's Collar +2",ear1="Telos Earring",ear2="Sherida Earring",
		body="Dagon Breastplate",hands="Flamma Manopolas +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.melee.back,waist="Ioskeha Belt +1",legs="Pteroslaver Brais +3",feet="Flamma Gambieras +2"}
		
	sets.engaged.MidAcc = set_combine(sets.engaged, {hands="Flamma Manopolas +2",legs="Carmine Cuisses +1"})
		
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Carmine Mask +1",neck="Dragoon's Collar +2",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Dagon Breastplate",hands="Vishap Finger Gauntlets +3",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.melee.back,legs="Vishap Brais +3",feet="Vishap Greaves +3"})
		
	sets.engaged.Hybrid = set_combine(sets.engaged, {head="Hjarrandi Helm",body="Hjarrandi Breastplate",hands="Sulevia's Gauntlets +2",ring2="Defending Ring",legs="Arke Cosciales +1"})
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon",ear1="Dragoon's Earring",hands="Pteroslaver Finger Gauntlets +3"}
	sets.precast.JA.Jump = {ammo="Aurgelmir Orb",
		head="Flamma Zucchetto +2",neck="Dragoon's Collar +2",ear1="Telos Earring",ear2="Sherida Earring",
		body="Pteroslaver Mail +3",hands="Vishap Finger Gauntlets +3",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=gear.melee.back,waist="Ioskeha Belt +1",legs="Pteroslaver Brais +3",feet="Vishap Greaves +3"}
	sets.precast.JA.Jump.Acc = set_combine(sets.precast.JA.Jump, sets.engaged.Acc)
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"}
	sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {legs="Pteroslaver Brais +3"})
	sets.precast.JA['Soul Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Spirit Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Super Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Soul Jump'].Acc = sets.precast.JA.Jump.Acc
	sets.precast.JA['Spirit Jump'].Acc = sets.precast.JA.Jump.Acc
	sets.precast.JA['Super Jump'].Acc = sets.precast.JA.Jump.Acc
	sets.precast.JA['Spirit Link'] = {head="Drn. Armet +1",hands="Peltast's Vambraces +1"}
	sets.precast.JA['Call Wyvern'] = {body="Pteroslaver Mail +3"}
	sets.precast.JA['Deep Breathing'] = {}
	sets.precast.JA['Spirit Surge'] = {}

	
	-- Healing Breath sets
	sets.HB = {}
	sets.HB.Pre = {head="Drn. Armet +1",neck="Dragoon's Collar +2",ear1="Bloodgem Earring",ear2="Etiolation Earring",
		body="Pteroslaver Mail +3",hands="Pteroslaver Finger Gauntlets +3",ring1="Moonlight Ring",
		back="Moonlight Cape",waist="Glassblower's Belt",legs="Arke Cosciales +1",feet="Pteroslaver Greaves +3"}
	sets.HB.Mid = {
		head="Pteroslaver Armet +3",neck="Dragoon's Collar +2",ear1="Lancer's Earring",ear2="Bloodgem Earring",
		body="Pteroslaver Mail +3",hands="Despair Finger Gauntlets",ring1="Moonlight Ring",
		back="Brigantia's Mantle",waist="Glassblower's Belt",legs="Vishap Brais +3",feet="Pteroslaver Greaves +3"}
		
	sets.precast.JA['Steady Wing'] = sets.HB.Mid
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Breath = {}
	
	-- Fast cast sets for spells
	
	sets.precast.FC = sets.HB.Pre
    
	-- Midcast Sets
	sets.midcast.FastRecast = {}	
		
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS = {ammo="Knobkierrie",
		head="Stinger Helm +1",neck="Dragoon's Collar +2",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Dagon Breastplate",hands="Sulevia's Gauntlets +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.wsdmg.back,waist="Fotia Belt",legs=gear.melee.legs,feet="Pteroslaver Greaves +3"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Dagon Breastplate",hands="Vishap Finger Gauntlets +3",ring2="Regal Ring",
		legs="Vishap Brais +3",feet="Vishap Greaves +3"})
	sets.precast.WS.Crit = set_combine(sets.precast.WS, {
		body="Hjarrandi Breastplate",hands="Flamma Manopolas +2",ring1="Begrudging Ring",feet="Thereoid Greaves"
	})
		
	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, {
		head="Flamma Zucchetto +2",neck="Dragoon's Collar +2",ear2="Dignitary's Earring",
		body="Flamma Korazin +2",hands="Flamma Manopolas +2",ring1=gear.rings.left,ring2=gear.rings.right,
		waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flamma Gambieras +2"
	})
	
	sets.precast.WS['Drakesbane'] = sets.precast.WS.Crit
	sets.precast.WS['Geirskogul'] = set_combine(sets.precast.WS, {ring2="Ramuh Ring +1"})
	sets.precast.WS['Camlann\'s Torment'] = set_combine(sets.precast.WS, {
		body="Valorous Mail",ear2="Thrud Earring",
		hands="Pteroslaver Finger Gauntlets +3",legs="Vishap Brais +3",feet="Sulevia's Leggings +2"})
	sets.precast.WS['Sonic Thrust'] = sets.precast.WS['Camlann\'s Torment']
	
	sets.precast.WS['Camlann\'s Torment'].Crit = set_combine(sets.precast.WS['Camlann\'s Torment'], sets.precast.WS.Crit)
	sets.precast.WS['Sonic Thrust'].Crit = set_combine(sets.precast.WS['Sonic Thrust'], sets.precast.WS.Crit)
	
	-- Sets to return to when not performing an action.

	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.idle = set_combine(sets.engaged, {
		head="Valorous Mask",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Sacro Breastplate",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",legs="Carmine Cuisses +1",feet="Pteroslaver Greaves +3"})

	-- Resting sets
	sets.resting = sets.idle

	-- Idle sets

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Field = sets.idle
	sets.idle.Weak = set_combine(sets.idle, sets.Reraise)
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Arke Zuchetto +1",neck="Loricate Torque +1",
		body="Hjarrandi Breastplate",hands="Sulevia's Gauntlets +2",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Arke Cosciales +1"}

	sets.defense.Reraise = set_combine(sets.defense.PDT, sets.Reraise)

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Arke Zuchetto +1",neck="Loricate Torque +1",
		body="Hjarrandi Breastplate",hands="Sulevia's Gauntlets +2",ring1="Purity Ring",ring2="Defending Ring",
		back="Moonlight Cape",legs="Arke Cosciales +1",feet="Sulevia's Leggings +2"}

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group


	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
	sets.engaged.MDT = set_combine(sets.engaged, sets.defense.MDT)
	sets.engaged.Acc.MDT = set_combine(sets.engaged.Acc, sets.defense.MDT)
	sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)
end

function job_post_precast(spell, action, spellMap, eventArgs)
	if (state.OffenseMode.current == 'Acc' or state.OffenseMode.current == 'MidAcc') and
		 jumps:contains(spell.name) then
			equip(sets.precast.JA.Jump.Acc)
	end
end
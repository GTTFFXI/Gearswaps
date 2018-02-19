-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal', 'MidAcc', 'Acc')
	state.DefenseMode:options('None','Normal', 'Physical', 'Magical', 'Reraise')
	state.WeaponskillMode:options('Normal', 'Acc')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT', 'Reraise')
	state.MagicalDefenseMode:options('MDT')

	jumps = S{'Jump','High Jump','Super Jump','Spirit Jump','Soul Jump'}

	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}

	
	--state.Defense.PhysicalMode = 'PDT'

	-- Additional local binds
	send_command('bind ^` gs c cycle Offense')
	send_command('bind !` gs c cycle Defense')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	sets.engaged = {ammo="Ginsen",
		head="Flamma Zucchetto +2",neck="Ganesha's Mala",ear1="Telos Earring",ear2="Sherida Earring",
		body="Dagon Breastplate",hands="Sulevia's Gauntlets +2",ring1="Niqmaddu Ring",ring2="Petrov Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Valorous Hose",feet="Flamma Gambieras +2"}
		
	sets.engaged.MidAcc = set_combine(sets.engaged, {hands="Flamma Manopolas +2",legs="Carmine Cuisses +1"})
		
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Dagon Breastplate",hands="Vishap FInger Gauntlets +3",ring1="Niqmaddu Ring",ring2="Cacoethic Ring +1",
		back="Brigantia's Mantle",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Vishap Greaves +3"})
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon",hands="Pteroslaver Finger Gauntlets +1"}
	sets.precast.JA.Jump = {ammo="Ginsen",
		head="Flamma Zucchetto +2",neck="Ganesha's Mala",ear1="Telos Earring",ear2="Sherida Earring",
		body="Dagon Breastplate",hands="Sulevia's Gauntlets +2",ring1="Niqmaddu Ring",ring2="Petrov Ring",
		back="Brigantia's Mantle",waist="Windbuffet Belt +1",legs="Peltast's Cuissots +1",feet="Maenadic Gambieras"}
	sets.precast.JA.Jump.Acc = set_combine(sets.precast.JA.Jump, sets.engaged.Acc)
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"}
	sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {legs="Vishap Brais +3"})
	sets.precast.JA['Soul Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Spirit Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Super Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Soul Jump'].Acc = sets.precast.JA.Jump.Acc
	sets.precast.JA['Spirit Jump'].Acc = sets.precast.JA.Jump.Acc
	sets.precast.JA['Super Jump'].Acc = sets.precast.JA.Jump.Acc
	sets.precast.JA['Spirit Link'] = {head="Drn. Armet +1",hands="Peltast's Vambraces +1"}
	sets.precast.JA['Call Wyvern'] = {body="Wyrm Mail +2"}
	sets.precast.JA['Deep Breathing'] = {}
	sets.precast.JA['Spirit Surge'] = {}

	
	-- Healing Breath sets
	sets.HB = {}
	sets.HB.Pre = {head="Drn. Armet +1",neck="Lavalier +1",ear1="Bloodgem Earring",ear2="Etiolation Earring",
		body="Gorney Haubert +1",hands="Gorney Moufles +1",ring1="Moonbeam Ring",ring2="K'ayres Ring",
		back="Moonbeam Cape",waist="Glassblower's Belt",legs="Arke Cosciales",feet="Pteroslaver Greaves +2"}
	sets.HB.Mid = {
		head="Pteroslaver Armet +1",neck="Lancer's Torque",ear1="Lancer's Earring",ear2="Bloodgem Earring",
		body="Wyvern Mail",hands="Despair Finger Gauntlets",ring1="Moonbeam Ring",ring2="K'ayres Ring",
		back="Brigantia's Mantle",waist="Glassblower's Belt",legs="Vishap Brais +3",feet="Pteroslaver Greaves +2"}
		
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
		head="Flamma Zucchetto +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Dagon Breastplate",hands="Sulevia's Gauntlets +2",ring1="Niqmaddu Ring",ring2="Shukuyu Ring",
		back="Brigantia's Mantle",waist="Fotia Belt",legs="Valorous Hose",feet="Pteroslaver Greaves +2"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Dagon Breastplate",hands="Vishap Finger Gauntlets +3",ring2="Cacoethic Ring +1",
		legs="Vishap Brais +3",feet="Vishap Greaves +3"})

	sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, {
		head="Flamma Zucchetto +2",neck="Sanctity Necklace",ear2="Dignitary's Earring",
		body="Flamma Korazin +1",hands="Flamma Manopolas +2",ring1="Flamma Ring",ring2="Stikini Ring",
		waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flamma Gambieras +2"
	})
	
	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {
		body="Vatic Byrnie",feet="Thereoid Greaves"})
	sets.precast.WS['Geirskogul'] = set_combine(sets.precast.WS, {
		ring2="Ramuh Ring +1"})
	sets.precast.WS['Camlann\'s Torment'] = set_combine(sets.precast.WS, {head=gear.wsdmg.head,feet="Sulevia's Leggings +2"})
	
	-- Sets to return to when not performing an action.

	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.idle = set_combine(sets.engaged, {
		head="Valorous Mask",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Chozoron Coselete",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Carmine Cuisses +1",feet="Pteroslaver Greaves +2"})

	-- Resting sets
	sets.resting = sets.idle

	-- Idle sets

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Field = sets.idle
	sets.idle.Weak = set_combine(sets.idle, sets.Reraise)
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Arke Zucchetto",neck="Loricate Torque +1",
		body="Chozoron Coselete",hands="Sulevia's Gauntlets +2",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Arke Cosciales"}

	sets.defense.Reraise = set_combine(sets.defense.PDT, sets.Reraise)

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",
		body="Chozoron Coselete",hands="Sulevia's Gauntlets +2",ring1="Fortified Ring",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Arke Cosciales",feet="Sulevia's Leggings +2"}

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
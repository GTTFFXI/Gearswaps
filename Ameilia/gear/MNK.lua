-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Counter')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'Counter')
    state.PhysicalDefenseMode:options('PDT', 'HP')

    update_combat_form()
    update_melee_groups()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Mel. Hose +2"}
	sets.precast.JA['Boost'] = {hands="Anchorite's Gloves +1"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +1"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +1"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +3"}
	sets.precast.JA['Footwork'] = {}
	sets.precast.JA['Formless Strikes'] = {body="Hes. Cyclas +1"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +3"}

	sets.precast.JA['Chi Blast'] = {}

	sets.precast.JA['Chakra'] = {
		
		body="Anchorite's Cyclas +1",hands="Hes. Gloves",
		feet="Herculean Boots"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		
		body="Anchorite's Cyclas +1",hands="Adhemar Wristbands +1",
		feet="Herculean Boots"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {waist="Chaac Belt"}
	sets.precast.Flourish1 = {waist="Chaac Belt"}


	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Herculean Helm",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Kishar Ring",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back="Segomo's Mantle",waist="Fotia Belt",legs="Hizamaru Hizayoroi +2",feet="Herculean Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring"
	})
	
	sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
		ring2="Begrudging Ring"
	})
	sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
		neck="Combatant's Torque",ear2="Mache Earring",waist="Grunfeld Rope",legs="Jokushu Haidate"})
	
	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS, {
		neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",hands="Adhemar Wristbands +1",ring1="Acumen Ring",
		back="Toro Cape"})
	
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Herculean Helm",ear2="Loquacious Earring",hands="Leyline Gloves",
		waist="Goading Belt"}
		
	sets.engaged = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Moonlight Nodowa",ear1="Sherida Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back="Segomo's Mantle",waist="Moonbow Belt",legs="Samnuha Tights",feet="Herculean Boots"}
	
	-- Sets to return to when not performing an action.
	sets.regen = {neck="Bathy Choker +1",ear1="Infused Earring",body="Hizamaru Haramaki +2",ring1="Sheltered Ring",ring2="Defending Ring",legs="Rao Haidate"}

	sets.idle = set_combine(sets.engaged, sets.regen, {ring2="Defending Ring",back="Moonbeam Cape",feet="Crier's Gaiters"})
	
	-- Resting sets
	sets.resting = sets.idle
	
	-- Idle sets
	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Weak = sets.idle
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		neck="Loricate Torque +1",
		body="Emet Harness +1",hands="Adhemar Wristbands +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Moonbow Belt",legs="Mummu Kecks +2",feet="Herculean Boots"}

	sets.defense.HP = {
		head="Herculean Helm",
		body="Anchorite's Cyclas +1",hands="Hesychast's Gloves",
		back="Moonbeam Cape"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {
		ear1="Etiolation Earring",ring1="Fortified Ring",
		})

	sets.Kiting = {feet="Crier's Gaiters"}

	sets.ExtraRegen = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee sets

	sets.engaged.Acc = {ammo="Falcon Eye",
		head="Kendatsuba Jinpachi +1",neck="Moonlight Nodowa",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Anchorite's Hose +2",feet="Herculean Boots"}
		
	sets.engaged.Counter = set_combine(sets.engaged, {ammo="Amar Cluster",body="Reiki Osode",legs="Anchorite's Hose +2",feet="Hesychast's Gaiters +3"})
		
	-- Defensive melee hybrid sets
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)

	-- Hundred Fists/Impetus melee set mods
	sets.engaged.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +1"})
	sets.engaged.HF = set_combine(sets.engaged)
	--sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Tantra Cyclas +2"})
	--sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
	--sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Tantra Cyclas +2"})
	--sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
	--sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Tantra Cyclas +2"})
	--sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
	--sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Tantra Cyclas +2"})

	-- Footwork combat form
	sets.engaged.Footwork = set_combine(sets.engaged, {})
	sets.engaged.Footwork.Acc = sets.engaged.Acc

	sets.engaged.Counterstance = set_combine(sets.engaged, {feet="Hesychast's Gaiters +3"})
	
	-- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
end
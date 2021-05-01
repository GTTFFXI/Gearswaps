-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Counter', 'Hybrid')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'Counter')
    state.PhysicalDefenseMode:options('PDT', 'HP')

	gear.acc = {}
	gear.acc.feet = { name="Ryuo Sune-Ate +1", augments={'STR+12','DEX+12','Accuracy+20',}}
	
	gear.crit = {}
	gear.crit.feet = { name="Ryuo Sune-Ate +1", augments={'STR+12','Attack+25','Crit. hit rate+4%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	
    update_combat_form()
    update_melee_groups()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Mel. Hose +2"}
	sets.precast.JA['Boost'] = {head="Pixie Hairpin +1",body=empty,hands=empty,waist="Ask Sash",legs=empty,feet="Crier's Gaiters"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +3"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +2"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +3"}
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas +3"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +3"}

	sets.precast.JA['Chi Blast'] = {head="Hesychast's Crown"}

	sets.precast.JA['Chakra'] = {
		body="Anchorite's Cyclas +2",hands="Hesychast's Gloves +3",
		feet="Herculean Boots"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		
		body="Anchorite's Cyclas +2",hands="Adhemar Wristbands +1",
		feet="Herculean Boots"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {waist="Chaac Belt"}
	sets.precast.Flourish1 = {waist="Chaac Belt"}


	-- Fast cast sets for spells
	
	sets.precast.FC = {head="Herculean Helm",body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Knobkierrie",
		head="Mpaca's Cap",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Adhemar Jacket +1",hands="Hesychast's Gloves +3",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back="Segomo's Mantle",waist="Moonbow Belt +1",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Kendatsuba Jinpachi +1",ear1="Telos Earring",ear2="Odr Earring",
		body="Tatenashi Haramaki +1",hands="Kendatsuba Tekko +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"
	})
	
	sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
		ear1="Odr Earring",hands="Ryuo Tekko +1",ring2="Begrudging Ring",feet=gear.crit.feet
	})
	sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS['Victory Smite'], {})
	
	sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
		ear2="Odr Earring",waist="Moonbow Belt +1",legs="Jokushu Haidate"})

	sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {waist="Fotia Belt"})	
		
	sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {feet="Anchorite's Gaiters +3"})
	sets.precast.WS['Tornado Kick'] = sets.precast.WS['Dragon Kick']
	sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {ring1=gear.rings.left,ring2=gear.rings.right})
		
	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS, {
		neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Samnuha Coat",hands="Adhemar Wristbands +1",ring1="Acumen Ring",
		back="Toro Cape",waist="Orpheus's Sash"})
	
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Herculean Helm",hands="Leyline Gloves",
		waist="Goading Belt"}
		
	sets.engaged = {ammo="Aurgelmir Orb",
		head="Kendatsuba Jinpachi +1",neck="Monk's Nodowa +2",ear1="Sherida Earring",ear2="Cessance Earring",
		body="Tatenashi Haramaki +1",hands="Kendatsuba Tekko +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back="Segomo's Mantle",waist="Moonbow Belt +1",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}
	
	-- Sets to return to when not performing an action.
	sets.regen = {neck="Bathy Choker +1",ear1="Infused Earring",body="Hizamaru Haramaki +2",ring1="Sheltered Ring",ring2="Defending Ring",legs="Rao Haidate"}

	sets.idle = set_combine(sets.engaged, sets.regen, {head="Malignance Chapeau",hands="Malignance Gloves",ring2="Defending Ring",back="Moonlight Cape",waist="Ask Sash",feet="Crier's Gaiters"})
	
	-- Resting sets
	sets.resting = sets.idle
	
	-- Idle sets
	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Weak = sets.idle
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Loricate Torque +1",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",
		back="Segomo's Mantle",waist="Moonbow Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.HP = {
		head="Herculean Helm",
		body="Anchorite's Cyclas +2",hands="Hesychast's Gloves +3",
		back="Moonlight Cape"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {
		ear1="Etiolation Earring",ring1="Purity Ring",
		})

	sets.Kiting = {feet="Crier's Gaiters"}

	sets.ExtraRegen = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee sets

	sets.engaged.Acc = set_combine(sets.engaged, {ammo="Aurgelmir Orb",ear1="Odr Earring",ear2="Dignitary's Earring",ring1="Niqmaddu Ring",ring2="Regal Ring",waist="Moonbow Belt +1",legs="Anchorite's Hose +2",feet="Anchorite's Gaiters +3"})
		
	sets.engaged.Counter = set_combine(sets.engaged, {body="Hesychast's Cyclas +3",legs="Anchorite's Hose +2",feet="Hesychast's Gaiters +3"})
		
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Mpaca's Cap",body="Malignance Tabard",hands="Malignance Gloves",ring2="Chirich Ring +1",legs="Mpaca's Hose",feet="Nyame Sollerets"
	})

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
	sets.engaged.Footwork = set_combine(sets.engaged, {feet="Anchorite's Gaiters +3"})
	sets.engaged.Footwork.Acc = sets.engaged.Acc

	sets.engaged.Counterstance = set_combine(sets.engaged, {feet="Hesychast's Gaiters +3"})
	
	sets.impetus_body = {body="Bhikku Cyclas +1"}
	-- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
	
	sets.buff.Boost = {waist="Ask Sash"}
	sets.footwork_kick_feet = {feet="Anchorite's Gaiters +3"}
end
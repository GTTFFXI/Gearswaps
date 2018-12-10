function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'MaxDA', 'Hybrid')
    state.WeaponskillMode:options('Normal', 'Acc', 'WSD', 'AccWSD')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')

	gear.melee = {}
	gear.melee.feet = { name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}}
	gear.melee.back = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	
	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.head = { name="Valorous Mask", augments={'Weapon skill damage +4%','STR+4','Accuracy+12','Attack+15',}}
	gear.wsdmg.feet = { name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}}
    gear.wsdmg.back = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	
	update_combat_form()
end


function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.enmity = {ammo="Paeapua",neck="Moonbeam Necklace",ear1="Cryptic Earring",ear2="Friomisi Earring",
		body="Souveran Cuirass",hands="Yorium Gauntlets",ring1="Apeile Ring",ring2="Apeile Ring +1",
		back="Reiki Cloak",waist="Goading Belt",legs="Odyssean Cuisses",feet="Eschite Greaves"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA.Berserk = {body="Pummeler's Lorica +3",feet="Agoge Calligae +1",back=gear.melee.back}
	sets.precast.JA['Aggressor'] = {}
	sets.precast.JA['Provoke'] = sets.enmity
	sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers"}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +1"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +1"}
	sets.precast.JA['Tomahawk'] = {ammo="Throwing Tomahawk"}
	
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
			
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ear2="Loquacious Earring",ring1="Kishar Ring",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
   
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
   	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.Lugra = {ear1="Lugra Earring +1"}
	
	sets.WSD = {ammo="Knobkierrie",head=gear.wsdmg.head,body="Pummeler's Lorica +3",hands="Valorous Mitts",feet="Sulevia's Leggings +2"}
	sets.WSCrit = {ammo="Knobkierrie",head=gear.wsdmg.head,body="Dagon Breastplate",hands="Flamma Manopolas +2",ring1="Begrudging Ring",legs="Lustratio Subligar +1",feet="Thereoid Greaves"}
	
	sets.precast.WS = {ammo="Seething Bomblet +1",
		head="Argosy Celata +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Dagon Breastplate",hands="Argosy Mufflers +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.wsdmg.back,waist="Fotia Belt",legs="Argosy Breeches +1",feet=gear.wsdmg.feet}
	sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, sets.WSD)
	sets.precast.WS['Fell Cleave'] = sets.precast.WS['Scourge']
	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {
		head=gear.acc.head,neck="Fortitude Torque",hands="Sulevia's Gauntlets +2",
		waist="Caudata Belt",legs="Pummeler's Cuisses +3",feet="Pummeler's Calligae +3"})
	
	sets.precast.WS.WSD = set_combine(sets.precast.WS, sets.WSD)
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Pummeler's Lorica +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Pummeler's Cuisses +3",feet="Pummeler's Calligae +3"})
	sets.precast.WS.AccWSD = set_combine(sets.precast.WS.Acc, sets.WSD)
	
	sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, sets.WSCrit)
	sets.precast.WS['Black Halo'] = sets.precast.WS.WSD
	
	sets.precast.WS['Upheaval'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Upheaval'].WSD = set_combine(sets.precast.WS['Upheaval'], sets.WSD)
	sets.precast.WS['Upheaval'].AccWSD = set_combine(sets.precast.WS['Upheaval'].Acc, sets.WSD)
	sets.precast.WS['Scourge'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Scourge'].WSD = set_combine(sets.precast.WS['Scourge'], sets.WSD)
	sets.precast.WS['Scourge'].AccWSD = set_combine(sets.precast.WS['Scourge'].Acc, sets.WSD)
	sets.precast.WS['Fell Cleave'].Acc = sets.precast.WS.Acc
	sets.precast.WS['Fell Cleave'].WSD = set_combine(sets.precast.WS['Fell Cleave'], sets.WSD)
	sets.precast.WS['Fell Cleave'].AccWSD = set_combine(sets.precast.WS['Fell Cleave'].Acc, sets.WSD)
	-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Valorous Mask",ear2="Loquacious Earring",
		ring1="Kishar Ring",
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
		body="Arke Corazza +1",hands="Sulevia's Gauntlets +2",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Arke Cosciales +1",feet="Hermes' Sandals"}

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Twilight = set_combine(sets.idle.Town, sets.Twilight)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Twilight)
	
	-- Defense sets

	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Arke Zuchetto +1",neck="Loricate Torque +1",
		body="Arke Corazza +1",hands="Sulevia's Gauntlets +2",ring2="Defending Ring",
		back="Moonbeam Cape",legs="Arke Cosciales +1" }
	sets.defense.Twilight = set_combine(sets.defense.PDT, sets.Twilight)
	sets.defense.MDT = set_combine(sets.defense.PDT, {})
	
	sets.Kiting = {feet="Hermes' Sandals"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.hybrid = {ammo="Seething Bomblet +1",head="Arke Zuchetto +1",body="Arke Corazza +1",hands="Sulevia's Gauntlets +2",ring2="Defending Ring",legs="Arke Cosciales +1",feet="Pummeler's Calligae +3"}
	
	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Flamma Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Dagon Breastplate",hands="Argosy Mufflers +1",ring1="Niqmaddu Ring",ring2="Petrov Ring",
		back=gear.melee.back,waist="Ioskeha Belt",legs="Odyssean Cuisses",feet=gear.melee.feet}
	sets.engaged.Chango = sets.engaged
	sets.engaged.Chango.Hybrid = set_combine(sets.engaged.Chango, sets.hybrid)
	sets.engaged.Ragnarok = set_combine(sets.engaged, {legs="Argosy Breeches +1",feet="Pummeler's Calligae +3"})
	sets.engaged.Ragnarok.Hybrid = set_combine(sets.engaged.Ragnarok, sets.hybrid)
	sets.engaged.Acc = set_combine(sets.engaged, {
		head=gear.acc.head,neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		body="Dagon Breastplate",hands="Sulevia's Gauntlets +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
		waist="Olseni Belt",legs="Pummeler's Cuisses +3",feet="Pummeler's Calligae +3"})
	sets.engaged.MaxDA = set_combine(sets.engaged, {
		hands="Sulevia's Gauntlets +2",legs="Pummeler's Cuisses +3",feet="Pummeler's Calligae +3"})

	sets.engaged.Ragnarok.Acc = sets.engaged.Acc
	sets.engaged.Ragnarok.MaxDA = sets.engaged.MaxDA
	sets.engaged.Chango.Acc = sets.engaged.Acc
	sets.engaged.Chango.MaxDA = sets.engaged.MaxDA
	
	sets.engaged.Twilight = set_combine(sets.engaged, sets.Twilight)
	sets.engaged.Acc.Twilight = set_combine(sets.engaged.Acc, sets.Twilight)
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end

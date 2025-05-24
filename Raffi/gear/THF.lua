-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Trivial', 'Acc', 'Mod')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

	gear.melee = {}
	gear.melee.hands = { name="Herculean Gloves", augments={'Accuracy+26','"Triple Atk."+3','INT+4','Attack+6',}}
	gear.melee.legs = { name="Herculean Trousers", augments={'Accuracy+24','"Triple Atk."+3','Attack+12',}}
    gear.melee.feet = { name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','STR+4',}}
	
    gear.default.weaponskill_neck = "Combatant's Torque"
    gear.default.weaponskill_waist = "Caudata Belt"
    gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind !- gs c cycle targetmode')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Special sets (required by rules)
	--------------------------------------

	sets.TreasureHunter = {hands="Plunderer's Armlets +1", waist="Chaac Belt",feet="Raid. Poulaines +2"}
	sets.ExtraRegen = {}
	sets.Kiting = {feet="Skadi's Jambeaux +1"}

	sets.buff['Sneak Attack'] = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Sherida Earring",ear2="Mache Earring +1",
		body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back="Toutatis's Cape",waist="Chaac Belt",legs="Samnuha Tights",feet="Rawhide Boots"}

	sets.buff['Trick Attack'] = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Sherida Earring",ear2="Mache Earring +1",
		body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
		back="Toutatis's Cape",waist="Chaac Belt",legs="Samnuha Tights",feet="Rawhide Boots"}
		
	sets.buff["Assassin's Charge"] = {}
		
	-- Actions we want to use to tag TH.
	sets.precast.Step = sets.TreasureHunter
	sets.precast.Flourish1 = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter


	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Collaborator'] = {}
	sets.precast.JA['Accomplice'] = {}
	sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +3"}
	sets.precast.JA['Hide'] = {}
	sets.precast.JA['Conspirator'] = {} -- {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {ammo="Barathrum",neck="Pentalagus Charm",feet="Pillager's Poulaines +3"}
	sets.precast.JA['Despoil'] = {feet="Raider's Poulaines +2"}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
	sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

	sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
	sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		body="Herculean Vest",hands="Plunderer's Armlets +1"
		}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}


	-- Fast cast sets for spells
	sets.precast.FC = {head="Herculean Helm",body="Taeon Tabard",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Kishar Ring",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


	-- Ranged snapshot gear
	sets.precast.RA = {}


	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Meghanada Cuirie +1",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Ilabrat Ring",
		back="Toutatis's Cape",waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Adhemar Bonnet +1",ear1="Telos Earring",ear1="Dignitary's Earring",
		body="Meghanada Cuirie +1",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring"
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,
		{neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",body="Nyame Mail",hands="Adhemar Wristbands +1",ring1="Shiva Ring +1",ring2="Acumen Ring",back="Toro Cape"})

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {ear2="Loquacious Earring",hands="Leyline Gloves"}

	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast

	-- Ranged gear
	sets.midcast.RA = {neck="Combatant's Torque"}
	sets.midcast.RA.Acc = {}


	--------------------------------------
	-- Idle/resting/defense sets
	--------------------------------------

	-- Resting sets
	sets.resting = {neck="Bathy Choker +1",
		ring1="Sheltered Ring",ring2="Defending Ring"}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle = {
		head="Adhemar Bonnet +1",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands=gear.melee.hands,ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Samnuha Tights",feet="Jute Boots +1"}

	sets.idle.HighLvl = set_combine(sets.idle, {})
		
	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle

	-- Defense sets
	sets.defense.Evasion = {
		head="Meghanada Visor +2",neck="Loricate Torque +1",
		body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meghanada Jambeaux +2"}

	sets.defense.PDT = sets.defense.Evasion

	sets.defense.MDT = set_combine(sets.defense.PDT, {ring1="Fortified Ring"})


	--------------------------------------
	-- Melee sets
	--------------------------------------

	-- Normal melee group
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Mache Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands=gear.melee.hands,ring1="Cacoethic Ring +1",ring2="Cacoethic Ring",
		back="Toutatis's Cape",waist="Windbuffet Belt",legs="Samnuha Tights",feet=gear.melee.feet}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged, {
		neck="Combatant's Torque",ear1="Telos Earring",ear2="Dignitary's Earring",
		hands="Adhemar Wristbands +1",ring1="Regal Ring",ring2="Ilabrat Ring",
		back="Toutatis's Cape",waist="Olseni Belt"})

	sets.engaged.Evasion = set_combine(sets.engaged, sets.defense.Evasion)
	sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc, sets.defense.Evasion)

	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)

end
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod', 'Hybrid2')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')


    gear.default.weaponskill_neck = "Combatant's Torque"
    gear.default.weaponskill_waist = "Caudata Belt"
    gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}
	gear.capes = {}
	gear.capes.tp = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.capes.ws = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

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

	sets.TreasureHunter = {hands="Plunderer's Armlets +1", waist="Chaac Belt",feet="Skulker's Poulaines +1"}
	sets.ExtraRegen = {}
	sets.Kiting = {feet="Skadi's Jambeaux +1"}

	sets.buff['Sneak Attack'] = {
		head="Pillager's Bonnet +3",neck="Combatant's Torque",ear1="Sherida Earring",ear2="Odr Earring",
		body="Pillager's Vest +3",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.capes.ws,waist="Chaac Belt",legs="Samnuha Tights",feet="Rawhide Boots"}

	sets.buff['Trick Attack'] = {
		head="Pillager's Bonnet +3",neck="Combatant's Torque",ear1="Sherida Earring",ear2="Odr Earring",
		body="Pillager's Vest +3",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.capes.ws,waist="Chaac Belt",legs="Samnuha Tights",feet="Rawhide Boots"}
		
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
	sets.precast.JA['Flee'] = {feet="Rogue's Poulaines"}
	sets.precast.JA['Hide'] = {body="Pillager's Vest +3"}
	sets.precast.JA['Conspirator'] = {} -- {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {}
	sets.precast.JA['Despoil'] = {feet="Skulker's Poulaines +1"}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
	sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

	sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
	sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		hands="Plunderer's Armlets +1",
		back="Solemnity Cape"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}


	-- Fast cast sets for spells
	sets.precast.FC = {head="Nyame Helm",hands="Leyline Gloves",ring1="Kishar Ring",neck="Baetyl Pendant"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


	-- Ranged snapshot gear
	sets.precast.RA = {}


	-- Weaponskill sets

	sets.engaged = {ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Sherida Earring",ear2="Suppanomimi",
		body="Pillager's Vest +3",hands="Adhemar Wristbands +1",ring1="Gere Ring",ring2="Epona's Ring",
		back=gear.capes.tp,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
	sets.engaged.Trivial = set_combine(sets.engaged, {})
	
	sets.engaged.Acc = set_combine(sets.engaged, {ammo="Yamarang",
		head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Odr Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.capes.tp,waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"})

	sets.engaged.Hybrid = set_combine(sets.engaged, {ammo="Yamarang",
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",ring2="Defending Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	
	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Yetshila +1",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Adhemar Jacket +1",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.capes.ws,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
		head="Nyame Helm",neck="Republican Platinum Medal",body="Nyame Mail",ring1="Epaminondas's Ring",waist="Artful Belt +1"
	})
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Malignance Chapeau",ear1="Telos Earring",ear2="Odr Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Ilabrat Ring"
	})
	sets.precast.WS.Hybrid2 = sets.engaged.Hybrid

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
		head="Nyame Helm",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir Ring",
		back=gear.capes.ws,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"})

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {hands="Leyline Gloves"}

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
		head="Nyame Helm",neck="Republican Platinum Medal",ear1="Infused Earring",ear2="Suppanomimi",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Skadi's Jambeaux +1"}

	sets.idle.HighLvl = set_combine(sets.idle, {})
		
	sets.idle.Town = set_combine(sets.idle, {})
	sets.idle.Weak = sets.idle

	-- Defense sets
	sets.defense.Evasion = {
		head="Nyame Helm",neck="Loricate Torque +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.PDT = sets.defense.Evasion

	sets.defense.MDT = set_combine(sets.defense.PDT, {})


	--------------------------------------
	-- Melee sets
	--------------------------------------

	-- Normal melee group

	
	sets.engaged.Evasion = set_combine(sets.engaged, sets.defense.Evasion)
	sets.engaged.Acc.Evasion = set_combine(sets.engaged.Acc, sets.defense.Evasion)

	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)

end
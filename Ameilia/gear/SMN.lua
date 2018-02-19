-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'lolMeleeSMN')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.AvatarMode:options('Normal', 'Acc')
	
	gear.avatar_legs = {name="Helios Spats", augments={'Pet: Haste+6%','Pet: Accuracy+27 Pet: Rng. Acc.+27','Pet: "Dbl. Atk."+5'}}
	
	gear.capes = {}
	
	gear.capes.timer = {name="Conveyance Cape", augments={'Summoning magic skill +1','Pet: Enmity+11','Blood Pact Dmg.+2','Blood Pact ab. del. II -2',}}
	gear.capes.skill = {name="Conveyance Cape", augments={'Summoning magic skill +5','Blood Pact Dmg.+4','Blood Pact ab. del. II -1',}}
	
	gear.capes.lolMeleeSMN = {name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10'}}
	gear.capes.pet_magic = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','Pet: Haste+10'}}
	gear.capes.pet_phys = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}}
    gear.perp_staff = {name=""}
	send_command('bind ^` gs c cycle AvatarMode')
	send_command('bind !` input /ja Convert <me>')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.max_acc = {head="Convoker's Horn +3",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Lugalbanda Earring",
		body="Convoker's Doublet +3",hands="Convoker's Bracers +3",ring1="Varar Ring +1",ring2="Thurandaut Ring +1",
		back=gear.capes.pet_phys,waist="Regal Belt",legs="Convoker's Spats +3",feet="Convo. Pigaches +3"}

	sets.skill = {main="Kirin's Pole",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Lugalbanda Earring",
		body="Baayami Robe",hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Stikini Ring",
		back=gear.capes.skill,waist="Kobo Obi",legs="Beckoner's Spats +1",feet="Mdk. Crackows +1"}

	sets.idle = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Loquacious Earring",
		body="Witching Robe",hands="Asteria Mitts +1",ring1="Sheltered Ring",ring2="Defending Ring",
		back=gear.capes.pet_phys,waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

	
	sets.idle.Avatar = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Lugalbanda Earring",
		body="Witching Robe",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Thurandaut Ring +1",
		back=gear.capes.pet_phys,waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Convo. Pigaches +3"}

	sets.lolMeleeSMN = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
	    head="Convoker's Horn +3",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
		body="Convoker's Doublet +3",hands="Convoker's Bracers +3",ring1="Cacoethic Ring +1",ring2="Chirich Ring",
		back=gear.capes.lolMeleeSMN,waist="Klouskap Sash",legs="Convoker's Spats +3",feet="Convo. Pigaches +3"}
		
	-- Resting sets
	sets.resting = sets.idle
	
	-- Idle sets

	sets.idle.PDT = sets.idle

	sets.idle.Spirit = sets.idle.Avatar
	sets.idle.Town = set_combine(sets.idle, {})
	
	-- Favor uses Caller's Horn instead of Convoker's Horn for refresh
	sets.idle.Avatar.Favor = set_combine(sets.skill, {
		main="Nirvana",head="Beckoner's Horn +1",ear1="Enmerkar Earring",ear2="Lugalbanda Earring",
		body="Witching Robe",hands="Asteria Mitts +1",
		legs="Assiduity Pants +1"})
	sets.idle.Avatar.Melee = set_combine(sets.idle.Avatar, {ear1="Enmerkar Earring",ear2="Lugalbanda Earring",hands="Convoker's Bracers +3",back=gear.capes.pet_phys,waist="Klouskap Sash",legs=gear.avatar_legs})
	sets.idle.Avatar.Melee.Acc = set_combine(sets.idle.Avatar.Melee, sets.max_acc)
	
	sets.idle.Avatar.Favor.Melee = set_combine(sets.idle.Avatar.Melee, {head="Beckoner's Horn +1"})
	sets.idle.Avatar.Favor.Melee.Acc = 	set_combine(sets.idle.Avatar.Favor.Melee, sets.max_acc)
	
	--------------------------------------
	-- Precast Sets
	--------------------------------------
	
		-- Precast sets to enhance JAs
	sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}	
	
	sets.precast.JA['Elemental Siphon'] = set_combine(sets.skill, {feet="Beckoner's Pigaches +1"})

	sets.precast.JA['Mana Cede'] = {}

	-- Pact delay reduction gear
	sets.precast.BloodPactWard = set_combine(sets.skill, {
		head="Beckoner's Horn +1",ear2="Evans Earring",
		body="Glyphic Doublet +1",hands="Glyphic Bracers +1",
		back=gear.capes.timer,feet="Glyphic Pigaches +1"})
	sets.precast.BloodPactRage = sets.precast.BloodPactWard

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquac. Earring",hands="Repartie Gloves",
		body="Baayami Robe",ring1="Prolix Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Gyve Trousers",feet="Vanya Clogs"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = set_combine(sets.lolMeleeSMN, {neck="Fotia Gorget",waist="Fotia Belt"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Garland of Bliss'] = {
		head="Merlinic Hood",neck="Fotia Gorget",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Merlinic Jubbah",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Acumen Ring",
		back="Toro Cape",waist="Fotia Belt",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

	sets.precast.WS['Myrkr'] = {
		head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Convoker's Doublet +3",hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Sangoma Ring",
		back=gear.capes.skill,waist="Fucho-no-Obi",legs="Beckoner's Spats +1",feet="Beckoner's Pigaches +1"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {
		head="Nahtirah Hat",ear2="Loquac. Earring",hands="Repartie Gloves",
		body="Baayami Robe",waist="Witful Belt",ring1="Prolix Ring"}

	sets.midcast.Cure = {sub="Elan Strap +1",
		head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Loquacious Earring",
		hands="Revealer's Mitts",ring1="Prolix Ring",
		back="Oretania's Cape +1",legs="Gyve Trousers",feet="Vanya Clogs"}

	sets.midcast.Stoneskin = {neck="Incanter's Torque"}
	sets.midcast.Cursna = {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
	
	
	sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid Strap",
		head="Merlinic Hood",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Merlinic Jubbah",hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Acumen Ring",
		back=gear.capes.pet_magic,waist="Chaac Belt",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

	
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Elemental Magic'], {
		ear1="Gwati Earring",ear2="Dignitary's Earring",
		ring1="Stikini Ring",ring2="Sangoma Ring"
	})
	sets.midcast['Dark Magic'] = sets.midcast['Enfeebling Magic']

	
	-- Avatar pact sets.  All pacts are Ability type.
	
	sets.midcast.Pet.BloodPactWard = sets.skill
	sets.midcast.Pet.DebuffBloodPactWard = sets.skill
	
	sets.midcast.Pet.PhysicalBloodPactRage = set_combine(sets.skill, {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Apogee Crown +1",neck="Shulmanu Collar",ear1="Gelos Earring",ear2="Lugalbanda Earring",
		body="Convoker's Doublet +3",hands="Merlinic Dastanas",ring1="Varar Ring +1",ring2="Thurandaut Ring +1",
		back=gear.capes.pet_phys,waist="Regal Belt",legs="Apogee Slacks +1",feet="Convo. Pigaches +3"})

	sets.midcast.Pet.PhysicalBloodPactRageAcc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, sets.max_acc)

	sets.midcast.Pet.MagicalBloodPactRage = set_combine(sets.skill, {main="Espiritus",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Apogee Crown +1",neck="Adad Amulet",ear1="Gelos Earring",ear2="Lugalbanda Earring",
		body="Convoker's Doublet +3",hands="Merlinic Dastanas",ring1="Varar Ring +1",
		back=gear.capes.pet_magic,waist="Regal Belt",legs="Apogee Slacks +1",feet="Convo. Pigaches +3"})

	sets.midcast.Pet.HybridBloodPactRage = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {main="Nirvana",
		ring1="Varar Ring +1",ring2="Thurandaut Ring +1",back=gear.capes.pet_magic,waist="Regal Belt"})
	
	sets.midcast.Pet.HybridBloodPactRageAcc = set_combine(sets.midcast.Pet.HybridBloodPactRage, {
		head="Convoker's Horn +3",neck="Incanter's Torque",
		body="Convoker's Doublet +3",hands="Convoker's Bracers +3",ring1="Varar Ring +1",ring2="Thurandaut Ring +1",
		back=gear.capes.pet_magic,waist="Regal Belt",legs="Convoker's Spats +3",feet="Convo. Pigaches +3"})
	
	-- Spirits cast magic spells, which can be identified in standard ways.
	
	sets.midcast.Pet.WhiteMagic = {}
	
	sets.midcast.Pet['Elemental Magic'] = sets.midcast.Pet.MagicalBloodPactRage

	sets.midcast.Pet['Elemental Magic'].Resistant = {}
	

	sets.perp = sets.idle.Avatar
	sets.perp.Alexander = sets.midcast.Pet.BloodPactWard
	
	-- Defense sets
	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {feet="Crier's Gaiters"}
	
	sets.latent_refresh = {}
	

	--------------------------------------
	-- Engaged sets
	--------------------------------------
	
	-- Normal melee group

	sets.engaged = sets.idle.Avatar.Melee
	sets.engaged.lolMeleeSMN = sets.lolMeleeSMN
end
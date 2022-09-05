-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'lolMeleeSMN')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.AvatarMode:options('Normal', 'Acc')
	
	gear.avatar_legs = {name="Helios Spats", augments={'Pet: Haste+6%','Pet: Accuracy+27 Pet: Rng. Acc.+27','Pet: "Dbl. Atk."+5'}}
	
	gear.hands = {}
	
	gear.hands.magical = { name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+27','Blood Pact Dmg.+10','Pet: DEX+10','Pet: Mag. Acc.+9',}}
    gear.hands.physical = { name="Merlinic Dastanas", augments={'Pet: Attack+28 Pet: Rng.Atk.+28','Blood Pact Dmg.+10','Pet: Mag. Acc.+15','Pet: "Mag.Atk.Bns."+15',}}

	gear.rings = {}
	gear.rings.left={name="Varar Ring +1", bag="wardrobe2"}
    gear.rings.right={name="Varar Ring +1", bag="wardrobe3"}
	gear.rings.StikLeft={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.StikRight={name="Stikini Ring +1", bag="wardrobe4"}
	
	gear.capes = {}
	
	gear.capes.lolMeleeSMN = {name="Campestres's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10'}}
	gear.capes.pet_magic = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Magic Damage+10','Pet: Haste+10'}}
	gear.capes.pet_phys = { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}}
    gear.perp_staff = {name=""}
	send_command('bind ^` gs c cycle AvatarMode')
	send_command('bind !` input /ja Convert <me>')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.max_acc = {head="Convoker's Horn +3",neck="Summoner's Collar +2",ear1="Lugalbanda Earring",ear2="Beckoner's Earring",
		body="Convoker's Doublet +3",hands="Convoker's Bracers +3",ring1=gear.rings.left,ring2=gear.rings.right,
		back=gear.capes.pet_phys,waist="Regal Belt",legs="Convoker's Spats +3",feet="Convo. Pigaches +3"}

	sets.skill = {main="Kirin's Pole",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",neck="Incanter's Torque",ear1="Cath Palug Earring",ear2="Andoaa Earring",
		body="Baayami Robe",hands="Baayami Cuffs",ring1="Evoker's Ring",ring2=gear.rings.StikRight,
		back="Conveyance Cape",waist="Kobo Obi",legs="Baayami Slops",feet="Baayami Sabots"}

	sets.idle = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2",neck="Republican Platinum Medal",ear1="Cath Palug Earring",ear2="Beckoner's Earring",
		body="Amalric Doublet +1",hands="Asteria Mitts +1",ring1=gear.rings.StikLeft,ring2="Defending Ring",
		back=gear.capes.pet_phys,waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

	
	sets.idle.Avatar = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2",neck="Summoner's Collar +2",ear1="Cath Palug Earring",ear2="Beckoner's Earring",
		body="Amalric Doublet +1",hands="Asteria Mitts +1",ring1=gear.rings.StikLeft,ring2=gear.rings.right,
		back=gear.capes.pet_phys,waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Convo. Pigaches +3"}

	sets.lolMeleeSMN = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
	    head="Nyame Helm",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Cacoethic Ring +1",ring2="Chirich Ring +1",
		back=gear.capes.lolMeleeSMN,waist="Klouskap Sash +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	-- Resting sets
	sets.resting = sets.idle
	
	-- Idle sets

	sets.idle.PDT = sets.idle

	sets.idle.Spirit = sets.idle.Avatar
	sets.idle.Town = set_combine(sets.idle, {})
	
	-- Favor uses Caller's Horn instead of Convoker's Horn for refresh
	sets.idle.Avatar.Favor = set_combine(sets.skill, {
		main="Nirvana",head="Beckoner's Horn +2",ear1="Cath Palug Earring",ear2="Beckoner's Earring",
		body="Amalric Doublet +1",hands="Asteria Mitts +1",
		legs="Assiduity Pants +1"})
	sets.idle.Avatar.Melee = set_combine(sets.idle.Avatar, {neck="Summoner's Collar +2",ear1="Cath Palug Earring",ear2="Beckoner's Earring",hands="Convoker's Bracers +3",back=gear.capes.pet_phys,waist="Klouskap Sash +1",legs="Apogee Slacks +1"})
	sets.idle.Avatar.Melee.Acc = set_combine(sets.idle.Avatar.Melee, sets.max_acc)
	
	sets.idle.Avatar.Favor.Melee = set_combine(sets.idle.Avatar.Melee, {head="Beckoner's Horn +2"})
	sets.idle.Avatar.Favor.Melee.Acc = 	set_combine(sets.idle.Avatar.Favor.Melee, sets.max_acc)
	
	--------------------------------------
	-- Precast Sets
	--------------------------------------
	
		-- Precast sets to enhance JAs
	sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +3"}	
	
	sets.precast.JA['Elemental Siphon'] = set_combine(sets.skill, {ammo="Esper Stone +1",feet="Beckoner's Pigaches +1"})

	sets.precast.JA['Mana Cede'] = {}

	-- Pact delay reduction gear
	sets.precast.BloodPactWard = set_combine(sets.skill, {
		head="Beckoner's Horn +2",ear2="Evans Earring",
		body="Glyphic Doublet +3",hands="Glyphic Bracers +3",
		back="Conveyance Cape",feet="Glyphic Pigaches +3"})
	sets.precast.BloodPactRage = sets.precast.BloodPactWard

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="Cath Palug Crown",neck="Baetyl Pendant",ear2="Malignance Earring",
		body="Baayami Robe",ring1="Kishar Ring",ring2="Veneficium Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",back="Pahtli Cape",legs="Gyve Trousers",feet="Vanya Clogs"})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = set_combine(sets.lolMeleeSMN, {ammo="Oshasha's Treatise",head="Nyame Helm",neck="Fotia Gorget",body="Nyame Mail",hands="Nyame Gauntlets",waist="Fotia Belt",ring1="Epaminondas's Ring",legs="Nyame Flanchard",feet="Nyame Sollerets"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Garland of Bliss'] = {
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Acumen Ring",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Myrkr'] = {
		head="Beckoner's Horn +2",neck="Baetyl Pendant",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Convoker's Doublet +3",hands="Baayami Cuffs",ring1="Evoker's Ring",ring2=gear.rings.right,
		back="Conveyance Cape",waist="Fucho-no-Obi",legs="Amalric Slops +1",feet="Beckoner's Pigaches +1"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {
		head="Cath Palug Crown",ear2="Malignance Earring",
		body="Baayami Robe",waist="Embla Sash",ring1="Kishar Ring"}

	sets.midcast.Cure = {sub="Elan Strap +1",
		head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Inyanga Dastanas +2",ring1=gear.rings.StikLeft,ring2=gear.rings.StikRight,
		back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}

	sets.midcast.Stoneskin = {neck="Incanter's Torque"}
	sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
	
	
	sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Khonsu",
		head="Cath Palug Crown",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamorph Ring +1",ring2="Acumen Ring",
		back=gear.capes.pet_magic,waist="Chaac Belt",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		ear1="Gwati Earring",
		hands="Nyame Gauntlets",ring1=gear.rings.StikLeft,ring2=gear.rings.StikRight,
		waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})

	
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Elemental Magic'], {
		ear1="Crepuscular Earring",ear2="Malignance Earring",
		ring1=gear.rings.StikLeft,ring2=gear.rings.StikRight
	})
	sets.midcast['Dark Magic'] = sets.midcast['Enfeebling Magic']

	
	-- Avatar pact sets.  All pacts are Ability type.
	
	sets.midcast.Pet.BloodPactWard = sets.skill
	sets.midcast.Pet.DebuffBloodPactWard = sets.skill
	
	sets.midcast.Pet.PhysicalBloodPactRage = set_combine(sets.skill, {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Helios Band",neck="Summoner's Collar +2",ear1="Lugalbanda Earring",ear2="Beckoner's Earring",
		body="Glyphic Doublet +3",hands=gear.hands.physical,ring1=gear.rings.left,ring2=gear.rings.right,
		back=gear.capes.pet_phys,waist="Incarnation Sash",legs="Apogee Slacks +1",feet="Convoker's Pigaches +3"})

	sets.midcast.Pet.PhysicalBloodPactRageAcc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, sets.max_acc)

	sets.midcast.Pet.MagicalBloodPactRage = set_combine(sets.skill, {main="Espiritus",sub="Elan Strap +1",ammo="Sancus Sachet +1",
		head="Cath Palug Crown",neck="Summoner's Collar +2",ear1="Lugalbanda Earring",ear2="Beckoner's Earring",
		body="Convoker's Doublet +3",hands=gear.hands.magical,ring1=gear.rings.left,
		back=gear.capes.pet_magic,waist="Regal Belt",legs="Apogee Slacks +1",feet="Convo. Pigaches +3"})

	sets.midcast.Pet.HybridBloodPactRage = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {main="Nirvana",
		body="Glyphic Doublet +3",hands=gear.hands.physical,ring1=gear.rings.left,ring2=gear.rings.right,back=gear.capes.pet_magic,waist="Regal Belt"})
	
	sets.midcast.Pet.HybridBloodPactRageAcc = set_combine(sets.midcast.Pet.HybridBloodPactRage, {
		head="Convoker's Horn +3",neck="Incanter's Torque",
		body="Convoker's Doublet +3",hands="Convoker's Bracers +3",ring1=gear.rings.left,ring2=gear.rings.right,
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
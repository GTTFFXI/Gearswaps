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
	sets.max_acc = {head="Beckoner's Horn +3",neck="Summoner's Collar +2",ear1="Lugalbanda Earring",ear2="Beckoner's Earring +1",
		body="Glyphic Doublet +3",hands="Convoker's Bracers +3",ring1=gear.rings.left,ring2=gear.rings.right,
		back=gear.capes.pet_phys,waist="Regal Belt",legs="Baayami Slops +1",feet="Beckoner's Pigaches +2"}

	sets.skill = {main="Kirin's Pole",sub="Elan Strap +1",ammo="Epitaph",
		head="Beckoner's Horn +3",neck="Incanter's Torque",ear1="Cath Palug Earring",ear2="Andoaa Earring",
		body="Baayami Robe +1",hands="Baayami Cuffs +1",ring1="Evoker's Ring",ring2=gear.rings.StikRight,
		back="Conveyance Cape",waist="Kobo Obi",legs="Baayami Slops +1",feet="Baayami Sabots +1"}

	sets.idle = {main="Nirvana",sub="Elan Strap +1",ammo="Epitaph",
		head="Beckoner's Horn +3",neck="Republican Platinum Medal",ear1="Cath Palug Earring",ear2="Beckoner's Earring +1",
		body="Apogee Dalmatica +1",hands="Asteria Mitts +1",ring1=gear.rings.StikLeft,ring2="Defending Ring",
		back=gear.capes.pet_phys,waist="Null Belt",legs="Assiduity Pants +1",feet="Crier's Gaiters"}

	
	sets.idle.Avatar = {main="Nirvana",sub="Elan Strap +1",ammo="Epitaph",
		head="Beckoner's Horn +3",neck="Summoner's Collar +2",ear1="Cath Palug Earring",ear2="Beckoner's Earring +1",
		body="Apogee Dalmatica +1",hands="Asteria Mitts +1",ring1=gear.rings.StikLeft,ring2=gear.rings.right,
		back=gear.capes.pet_phys,waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Bunzi's Sabots"}

	sets.lolMeleeSMN = {main="Nirvana",sub="Elan Strap +1",ammo="Epitaph",
	    head="Bunzi's Hat",neck="Null Loop",ear1="Crepuscular Earring",ear2="Dignitary's Earring",
		body="Nyame Mail",hands="Bunzi's Gloves",ring1="Lehko's Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Klouskap Sash +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	-- Resting sets
	sets.resting = set_combine(sets.idle, {})
	
	-- Idle sets

	sets.idle.PDT = set_combine(sets.idle, {})

	sets.idle.Spirit = set_combine(sets.idle.Avatar, {})
	sets.idle.Town = set_combine(sets.idle, {})
	
	-- Favor uses Caller's Horn instead of Convoker's Horn for refresh
	sets.idle.Avatar.Favor = set_combine(sets.skill, {
		main="Nirvana",head="Beckoner's Horn +3",ear1="Cath Palug Earring",ear2="Beckoner's Earring +1",
		body="Apogee Dalmatica +1",hands="Asteria Mitts +1",
		legs="Assiduity Pants +1"})
	sets.idle.Avatar.Melee = set_combine(sets.idle.Avatar, {neck="Summoner's Collar +2",ear1="Cath Palug Earring",ear2="Beckoner's Earring +1",hands="Convoker's Bracers +3",back=gear.capes.pet_phys,waist="Klouskap Sash +1",legs="Apogee Slacks +1"})
	sets.idle.Avatar.Melee.Acc = set_combine(sets.idle.Avatar.Melee, sets.max_acc)
	
	sets.idle.Avatar.Favor.Melee = set_combine(sets.idle.Avatar.Melee, {head="Beckoner's Horn +3"})
	sets.idle.Avatar.Favor.Melee.Acc = 	set_combine(sets.idle.Avatar.Favor.Melee, sets.max_acc)
	
	--------------------------------------
	-- Precast Sets
	--------------------------------------
	
		-- Precast sets to enhance JAs
	sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +3"}	
	
	sets.precast.JA['Elemental Siphon'] = set_combine(sets.skill, {feet="Beckoner's Pigaches +2"})

	sets.precast.JA['Mana Cede'] = {}

	-- Pact delay reduction gear
	sets.precast.BloodPactWard = set_combine(sets.skill, {
		head="Beckoner's Horn +3",hands="Glyphic Bracers +3"})
	sets.precast.BloodPactRage = set_combine(sets.precast.BloodPactWard, {})

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="Merlinic Hood",neck="Baetyl Pendant",ear2="Malignance Earring",
		body="Baayami Robe +1",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Volte Brais",feet="Regal Pumps +1"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC)

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendicant's Earring",legs="Gyve Trousers",feet="Vanya Clogs"})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = set_combine(sets.lolMeleeSMN, {ammo="Oshasha's Treatise",head="Nyame Helm",neck="Fotia Gorget",body="Nyame Mail",hands="Nyame Gauntlets",waist="Fotia Belt",ring1="Epaminondas's Ring",legs="Nyame Flanchard",feet="Nyame Sollerets"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Garland of Bliss'] = {
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Weatherspoon Ring +1",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Myrkr'] = {
		head="Beckoner's Horn +3",neck="Summoner's Collar +2",ear1="Mendicant's Earring",ear2="Andoaa Earring",
		body="Glyphic Doublet +3",hands="Regal Cuffs",ring1="Evoker's Ring",ring2="Metamorph Ring +1",
		back="Conveyance Cape",waist="Acuity Belt +1",legs="Baayami Slops +1",feet="Beckoner's Pigaches +2"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {
		head="Cath Palug Crown",ear2="Malignance Earring",
		body="Baayami Robe +1",waist="Embla Sash",ring1="Kishar Ring"}

	sets.midcast.Cure = {sub="Elan Strap +1",
		head="Vanya Hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Inyanga Dastanas +2",ring1=gear.rings.StikLeft,ring2=gear.rings.StikRight,
		back="Solemnity Cape",legs="Gyve Trousers",feet="Vanya Clogs"}

	sets.midcast.Stoneskin = {neck="Incanter's Torque"}
	sets.midcast.Cursna = {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring",back="Oretania's Cape +1",feet="Vanya Clogs"}
	sets.midcast['Enhancing Magic'] = {
		head="Telchine Cap",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Andoaa Earring",
        body="Telchine Chasuble",hands="Inyanga Dastanas +2",ring1=gear.rings.left,ring2=gear.rings.right,
        waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"
	}
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast['Elemental Magic'] = {
		head="Cath Palug Crown",neck="Incanter's Torque",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Volte Jupon",hands="Bunzi's Gloves",ring1="Metamorph Ring +1",ring2="Acumen Ring",
		back=gear.capes.pet_magic,waist="Chaac Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		ear1="Dignitary's Earring",
		hands="Nyame Gauntlets",ring1=gear.rings.StikLeft,ring2=gear.rings.StikRight,
		waist="Null Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"
	})

	
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Elemental Magic'], {
		ear1="Crepuscular Earring",ear2="Malignance Earring",
		ring1=gear.rings.StikLeft,ring2=gear.rings.StikRight
	})
	sets.midcast['Dark Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

	
	-- Avatar pact sets.  All pacts are Ability type.
	
	sets.midcast.Pet.BloodPactWard = set_combine(sets.skill, {})
	sets.midcast.Pet.DebuffBloodPactWard = set_combine(sets.skill, {})
	
	sets.midcast.Pet.PhysicalBloodPactRage = set_combine(sets.skill, {main="Nirvana",sub="Elan Strap +1",ammo="Epitaph",
		head="Helios Band",neck="Summoner's Collar +2",ear1="Lugalbanda Earring",ear2="Beckoner's Earring +1",
		body="Glyphic Doublet +3",hands=gear.hands.physical,ring1="Cath Palug Ring",ring2=gear.rings.right,
		back=gear.capes.pet_phys,waist="Incarnation Sash",legs="Apogee Slacks +1",feet="Helios Boots"})

	sets.midcast.Pet.PhysicalBloodPactRageAcc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, sets.max_acc)

	sets.midcast.Pet.MagicalBloodPactRage = set_combine(sets.skill, {main="Grioavolr",sub="Elan Strap +1",ammo="Epitaph",
		head="Cath Palug Crown",neck="Summoner's Collar +2",ear1="Lugalbanda Earring",ear2="Beckoner's Earring +1",
		body="Apogee Dalmatica +1",hands=gear.hands.magical,ring1=gear.rings.left,ring2=gear.rings.right,
		back=gear.capes.pet_magic,waist="Regal Belt",legs="Enticer's Pants",feet="Apogee Pumps +1"})

	sets.midcast.Pet.HybridBloodPactRage = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {main="Nirvana",
		body="Glyphic Doublet +3",hands=gear.hands.physical,ring1=gear.rings.left,ring2=gear.rings.right,back=gear.capes.pet_magic,waist="Regal Belt"})
	
	sets.midcast.Pet.HybridBloodPactRageAcc = set_combine(sets.midcast.Pet.HybridBloodPactRage, {
		head="Beckoner's Horn +3",neck="Incanter's Torque",
		body="Glyphic Doublet +3",hands="Convoker's Bracers +3",ring1=gear.rings.left,ring2=gear.rings.right,
		back=gear.capes.pet_magic,waist="Regal Belt",legs="Baayami Slops +1",feet="Beckoner's Pigaches +2"})
	
	-- Spirits cast magic spells, which can be identified in standard ways.
	
	sets.midcast.Pet.WhiteMagic = {}
	
	sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {})

	sets.midcast.Pet['Elemental Magic'].Resistant = {}
	

	sets.perp = set_combine(sets.idle.Avatar, {})
	sets.perp.Alexander = set_combine(sets.midcast.Pet.BloodPactWard, {})
	
	-- Defense sets
	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {feet="Crier's Gaiters"}
	
	sets.latent_refresh = {}
	

	--------------------------------------
	-- Engaged sets
	--------------------------------------
	
	-- Normal melee group

	sets.engaged = set_combine(sets.idle.Avatar.Melee, {})
	sets.engaged.lolMeleeSMN = set_combine(sets.lolMeleeSMN, {})
end
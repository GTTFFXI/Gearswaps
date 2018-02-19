-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc', 'SuperAcc')
	state.WeaponskillMode:options('Normal', 'Acc')
	
	gear.default.weaponskill_neck = "Ocachi Gorget"
	gear.default.weaponskill_waist = "Elanid Belt"

	gear.rng = {}
	
	gear.rng.head = {name="Herculean Helm", augments={'Rng.Acc.+25 Rng.Atk.+25','Weapon skill damage +1%','Rng.Acc.+12',}}
    gear.rng.hands = {name="Herculean Gloves", augments={'Rng.Acc.+21 Rng.Atk.+21','Sklchn.dmg.+2%','Rng.Acc.+15',}}
    gear.rng.legs = {name="Herculean Trousers", augments={'Rng.Acc.+19 Rng.Atk.+19','Crit.hit rate+2','Rng.Acc.+14','Rng.Atk.+14',}}
    gear.rng.feet = {name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Sklchn.dmg.+4%','Rng.Acc.+14',}}
	
	DefaultAmmo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Annihilator'] = "Achiyalabopa bullet"}
	U_Shot_Ammo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Annihilator'] = "Achiyalabopa bullet"}

	send_command('bind f9 gs c cycle RangedMode')
	send_command('bind ^f9 gs c cycle OffenseMode')
end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {hands="Amini Glovelettes +1", waist="Chaac Belt"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {}
	sets.precast.JA['Sharpshot'] = {}
	sets.precast.JA['Velocity Shot'] = {head="Amini Gapette +1"}


	-- Fast cast sets for spells

	sets.precast.FC = {head="Carmine Mask +1",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Prolix Ring",legs="Gyve Trousers",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Amini Gapette +1",
		body="Amini Caban +1",hands="Iuitl Wristbands +1",ring2="Cacoethic Ring +1",
		back="Lutian Cape",waist="Impulse Belt",legs="Nahtirah Trousers",feet="Meghanada Jambeaux +2"}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Arcadian beret +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Amini Caban +1",hands=gear.rng.hands,ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back="Belenus's Cape",waist="Fotia Belt",legs=gear.rng.legs,feet=gear.rng.feet }

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head=gear.rng.head,
		body="Meghanada Cuirie +2",ring1="Hajduk Ring +1",ring2="Cacoethic Ring +1",
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Jishnu's Radiance"] = set_combine(sets.precast.WS, {head="Meghanada Visor +2",ear1="Sherida Earring"})

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Arcadian Beret +1",ear1="Loquacious Earring",
		ring1="Prolix Ring",
		legs="Arc. Braccae +1",feet="Orion Socks +1"}

	sets.midcast.Utsusemi = {}

	-- Ranged sets

	sets.midcast.RA = {
		head="Arcadian Beret +1",neck="Iskur Gorget",ear1="Telos earring",ear2="Enervating Earring",
		body="Amini Caban +1",hands=gear.rng.hands,ring1="Hajduk Ring +1",ring2="Cacoethic Ring +1",
		back="Belenus's Cape",waist="Eschan Stone",legs=gear.rng.legs,feet=gear.rng.feet}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{neck="Iskur Gorget",ear1="Telos Earring",waist="Eschan Stone"})

	sets.midcast.RA.SuperAcc = set_combine(sets.midcast.RA.Acc,
		{head="Meghanada Visor +2",body="Meghanada Cuirie +2"})

		
	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA)

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc)

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {ear1="Telos Earring",ring2="Chirich Ring"})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {ear1="Telos Earring"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Oce. Headpiece +1",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Amini Caban +1",hands=gear.rng.hands,ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Carmine Cuisses +1",feet=gear.rng.feet}
	sets.idle.Town = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {
		head="Dampening Tam",neck="Loricate Torque +1",
		body="Orion Jerkin +1",hands="Arc. Bracers +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}

	sets.defense.MDT = {
		head="Arcadian Beret +1",neck="Loricate Torque +1",
		body="Orion Jerkin +1",hands="Arc. Bracers +1",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}

	sets.Kiting = {feet="Skd. Jambeaux +1"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = sets.midcast.RA
	sets.engaged.Acc = sets.midcast.RA.Acc

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {})
	sets.buff.Camouflage = {body="Orion Jerkin +1"}
end
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc', 'SuperAcc')
	state.WeaponskillMode:options('Normal', 'Acc')
	
	gear.default.weaponskill_neck = "Iskur Gorget"
	gear.default.weaponskill_waist = "Elanid Belt"

	elementalObiWS = {
		["Trueflight"] = {element="Light"},
		["Wildfire"] = {element="Fire"}
	}

	
	gear.melee = {}
    gear.melee.hands = { name="Herculean Gloves", augments={'Attack+17','"Triple Atk."+4','AGI+5','Accuracy+15',}}
    gear.melee.feet = { name="Herculean Boots", augments={'Accuracy+29','"Triple Atk."+4',}}
	
	gear.rng = {}
    gear.rng.hands = {name="Herculean Gloves", augments={'Rng.Acc.+21 Rng.Atk.+21','Sklchn.dmg.+2%','Rng.Acc.+15',}}
    gear.rng.legs = {name="Herculean Trousers", augments={'Rng.Acc.+19 Rng.Atk.+19','Crit.hit rate+2','Rng.Acc.+14','Rng.Atk.+14',}}
    gear.rng.feet = {name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Sklchn.dmg.+4%','Rng.Acc.+14',}}

	gear.mab = {}
	gear.mab.head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+20','Weapon skill damage +4%','INT+5','Mag. Acc.+12',}}
    gear.mab.legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +3%','"Mag.Atk.Bns."+2',}}
    gear.mab.feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+12',}}

	
	DefaultAmmo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Annihilator'] = "Achiyalabopa bullet", ['Fomalhaut'] = "Chrono Bullet"}
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
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +2"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +2"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +2"}
	sets.precast.JA['Sharpshot'] = {}
	sets.precast.JA['Velocity Shot'] = {head="Amini Gapette +1"}


	-- Fast cast sets for spells

	sets.precast.FC = {head="Carmine Mask +1",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Kishar Ring",legs="Gyve Trousers",neck="Orunmila's Torque"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Amini Gapette +1",
		body="Amini Caban +1",hands="Carmine Finger Gauntlets +1",ring2="Regal Ring",
		back="Belenus's Cape",waist="Yemaya Belt",legs="Nahtirah Trousers",feet="Meghanada Jambeaux +2"}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Amini Caban +1",hands="Meghanada Gloves +2",ring1="Dingir Ring",ring2="Regal Ring",
		back="Belenus's Cape",waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Meghanada Jambeaux +2" }

	sets.precast.WS['Wildfire'] = {
		head=gear.mab.head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Herculean Vest",hands="Carmine Finger Gauntlets +1",ring1="Dingir Ring",ring2="Regal Ring",
        back=gear.rng.back,waist="Eschan Stone",legs=gear.mab.legs,feet=gear.mab.feet}
	sets.precast.WS["Trueflight"] = sets.precast.WS['Wildfire']
	sets.precast.WS["Hot Shot"] = sets.precast.WS['Wildfire']
		
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		head="Meghanada Visor +2",
		body="Meghanada Cuirie +2",ring1="Cacoethic Ring +1",ring2="Regal Ring",
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Jishnu's Radiance"] = set_combine(sets.precast.WS, {head="Meghanada Visor +2",ear1="Sherida Earring"})

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Arcadian Beret +1",ear1="Loquacious Earring",
		ring1="Kishar Ring",
		legs="Arc. Braccae +1",feet="Orion Socks +2"}

	sets.midcast.Utsusemi = {}

	-- Ranged sets

	sets.midcast.RA = {
		head="Arcadian Beret +1",neck="Iskur Gorget",ear1="Telos earring",ear2="Enervating Earring",
		body="Amini Caban +1",hands="Meghanada Gloves +2",ring1="Dingir Ring",ring2="Regal Ring",
		back="Belenus's Cape",waist="Yemaya Belt",legs="Meghanada Chausses +2",feet="Orion Socks +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{neck="Iskur Gorget",ear1="Telos Earring",ring1="Cacoethic Ring +1",waist="Eschan Stone"})

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
		head="Meghanada Visor +2",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Amini Caban +1",hands="Meghanada Gloves +2",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Carmine Cuisses +1",feet="Meghanada Jambeaux +2"}
	sets.idle.Town = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {
		head="Meghanada Visor +2",neck="Loricate Torque +1",
		body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Meghanada Jambeaux +2"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {
		ring1="Fortified Ring"})

	sets.Kiting = {feet="Skd. Jambeaux +1"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back="Belenus's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.melee.feet}
	
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Carmine Mask +1",ear2="Dignitary's Earring",
		ring1="Cacoethic Ring +1",ring2="Chirich Ring",
		waist="Olseni Belt",legs="Carmine Cuisses +1"
	})
	
	sets.WeatherObi = {waist="Hachirin-no-obi"}
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +2"})
	sets.buff.Camouflage = {body="Orion Jerkin +2"}
end

function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' then
		obiws = elementalObiWS[spell.english]
		if obiws then
			if (world.weather_element == obiws.element or world.day_element == obiws.element) then
				equip(sets.WeatherObi)
			end
		end
	end	
end
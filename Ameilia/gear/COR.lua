function user_setup()
    state.OffenseMode:options('Ranged', 'Melee', 'Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Storm')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Chrono Bullet"
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 15
	
	elementalObiWS = {
		["Leaden Salute"] = {element="Dark"},
		["Wildfire"] = {element="Fire"}
	}

	gear.melee = {}
	gear.melee.body = { name="Herculean Vest", augments={'Accuracy+22 Attack+22','"Triple Atk."+3','STR+7',}}
    gear.melee.hands = { name="Herculean Gloves", augments={'Attack+17','"Triple Atk."+4','AGI+5','Accuracy+15',}}
    gear.melee.feet = { name="Herculean Boots", augments={'Accuracy+29','"Triple Atk."+4',}}
	gear.melee.back = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	
	gear.mab = {}
    gear.mab.legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +3%','"Mag.Atk.Bns."+2',}}
    gear.mab.feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+12',}}
	
	gear.rng = {}
	gear.rng.head = {name="Herculean Helm", augments={'Rng.Acc.+25 Rng.Atk.+25','Weapon skill damage +1%','Rng.Acc.+12',}}
    gear.rng.hands = {name="Herculean Gloves", augments={'Rng.Acc.+21 Rng.Atk.+21','Sklchn.dmg.+2%','Rng.Acc.+15',}}
    gear.rng.legs = {name="Herculean Trousers", augments={'Rng.Acc.+19 Rng.Atk.+19','Crit.hit rate+2','Rng.Acc.+14','Rng.Atk.+14',}}
    gear.rng.feet = {name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Sklchn.dmg.+4%','Rng.Acc.+14',}}
	gear.rng.back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Double-up" <me>')
    send_command('bind !` gs c toggle LuzafRing')
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands=gear.melee.hands,ring1="Hetairoi Ring",ring2="Epona's Ring",
		back=gear.melee.back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.melee.feet}
	
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    
    sets.precast.CorsairRoll = {head="Lanun Tricorne",hands="Chasseur's Gants +1",ring1="Barataria Ring",back=gear.rng.back}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +2"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Whirlpool Mask",
        body="Iuitl Vest",hands="Iuitl Wristbands",
        legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {head="Carmine Mask +1",ear2="Loquacious Earring",ring1="Prolix Ring",neck="Orunmila's Torque"}
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {ammo=gear.RAbullet,
		hands="Iuitl Wristbands +1",ring2="Cacoethic Ring +1",
		waist="Impulse Belt",legs="Nahtirah Trousers",feet="Meghanada Jambeaux +2"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo=gear.WSbullet,
		head=gear.rng.head,neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
		body="Meghanada Cuirie +2",hands=gear.rng.hands,ring1="Ifrit Ring +1",ring2="Rufescent Ring",
		back=gear.rng.back,waist="Fotia Belt",legs=gear.rng.legs,feet=gear.rng.feet }

	sets.meleeWS = set_combine(sets.engaged, {
		neck="Fotia Gorget",waist="Fotia Belt"
	})	
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = sets.meleeWS
    sets.precast.WS['Exenterator'] = sets.meleeWS
    sets.precast.WS['Requiescat'] = sets.meleeWS
	sets.precast.WS['Savage Blade'] = sets.meleeWS
	
    sets.precast.WS['Last Stand'] = sets.precast.WS

    sets.precast.WS['Last Stand'].Acc = sets.precast.WS

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		head=gear.rng.head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Samnuha Coat",hands="Carmine Finger Gauntlets +1",ring1="Acumen Ring",ring2="Garuda Ring",
        back=gear.rng.back,waist="Eschan Stone",legs=gear.mab.legs,feet=gear.mab.feet}
	sets.precast.WS['Wildfire'].Storm = set_combine(sets.precast.WS['Wildfire'], {waist="Hachirin-no-obi"})

    sets.precast.WS['Wildfire'].Brew = sets.precast.WS['Wildfire']
    
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {
		head="Pixie Hairpin +1",ear2="Moonshade Earring",ring1="Archon Ring"
	})
	sets.precast.WS['Leaden Salute'].Storm = set_combine(sets.precast.WS['Leaden Salute'], {waist="Hachirin-no-obi"})
    
	sets.precast.CorsairShot = set_combine(sets.precast.WS['Wildfire'], {
		ammo=gear.QDbullet,head="Laksamana's Hat +1",feet="Chasseur's Bottes +1"})
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",
        body="Iuitl Vest",hands="Iuitl Wristbands",
        legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = set_combine(sets.precast.WS['Wildfire'], {
		ammo=gear.QDbullet,head="Laksamana's Hat +1",feet="Chasseur's Bottes +1"})
    sets.midcast.CorsairShot.Acc = sets.midcast.CorsairShot

    sets.midcast.CorsairShot['Light Shot'] = sets.midcast.CorsairShot

    sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot


    -- Ranged gear
	sets.midcast.RA = {ammo=gear.RAbullet,
		head=gear.rng.head,neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		body="Meghanada Cuirie +2",hands=gear.rng.hands,ring1="Hajduk Ring +1",ring2="Cacoethic Ring +1",
		back=gear.rng.back,waist="Eschan Stone",legs=gear.rng.legs,feet=gear.rng.feet}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA)
    
    -- Sets to return to when not performing an action.
    
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Oce. Headpiece +1",neck="Bathy Choker +1",ear1="Telos Earring",ear2="Infused Earring",
		body="Meghanada Cuirie +2",hands=gear.rng.hands,ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet=gear.rng.feet}
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
    

    sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Carmine Mask +1",ear2="Dignitary's Earring",
		ring1="Cacoethic Ring +1",ring2="Chirich Ring",
		waist="Olseni Belt",legs="Carmine Cuisses +1"
	})
	
	sets.WeatherObi = {waist="Hachirin-no-obi"}
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

function job_post_midcast(spell, action, spellMap, eventArgs)
	--obi only affects damage, not accuracy
	if spell.type == 'CorsairShot' and spell.english ~= 'Dark Shot' and spell.english ~= 'Light Shot' then
		if spell.element == world.weather_element or spell.element == world.day_element then 
			equip(sets.WeatherObi)
		end
	end
end
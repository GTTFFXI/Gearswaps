function user_setup()
    state.OffenseMode:options('Ranged', 'Melee', 'Acc', 'Hybrid')
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
    gear.melee.hands = { name="Herculean Gloves", augments={'Accuracy+26','"Triple Atk."+3','INT+4','Attack+6',}}
	gear.melee.legs = { name="Herculean Trousers", augments={'Accuracy+24','"Triple Atk."+3','Attack+12',}}
    gear.melee.feet = { name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','STR+4',}}
	gear.melee.back = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	
	gear.mab = {}
	gear.mab.hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+10',}}
    gear.mab.legs={ name="Herculean Trousers", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Weapon skill damage +4%','"Mag.Atk.Bns."+11',}}
    gear.mab.feet={ name="Herculean Boots", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','Weapon skill damage +5%','"Mag.Atk.Bns."+10',}}
	
	gear.rng = {}
	gear.rng.head = {name="Herculean Helm", augments={'Rng.Acc.+25 Rng.Atk.+25','Weapon skill damage +1%','Rng.Acc.+12',}}
    gear.rng.hands = {name="Herculean Gloves", augments={'Rng.Acc.+21 Rng.Atk.+21','Sklchn.dmg.+2%','Rng.Acc.+15',}}
    gear.rng.legs = {name="Herculean Trousers", augments={'Rng.Acc.+19 Rng.Atk.+19','Crit.hit rate+2','Rng.Acc.+14','Rng.Atk.+14',}}
    gear.rng.feet = {name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Sklchn.dmg.+4%','Rng.Acc.+14',}}
	gear.rng.back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Double-up" <me>')
    send_command('bind !` eh cycle')
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Sanctity Necklace",ear1="Mache Earring",ear2="Cessance Earring",
		body="Adhemar Jacket +1",hands=gear.melee.hands,ring1="Cacoethic Ring +1",ring2="Cacoethic Ring",
		back=gear.melee.back,waist="Windbuffet Belt",legs=gear.melee.legs,feet=gear.melee.feet}
	
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    
    sets.precast.CorsairRoll = {head="Lanun Tricorne",neck="Regal Necklace",hands="Chasseur's Gants +1",ring1="Barataria Ring",back="Camulus's Mantle"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne +2"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {legs="Nahtirah Trousers"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {head="Carmine Mask +1",ear2="Loquacious Earring",ring1="Kishar Ring",neck="Orunmila's Torque"}
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


    sets.precast.RA = {ammo=gear.RAbullet,
		head="Chasseur's Tricorne",body="Laksamana's Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Cacoethic Ring +1",
		waist="Yemaya Belt",legs="Nahtirah Trousers",feet="Meghanada Jambeaux +2"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo=gear.WSbullet,
		head="Meghanada Visor +1",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Moonshade Earring",
		body="Laksamana's Frac +3",hands="Meghanada Gloves +2",ring1="Garuda Ring",ring2="Garuda Ring",
		back=gear.rng.back,waist="Fotia Belt",legs="Meghanada Chausses +1",feet="Meghanada Jambeaux +2" }

	

	sets.meleeWS = set_combine(sets.engaged, {
		neck="Fotia Gorget",waist="Fotia Belt",ring1="Regal Ring",ring2="Ilabrat Ring"
	})	
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = sets.meleeWS
    sets.precast.WS['Exenterator'] = sets.meleeWS
    sets.precast.WS['Requiescat'] = sets.meleeWS
	sets.precast.WS['Swift Blade'] = sets.meleeWS
	sets.precast.WS['Savage Blade'] = set_combine(sets.meleeWS, {waist="Grunfeld Rope"})
	
    sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

    sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS, {head="Malignance Chapeau",hands="Malignance Gloves",legs="Malignance Tights",ring1="Cacoethic Ring +1",ring2="Cacoethic Ring"})

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Novio Earring",
        body="Laksamana's Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Garuda Ring",ring2="Garuda Ring",
        back=gear.rng.back,waist="Sveltesse Gouriz +1",legs=gear.mab.legs,feet=gear.mab.feet}
	sets.precast.WS['Wildfire'].Storm = set_combine(sets.precast.WS['Wildfire'], {waist="Hachirin-no-obi"})

    sets.precast.WS['Wildfire'].Brew = sets.precast.WS['Wildfire']
    
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {
		head="Pixie Hairpin +1",ear2="Moonshade Earring",waist="Sveltesse Gouriz +1"
	})
	sets.precast.WS['Leaden Salute'].Storm = set_combine(sets.precast.WS['Leaden Salute'], {waist="Hachirin-no-obi"})
    
	sets.precast.CorsairShot = set_combine(sets.precast.WS['Wildfire'], {
		ammo=gear.QDbullet,head="Laksamana's Hat +1",feet="Lanun Bottes +3"})
    
    -- Midcast Sets
    sets.midcast.FastRecast = {head="Carmine Mask +1"}
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.precast.CorsairShot = set_combine(sets.precast.WS['Wildfire'], {
		ammo=gear.QDbullet,head="Laksamana's Hat +1",feet="Chasseur's Bottes +1"})
    sets.precast.CorsairShot.Acc = sets.precast.CorsairShot

    sets.precast.CorsairShot['Light Shot'] = set_combine(sets.precast.CorsairShot, {
		head="Mummu Bonnet +2",ear1="Gwati Earring",ear2="Dignitary's Earring",body="Mummu Jacket +2",hands="Mummu Wrists +2",legs="Mummu Kecks +2",feet="Mummu Gamashes +2"
	})

    sets.precast.CorsairShot['Dark Shot'] = sets.precast.CorsairShot['Light Shot']

	sets.midcast.CorsairShot = sets.precast.CorsairShot
	sets.midcast.CorsairShot['Light Shot'] = sets.precast.CorsairShot['Light Shot']
	sets.midcast.CorsairShot['Dark Shot'] = sets.precast.CorsairShot['Dark Shot']

    -- Ranged gear
	sets.midcast.RA = {ammo=gear.RAbullet,
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
		body="Laksamana's Frac +3",hands="Malignance Gloves",ring1="Cacoethic Ring +1",ring2="Cacoethic Ring",
		back=gear.rng.back,waist="Eschan Stone",legs="Malignance Tights",feet="Meghanada Jambeaux +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {ring2="Cacoethic Ring"})
    
    -- Sets to return to when not performing an action.
    
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Malignance Chapeau",neck="Loricate Torque",ear1="Telos Earring",ear2="Infused Earring",
		body="Enforcer's Harness",hands="Malignance Gloves",ring1="Sheltered Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Lanun Bottes +3"}
	sets.idle.Town = set_combine(sets.idle, {})
	
    -- Defense sets
	sets.defense.PDT = {
		head="Malignance Chapeau",neck="Loricate Torque",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Patricius Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Malignance Tights",feet="Lanun Bottes +3"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {
		ring1="Fortified Ring"})
    

    sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Carmine Mask +1",ear2="Dignitary's Earring",
		hands="Meghanada Gloves +2",ring1="Cacoethic Ring +1",ring2="Chirich Ring",
		waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Meghanada Jambeaux +2"
	})
	sets.engaged.Hybrid = {    
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet={ name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','STR+4',}},
		neck="Sanctity Necklace",
		waist="Windbuffet Belt",
		left_ear="Mache Earring",
		right_ear="Cessance Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Cacoethic Ring",
		back="Moonbeam Cape"}
		
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
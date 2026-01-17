
function user_setup()
    state.OffenseMode:options('Ranged', 'Melee', 'Acc', 'Crit', 'Hybrid', 'EP')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Storm')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.Buff['Triple Shot'] = buffactive['Triple Shot'] or false

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet"
    gear.QDbullet = "Living Bullet"
	gear.rollingRostam = { name="Rostam", augments={'Path: C',}}
    options.ammo_warning_limit = 15
	
	elementalObiWS = {
		["Leaden Salute"] = {element="Dark"},
		["Wildfire"] = {element="Fire"}
	}

	gear.melee = {}
    gear.melee.feet = { name="Herculean Boots", augments={'Accuracy+29','"Triple Atk."+4',}}
	gear.melee.back = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.melee.wsback = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
	gear.mab = {}
    gear.mab.feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','Mag. Acc.+12',}}
	gear.mab.back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	
	gear.rng = {}
    gear.rng.feet = {name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Sklchn.dmg.+4%','Rng.Acc.+14',}}
	gear.rng.back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}

	gear.snapshot = {}
	gear.snapshot.back = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}

	gear.crit = {}
	gear.crit.back= { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}

	
    -- Additional local binds
    send_command('bind ^` input /ja "Double-up" <me>')
    send_command('bind !` eh cycle')
end

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.engaged = {
		head="Adhemar Bonnet +1",neck="Null Loop",ear1="Dedition Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Lehko's Ring",ring2="Epona's Ring",
		back="Null Shawl",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.melee.feet}
	
    -- Precast Sets

    -- Precast sets to enhance JAs
    
    sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +3"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +3"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +4"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    
    sets.precast.CorsairRoll = {main=gear.rollingRostam,head="Lanun Tricorne +3",neck="Regal Necklace",hands="Chasseur's Gants +2",back=gear.rng.back}
    
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +3"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne +2"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +3"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    
    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +4"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {head="Herculean Helm",neck="Baetyl Pendant",
		body="Nyame Mail",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		feet="Carmine Greaves +1"}
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


    sets.precast.RA = {ammo=gear.RAbullet,
		head="Ikenga's Hat",neck="Commodore Charm +2",body="Ikenga's Vest",hands="Lanun Gants +4",ring1="Crepuscular Ring",
		back=gear.snapshot.back,waist="Yemaya Belt",legs="Oshosi Trousers +1",feet="Meghanada Jambeaux +2"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo=gear.WSbullet,
		head="Nyame Helm",neck="Commodore Charm +2",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Ikenga's Vest",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir Ring",
		back=gear.rng.back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Lanun Bottes +4" }

	sets.meleeWS = set_combine(sets.engaged, {
		head="Nyame Helm",neck="Republican Platinum Medal",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Ilabrat Ring",
		back=gear.melee.wsback,waist="Fotia Belt",legs="Nyame Flanchard",waist="Fotia Belt",feet="Nyame Sollerets"
	})	
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = set_combine(sets.meleeWS, {neck="Fotia Gorget",ear1="Odr Earring"})
    sets.precast.WS['Exenterator'] = set_combine(sets.meleeWS, {neck="Fotia Gorget"})
    sets.precast.WS['Requiescat'] = set_combine(sets.meleeWS, {})
	sets.precast.WS['Swift Blade'] = set_combine(sets.meleeWS, {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.meleeWS, {
		neck="Commodore Charm +2",ear1="Ishvara Earring",ring1="Epaminondas's Ring",ring2="Sroda Ring",waist="Sailfi Belt +1"
	})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {
		neck="Null Loop",ear1="Odr Earring",ring1="Chirich Ring +1",ring2="Regal Ring",waist="Null Belt"
	})
	
    sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {ring1="Regal Ring"})

    sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS, {neck="Null Loop"})

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		head="Nyame Helm",neck="Commodore Charm +2",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Lanun Frac +3",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=gear.mab.back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
	sets.precast.WS['Wildfire'].Storm = set_combine(sets.precast.WS['Wildfire'], {waist="Hachirin-no-obi"})

    sets.precast.WS['Wildfire'].Brew = set_combine(sets.precast.WS['Wildfire'], {})
	
	sets.precast.WS['Hot Shot'] = set_combine(sets.precast.WS['Wildfire'], {neck="Fotia Gorget",ear2="Moonshade Earring",body="Nyame Mail"})
    
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {
		head="Pixie Hairpin +1",ear2="Moonshade Earring",body="Lanun Frac +3",waist="Orpheus's Sash"
	})
	sets.precast.WS['Leaden Salute'].Storm = set_combine(sets.precast.WS['Leaden Salute'], {waist="Orpheus's Sash"})
    
    -- Midcast Sets
    sets.midcast.FastRecast = {head="Herculean Helm"}
        
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

    sets.precast.CorsairShot = set_combine(sets.precast.WS['Wildfire'], {
		ammo=gear.QDbullet,body="Lanun Frac +3",ring1="Acumen Ring",legs="Nyame Flanchard",feet="Chasseur's Bottes +3"})
    sets.precast.CorsairShot.Acc = set_combine(sets.precast.CorsairShot, {neck="Null Loop"})

    sets.precast.CorsairShot['Light Shot'] = set_combine(sets.precast.CorsairShot, {
		head="Malignance Chapeau",neck="Null Loop",ear1="Dignitary's Earring",ear2="Crepuscular Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",legs="Malignance Tights",feet="Malignance Boots"
	})

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})

	sets.midcast.CorsairShot = set_combine(sets.precast.CorsairShot, {})
	sets.midcast.CorsairShot['Light Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})
	sets.midcast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Dark Shot'], {})

    -- Ranged gear
	sets.midcast.RA = {ammo=gear.RAbullet,
		head="Ikenga's Hat",neck="Commodore Charm +2",ear1="Dedition Earring",ear2="Crepuscular Earring",
		body="Nisroch Jerkin",hands="Ikenga's Gloves",ring1="Lehko's Ring",ring2="Dingir Ring",
		back=gear.rng.back,waist="Tellen Belt",legs="Ikenga's Trousers",feet="Ikenga's Clogs"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {neck="Null Loop",back="Null Shawl"})
    
	--crit fishing
	sets.midcast.RA.Armageddon = set_combine(sets.midcast.RA, {})
	sets.midcast.RA.AM = set_combine(sets.midcast.RA, {
		head="Meghanada Visor +2",neck="Commodore Charm +2",ear1="Odr Earring",ear2="Chasseur's Earring +1",
		body="Nisroch Jerkin",hands="Chasseur's Gants +2",ring1="Lehko's Ring",ring2="Begrudging Ring",
		back=gear.crit.back,waist="Kwahu Kachina Belt +1",legs="Mummu Kecks +2",feet="Oshosi Leggings +1"
	})
	
    -- Sets to return to when not performing an action.
    
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Null Masque",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Sheltered Ring",ring2="Murky Ring",
		back=gear.crit.back,waist="Null Belt",legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
	sets.idle.Town = set_combine(sets.idle, {})
	
    -- Defense sets
	sets.defense.PDT = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",
		legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = set_combine(sets.defense.PDT, {})
    

    sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group

	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Null Masque",ear1="Odr Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring2="Chirich Ring +1",
		waist="Null Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"
	})
	sets.engaged.Hybrid = set_combine(sets.engaged, {
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",ring2="Murky Ring",legs="Malignance Tights",feet="Malignance Boots"
	})
	sets.engaged.Crit = set_combine(sets.engaged,{
		head="Mummu Bonnet +2",ear1="Odr Earring",body="Mummu Jacket +2",hands="Mummu Wrists +2",legs="Mummu Kecks +2",feet="Mummu Gamashes +2"
	})
	
	sets.engaged.EP = set_combine(sets.engaged, {
		head="Malignance Chapeau",legs="Malignance Tights",feet="Malignance Boots"
	})
	
	sets.WeatherObi = {waist="Hachirin-no-obi"}
	
	sets.assault = {ammo="Staunch Tathlum +1",
		head=empty,neck="Null Loop",ear1="Alabaster Earring",ear2="Infused Earring",
		body=empty,hands=empty,ring1="Defending Ring",ring2="Murky Ring",
		back=gear.crit.back,waist="Bullwhip Belt",legs=empty,feet=empty}
	
	sets.buff['Triple Shot'] = {head="Oshosi Mask +1",body="Chasseur's Frac +3",hands="Lanun Gants +4",legs="Oshosi Trousers +1",feet="Oshosi Leggings +1"}
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
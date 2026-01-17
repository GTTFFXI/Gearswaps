-- Define sets and vars used by this job file.
function init_gear_sets()
	gear.melee = {}
	gear.melee.back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.melee.stpback = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.melee.feet = { name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}}
	gear.melee.legs = { name="Valor. Hose", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+4','STR+8','Accuracy+13','Attack+5',}}

	gear.acc = {}
	gear.acc.head = { name="Valorous Mask", augments={'Accuracy+25 Attack+25','STR+10','Accuracy+15','Attack+6',}}
    
	gear.wsdmg = {}
	gear.wsdmg.back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.wsdmg.feet = { name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}}
	gear.wsdmg.vitback = { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

	gear.rings={}
	gear.rings.left={name="Stikini Ring +1", bag="wardrobe"}
    gear.rings.right={name="Stikini Ring +1", bag="wardrobe4"}
	

	sets.HP = {head="Hjarrandi Helm",neck="Unmoving Collar +1",ear1="Alabaster Earring",ear2="Tuisto Earring",
		body="Hjarrandi Breastplate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Meridian Ring",
		back="Moonlight Cape",waist="Platinum Moogle Belt",legs="Volte Tights",feet="Ratri Sollerets +1"}
	
	sets.precast.FC = {head="Sakpata's Helm",neck="Baetyl Pendant",ear1="Malignance Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Weatherspoon Ring +1",ring2="Lebeche Ring",
		waist="Ioskeha Belt +1",feet="Odyssean Greaves"}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +4"}
	sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +3"}
	sets.precast.JA['Diabolic Eye'] = {body="Fallen's Finger Gauntlets +3"}
	sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets +3"}
	sets.precast.JA['Nether Void'] = {legs="Heathen's Flanchard +1"}
	sets.precast.JA['Souleater'] = {head="Ignominy Burgeonet +3"}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Last Resort'] = {back=gear.wsdmg.back,feet="Fallen's Sollerets +3"}
	
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	sets.Lugra = {}
	
	sets.WSMAcc = {
		head="Heathen's Burgeonet +3",neck="Null Loop",ear1="Crepuscular Earring",ear2="Heathen's Earring +1",
		body="Crepuscular Mail",hands="Sakpata's Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",waist="Null Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"
	}
	
	sets.precast.WS = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back="Null Shawl",waist="Fotia Belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.WSD = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear2="Heathen's Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Sroda Ring",
		back=gear.wsdmg.back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	sets.ScytheWSD = set_combine(sets.WSD, {head="Heathen's Burgeonet +3"})
	sets.PDL = {head="Heathen's Burgeonet +3",neck="Abyssal Beads +2",ear2="Heathen's Earring +1",ring2="Sroda Ring"}
	sets.precast.WS.PDL = set_combine(sets.precast.WS, sets.PDL)
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ear1="Crepuscular Earring",ear2="Dignitary's Earring",
		ring1="Niqmaddu Ring",ring2="Regal Ring",
		legs="Nyame Flanchard"})
	
	sets.precast.WS['Armor Break'] = set_combine(sets.WSMAcc, {})
	sets.precast.WS['Shield Break'] = set_combine(sets.WSMAcc, {})
	sets.precast.WS['Weapon Break'] = set_combine(sets.WSMAcc, {})
	
	-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Entropy'] = set_combine(sets.ScytheWSD, {})
	sets.precast.WS['Insurgency'] = set_combine(sets.ScytheWSD, {ear1="Moonshade Earring"})
	sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Resolution'] = set_combine(sets.WSD, {head="Heathen's Burgeonet +3",waist="Fotia Belt"})
	sets.precast.WS['Resolution'].PDL = set_combine(sets.precast.WS['Resolution'], sets.PDL)
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Torcleaver'] = set_combine(sets.WSD, {ear2="Heathen's Earring +1",back=gear.wsdmg.vitback})
	sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Torcleaver'].Hybrid = set_combine(sets.precast.WS['Torcleaver'], {body="Nyame Mail",legs="Nyame Flanchard"})
	sets.precast.WS['Torcleaver'].PDL = set_combine(sets.precast.WS['Torcleaver'], sets.PDL)
	sets.precast.WS['Torcleaver'].Subtle = set_combine(sets.precast.WS['Torcleaver'], sets.PDL, {body="Founder's Breastplate"}) --,waist="Pipilaka Belt"

--	sets.precast.WS['Torcleaver'].Subtle = set_combine(sets.precast.WS['Torcleaver'].Hybrid, {
--		ear2="Dignitary's Earring",
--		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
--		feet="Sakpata's Leggings"
--	})

	sets.precast.WS['Scourge'] = set_combine(sets.WSD, {})
	sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Scourge'].PDL = set_combine(sets.precast.WS['Scourge'], sets.PDL)
	
	sets.precast.WS['Cross Reaper'] = set_combine(sets.ScytheWSD)
	sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Cross Reaper'].PDL = set_combine(sets.precast.WS['Cross Reaper'], sets.PDL)
	sets.precast.WS['Quietus'] = set_combine(sets.precast.WS['Cross Reaper'], {})
	sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS['Cross Reaper'].Acc, {})
	sets.precast.WS['Quietus'].PDL = set_combine(sets.precast.WS['Quietus'], sets.PDL)
	sets.precast.WS['Origin'] = set_combine(sets.precast.WS['Cross Reaper'], {})
	sets.precast.WS['Origin'].Acc = set_combine(sets.precast.WS['Cross Reaper'].Acc, {})
	sets.precast.WS['Origin'].PDL = set_combine(sets.precast.WS['Origin'], sets.PDL)
	sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS['Cross Reaper'], {})
	sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS['Cross Reaper'].Acc,{})
	sets.precast.WS['Catastrophe'].PDL = set_combine(sets.precast.WS['Catastrophe'], sets.PDL)
	sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS['Cross Reaper'], {})
	sets.precast.WS['Spiral Hell'].PDL = set_combine(sets.precast.WS['Spiral Hell'], sets.PDL)

	sets.precast.WS['Judgment'] = set_combine(sets.WSD, {})
	sets.precast.WS['Judgment'].PDL = set_combine(sets.precast.WS['Judgment'], sets.PDL)
	sets.precast.WS['Black Halo'] = set_combine(sets.WSD, {})
	sets.precast.WS['Black Halo'].PDL = set_combine(sets.precast.WS['Black Halo'], sets.PDL)

	sets.precast.WS['Steel Cyclone'] = set_combine(sets.WSD, {})
	sets.precast.WS['Steel Cyclone'].Hybrid = set_combine(sets.precast.WS['Torcleaver'].Hybrid, {})
	sets.precast.WS['Steel Cyclone'].PDL = set_combine(sets.precast.WS['Steel Cyclone'], sets.PDL)
	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS['Torcleaver'], {})
	sets.precast.WS['Upheaval'].Hybrid = set_combine(sets.precast.WS['Torcleaver'].Hybrid, {})
	sets.precast.WS['Upheaval'].PDL = set_combine(sets.precast.WS['Upheaval'], sets.PDL)

	sets.precast.WS['Savage Blade'] = set_combine(sets.WSD, {})
	sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], sets.PDL)
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Sakpata's Helm",ear1="Malignance Earring",
		body="Sacro Breastplate",ring1="Kishar Ring",
		feet="Nyame Sollerets"}
	
	sets.midcast['Dark Magic'] = {head="Ignominy Burgeonet +3",neck="Erra Pendant",ear1="Malignance Earring",ear2="Crepuscular Earring",
		body="Carmine Scale Mail +1",hands="Fallen's Finger Gauntlets +3",ring1="Evanescence Ring",ring2="Archon Ring",
		back="Niht Mantle",waist="Null Belt",legs="Nyame Flanchard",feet="Ratri Sollerets +1"
	}
	
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {head="Fallen's Burgeonet +4",legs="Heathen's Flanchard +1"})
	
	sets.midcast.Aspir = set_combine(sets.midcast['Dark Magic'], {})
	
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {head="Ignominy Burgeonet +3",back="Ankou's Mantle"})
	
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
		head="Heathen's Burgeonet +3",neck="Null Loop",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1=gear.rings.left,ring2=gear.rings.right,
		back="Null Shawl",waist="Ioskeha Belt +1",feet="Sakpata's Leggings"
	})
	
	sets.midcast['Elemental Magic'] = {
		head="Nyame Helm",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Acumen Ring",
		back="Toro Cape",waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"
	}
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,neck="Null Loop",body="Crepuscular Cloak",back="Null Shawl"})
	sets.midcast['Dread Spikes'] = set_combine(sets.HP, {})
	
	-- any ninjutsu cast on self
	sets.midcast.SelfNinjutsu = set_combine(sets.midcast.FastRecast, {})

	-- any ninjutsu cast on enemies
	sets.midcast.Ninjutsu = {}

	--sets.midcast.Ninjutsu.Resistant = {}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {ammo="Coiste Bodhar",
		head="Valorous Mask",neck="Republican Platinum Medal",ear1="Alabaster Earring",ear2="Infused Earring",
		head="Null Masque",body="Crepuscular Mail",hands="Sakpata's Gauntlets",ring1=gear.rings.left,ring2="Murky Ring",
		back=gear.wsdmg.back,waist="Null Belt",legs="Carmine Cuisses +1",feet="Sakpata's Leggings"}

	sets.idle.Town = set_combine(sets.idle, {})	
	sets.idle.Twilight = set_combine(sets.idle.Town, sets.Twilight)
	sets.idle.Weak = set_combine(sets.idle.Town, sets.Twilight)

	-- Defense sets

	sets.defense.PDT = {
		head="Null Masque",ear1="Alabaster Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring2="Murky Ring",
		legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.defense.Twilight = set_combine(sets.defense.PDT, sets.Twilight)
	sets.defense.MDT = set_combine(sets.defense.PDT, {})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Coiste Bodhar",
		head="Hjarrandi Helm",neck="Abyssal Beads +2",ear1="Crepuscular Earring",ear2="Schere Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Lehko's Ring",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Flamma Gambieras +2"}
	sets.engaged.Ragnarok = set_combine(sets.engaged, {})
	sets.engaged.Caladbolg = set_combine(sets.engaged,{})
	sets.engaged.Liberator = set_combine(sets.engaged, {ear2="Schere Earring"})
	sets.engaged.Redemption = set_combine(sets.engaged, {ear2="Schere Earring"})
	sets.engaged.Foenaria = set_combine(sets.engaged, {ear2="Schere Earring"})
	
	sets.engaged.Scythe = set_combine(sets.engaged, {ear2="Schere Earring"})
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Ignominy Burgeonet +3",neck="Null Loop",ear1="Crepuscular Earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring2="Regal Ring",
		waist="Ioskeha Belt +1",feet="Flamma Gambieras +2"})

	sets.engaged.Subtle = {
		head="Sakpata's Helm",neck="Bathy Choker +1",ear1="Crepuscular Earring",ear2="Dignitary's Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"	
	}
		
	sets.engaged.Ragnarok.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Caladbolg.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Scythe.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Liberator.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Redemption.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.Foenaria.Acc = set_combine(sets.engaged.Acc, {})

	sets.engaged.Caladbolg.AM = set_combine(sets.engaged.Caladbolg, {
		ammo="Yetshila +1",body="Dagon Breastplate",ring2="Lehko's Ring"
	})
	
	sets.engaged.Caladbolg.Subtle = set_combine(sets.engaged.Caladbolg, {
		head="Sakpata's Helm",neck="Bathy Choker +1",ear1="Crepuscular Earring",ear2="Dignitary's Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"
	})
	
	sets.engaged.Caladbolg.Subtle.AM = set_combine(sets.engaged.Caladbolg.Subtle, {})
	
	sets.engaged.Caladbolg.Acc.AM = set_combine(sets.engaged.Acc, {})
	sets.engaged.Caladbolg.Hybrid = set_combine(sets.engaged.Caladbolg, sets.defense.PDT)
	sets.engaged.Caladbolg.Schere = set_combine(sets.engaged.Caladbolg, sets.defense.PDT, {ear1="Schere Earring"})

	sets.engaged.Caladbolg.AM = set_combine(sets.engaged.Caladbolg, {
		ammo="Yetshila +1",body="Dagon Breastplate",ring2="Lehko's Ring"
	})
	
	sets.engaged.Redemption.Subtle = set_combine(sets.engaged.Redemption, {
		head="Sakpata's Helm",neck="Bathy Choker +1",ear1="Crepuscular Earring",ear2="Schere Earring",
		body="Dagon Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"
	})
	
	sets.engaged.Redemption.Subtle.AM = set_combine(sets.engaged.Redemption.Subtle, {})
	
	sets.engaged.Redemption.Acc.AM = set_combine(sets.engaged.Acc, {})
	sets.engaged.Redemption.Hybrid = set_combine(sets.engaged.Redemption, sets.defense.PDT)
	sets.engaged.Redemption.Schere = set_combine(sets.engaged.Redemption, sets.defense.PDT, {ear1="Schere Earring"})
	sets.engaged.Redemption.AM = set_combine(sets.engaged.Redemption, {
		ammo="Yetshila +1",body="Dagon Breastplate",ring2="Lehko's Ring"
	})


	sets.engaged.Liberator.AM = set_combine(sets.engaged.Liberator, {
		ear2="Crepuscular Earring",
		body="Hjarrandi Breastplate",ring1="Chirich Ring +1",
		back="Null Shawl",waist="Gerdr Belt +1",legs="Volte Tights",
	})
	
	sets.engaged.Liberator.Subtle = set_combine(sets.engaged.Caladbolg.Subtle, {})
	sets.engaged.Liberator.Subtle.AM = set_combine(sets.engaged.Liberator.Subtle, {})
	sets.engaged.Liberator.Acc.AM = set_combine(sets.engaged.Acc, {})
	sets.engaged.Liberator.Hybrid = set_combine(sets.engaged.Liberator, sets.defense.PDT)

	sets.engaged.Foenaria.Subtle = set_combine(sets.engaged.Redemption.Subtle, {})
	sets.engaged.Foenaria.Hybrid = set_combine(sets.engaged.Foenaria, sets.defense.PDT)
	
	sets.engaged.Hybrid = set_combine(sets.engaged, sets.defense.PDT, {ring1="Moonlight Ring",ring2="Chirich Ring +1"})

	sets.engaged.Ragnarok.Hybrid = set_combine(sets.engaged.Ragnarok, sets.defense.PDT)
	sets.engaged.Scythe.Hybrid = set_combine(sets.engaged.Scythe, sets.defense.PDT)
	
	sets.engaged.Twilight = set_combine(sets.engaged, sets.Twilight)
	sets.engaged.Acc.Twilight = set_combine(sets.engaged.Acc, sets.Twilight)
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
end

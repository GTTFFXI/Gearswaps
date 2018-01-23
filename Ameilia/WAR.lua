-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end
 
-- //gs debugmode
-- //gs showswaps
 
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
                 
    update_combat_form()
end
 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()
-- Precast sets
    sets.precast.JA['Berserk'] = {feet="Agoge Calligae +1",body="Pummeler's Lorica +1",back="Cichol's Mantle"}
    sets.precast.JA['Warcry'] = {head="Agoge Mask +1"}
    sets.precast.JA['Aggressor'] = {body="Agoge Lorica +1",head="Pummeler's Mask +1"}
    sets.precast.JA['Blood Rage'] = {body="Boii Lorica +1"}
    sets.precast.JA['Retaliation'] = {feet="Boii Calligae +1",hands="Pummeler's Mufflers +1"}
    sets.precast.JA['Restraint'] = {hands="Boii Mufflers +1"}
    sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers +1"}
    sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses +1"}
    sets.precast.JA['Provoke'] = {
        head="Pummeler's Mask +1", body="Souveran Cuirass",
        back="Reiki Cloak", neck="Unmoving Collar +1",
        hands="Pummeler's Mufflers +1", waist="Trance Belt",
        legs="Odyssean Cuisses", feet="Souveran Schuhs",
        Ring1="Petrov Ring", Ring2="Apeile Ring",
        ear1="Enchanter Earring +1", ear2="Gwati Earring"
    }
 
-- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Sapience Orb",
        head="Carmine Mask +1", body={ name="Odyss. Chestplate", augments={'Mag. Acc.+21','"Fast Cast"+6',}},
        back=Ank_STP, neck="Orunmila's Torque",
        hands={ name="Leyline Gloves", augments={'Accuracy+1','Mag. Acc.+5','"Mag.Atk.Bns."+5','"Fast Cast"+1',}}, waist="Tempus Fugit",
        legs="Eschite Cuisses", feet={ name="Odyssean Greaves", augments={'Mag. Acc.+9','"Fast Cast"+5','INT+6',}},
        ring1="Prolix Ring", ring2="Rahab Ring",
        ear1="Etiolation Earring", ear2="Loquacious Earring"}
     
    -- Midcast Sets
    sets.midcast.FastRecast = {
        ammo="Sapience Orb",
        head="Carmine Mask +1", body={ name="Odyss. Chestplate", augments={'Mag. Acc.+21','"Fast Cast"+6',}},
        back=Ank_STP, neck="Orunmila's Torque",
        hands="Leyline Gloves", waist="Tempus Fugit",
        legs="Eschite Cuisses", feet={ name="Odyssean Greaves", augments={'Mag. Acc.+9','"Fast Cast"+5','INT+6',}},
        ring1="Prolix Ring", ring2="Rahab Ring",
        ear1="Etiolation Earring", ear2="Loquacious Earring"}
         
    sets.midcast.Flash = {
        head="Pummeler's Mask +1", body="Souveran Cuirass",
        back="Reiki Cloak", neck="Unmoving Collar +1",
        hands="Pummeler's Mufflers +1", waist="Trance Belt",
        legs="Odyssean Cuisses", feet="Souveran Schuhs",
        Ring1="Petrov Ring", Ring2="Apeile Ring",
        ear1="Enchanter Earring +1", ear2="Gwati Earring"
    }
         
    -- Resting sets
    sets.resting = {
        ammo="Ginsen",
        head="", body="Lugra Cloak +1",
        back="Xucau Mantle", neck="Sanctity Necklace",
        hands="Sulevia's Gauntlets +1", waist="Flume Belt +1",
        legs="Carmine Cuisses +1",feet="Amm Greaves",
        ring1="Paguroidea Ring", ring2="Chirich Ring +1",
        ear1="Infused Earring", ear2="Genmei Earring"}
 
-- Idle sets
    sets.idle = {
        ammo="Brigantia Pebble",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Dawn Earring",
    left_ring="Paguroidea Ring",
    right_ring="Chirich Ring +1",
    back="Xucau Mantle",
    }
 
    sets.idle.PDT = {
        ammo="Brigantia Pebble",
        head="Sulevia's Mask +1", body="Sulevia's Platemail +1",
        back="Xucau Mantle", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +1", waist="Flume Belt +1",
        legs="Sulevia's Cuisses +1", feet="Amm Greaves",
        ring1="Defending Ring", ring2={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -5%',}},
        ear1="Odnowa Earring +1", ear2="Genmei Earring"}
 
    sets.idle.Town = {
        ammo="Brigantia Pebble",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Dawn Earring",
    left_ring="Paguroidea Ring",
    right_ring="Chirich Ring +1",
    back="Xucau Mantle",
    }
 
    sets.idle.Weak = {
        ammo="Seething Bomblet +1",
        head="Twilight Helm", body="Twilight Mail",
        back="Xucau Mantle", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +1", waist="Flume Belt +1",
        legs="Sulevia's Cuisses +1", feet="Amm Greaves",
        ring1="Defending Ring", ring2={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -5%',}},
        ear1="Odnowa Earring +1", ear2="Genmei Earring"}
         
    --Engaged Ragnarok
    -- 1100ACC 57STP
    sets.engaged.Ragnarok = {
        ammo="Ginsen",
    head="Flamma Zucchetto +1",
    body={ name="Valorous Mail", augments={'Accuracy+23','"Dbl.Atk."+5','DEX+8','Attack+13',}},
    hands="Emicho Gauntlets",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+29','"Store TP"+6','DEX+10','Attack+12',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+7','DEX+4','Accuracy+12',}},
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
}   
    -- 1086ACC 65STP
    sets.engaged.Ragnarok.LowAcc = {
        ammo="Ginsen",
    head="Boii Mask +1",
    body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','VIT+6','Attack+11',}},
    hands={ name="Emicho Gauntlets", augments={'HP+50','DEX+10','Accuracy+15',}},
    legs={ name="Odyssean Cuisses", augments={'Accuracy+16 Attack+16','"Store TP"+5','STR+10','Accuracy+8',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+20','"Dbl.Atk."+5','Attack+2',}},
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Chirich Ring +1",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}}
    -- 1208ACC 52STP
    sets.engaged.Ragnarok.MidAcc = {
        ammo="Seeth. Bomblet +1",
    head="Boii Mask +1",
    body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','VIT+6','Attack+11',}},
    hands="Flam. Manopolas +1",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+29','"Dbl.Atk."+5',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+7','DEX+4','Accuracy+12',}},
    neck="Lissome Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Chirich Ring +1",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}}
    -- 1173ACC 64STP
    sets.engaged.Ragnarok.HighAcc = {
        ammo="Seething Bomblet +1",
        head="Carmine Mask +1", body="Emicho Haubert",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, neck="Combatant's Torque",
        hands="Emicho Gauntlets", waist="Kentarch Belt +1",
        legs="Carmine Cuisses +1", feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+7','DEX+4','Accuracy+12',}},
        ring1="Petrov Ring", ring2="Chirich Ring +1",
        ear1="Telos Earring", ear2="Dignitary's Earring"}
         
    -- Sword and Board Sets
    sets.engaged.Blurred = {
        ammo="Seething Bomblet +1",
        head="Argosy Celata +1", body="Emicho Haubert",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, neck="Combatant's Torque",
        hands="Emicho Gauntlets", waist="Kentarch Belt +1",
        legs="Boii Cuisses +1", feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+7','DEX+4','Accuracy+12',}},
        ring1="Petrov Ring", ring2="Chirich Ring +1",
        ear1="Telos Earring", ear2="Dignitary's Earring"}
         
    sets.engaged.Blurred.PDT = {
        ammo="Brigantia Pebble",
    head="Sulevia's Mask +1",
    body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    hands="Sulev. Gauntlets +1",
    legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    feet={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
    neck="Loricate Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Petrov Ring",
    right_ring="Chirich Ring +1",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}}
         
    -- Weaponskill sets
    sets.precast.WS = {
        ammo="Seething Bomblet +1",
        head=Val_WSdmg_head, body=Ody_WSdmg_body,
        back=Ank_WSdmg, neck="Fotia Gorget",
        hands=Ody_WSdmg_hands, waist="Fotia Belt",
        legs=Val_WSdmg_legs, feet="Sulevia's Leggings +1",
        ring1="Ifrit Ring +1", ring2="Ifrit Ring +1",
        ear1="Ishvara Earring", ear2="Moonshade Earring"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        head="Argosy Celata", body=Val_DA_body,
        legs=Ody_WSacc_legs,
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Telos Earring"})
         
    -- Resolution - FTP .71, 1.5, 2.25, - STR 85% 
    -- Fragmentation/Scission
    sets.precast.WS['Resolution'] = {
        ammo="Seething Bomblet +1",
        head="Argosy Celata +1", body="Argosy Hauberk +1",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}, neck="Fotia Gorget",
        hands="Argosy Mufflers +1", waist="Fotia Belt",
        legs="Argosy Breeches +1", feet="Argosy Sollerets +1",
        ring1="Niqmaddu Ring", ring2="Ifrit Ring +1",
        ear1="Brutal Earring",ear2="Cessance Earring"
    }
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, { 
        head="Argosy Celata", body=Val_DA_body,
        legs=Ody_WSacc_legs,
        ring1="Ifrit Ring +1", ring2="Shukuyu Ring",
        ear1="Telos Earring"})
         
    sets.precast.WS['Savage Blade'] = {
        ammo="Seeth. Bomblet +1",
        head={ name="Odyssean Helm", augments={'Accuracy+21','Weapon skill damage +5%','STR+9','Attack+14',}},
        body={ name="Valorous Mail", augments={'Accuracy+28','Weapon skill damage +5%',}},
        hands={ name="Odyssean Gauntlets", augments={'Accuracy+29','Weapon skill damage +5%','AGI+5','Attack+5',}},
        legs={ name="Valor. Hose", augments={'Accuracy+28','Weapon skill damage +5%','STR+10','Attack+5',}},
        feet="Sulev. Leggings +1",
        neck="Caro Necklace",
        waist="Prosilio Belt +1",
        left_ear="Tati Earring +1",
        right_ear="Ishvara Earring",
        left_ring="Shukuyu Ring",
        right_ring="Ifrit Ring +1",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}}
     
    sets.precast.WS['Savage Blade'].Acc = {ammo="Seeth. Bomblet +1",
        head={ name="Argosy Celata +1", augments={'STR+12','DEX+12','Attack+20',}},
        body={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}},
        hands={ name="Odyssean Gauntlets", augments={'Accuracy+29','Weapon skill damage +5%','AGI+5','Attack+5',}},
        legs={ name="Argosy Breeches +1", augments={'STR+12','Attack+25','"Store TP"+6',}},
        feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
        neck="Fotia Gorget",
        waist="Prosilio Belt +1",
        left_ear="Telos Earring",
        right_ear="Mache Earring +1",
        left_ring="Rufescent Ring",
        right_ring="Ifrit Ring +1",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}}
     
     -- Mighty Strikes WS Set --
    sets.MS_WS = {ammo="Yetshila", feet="Boii Calligae +1"}
end
 
-- Job-specific hooks for standard casting events.
function job_midcast(spell, action, spellMap, eventArgs)
  
end
 
function job_buff_change(buff, gain)
	update_combat_form()
end
 
-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	update_combat_form()
end
 
function update_combat_form()
    -- Check Weapontype
	if player.equipment.main == 'Ragnarok' then
        state.CombatForm:set('Ragnarok')
    else
		state.CombatForm:reset()
	end
end
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end
 
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
moonshade_WS = S{"Resolution", "Torcleaver"}
 
function job_post_precast(spell, action, spellMap, eventArgs)
	-- Make sure abilities using head gear don't swap 
    if spell.type:lower() == 'weaponskill' then
		if world.time >= (17*60) or world.time <= (7*60) then
			equip(sets.Lugra)
        end
    end
end
     
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

end


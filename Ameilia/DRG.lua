-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
--	state.CombatForm = get_combat_form()
	
	state.Buff = {}
  end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal', 'Acc')
	state.DefenseMode:options('Normal', 'PDT', 'MDT', 'Reraise')
	state.WeaponskillMode:options('Normal', 'Acc')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT', 'Reraise')
	state.MagicalDefenseMode:options('MDT')

	-- Additional local binds
	send_command('bind ^` gs c cycle Offense')
	send_command('bind !` gs c cycle Defense')
end


-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end

	send_command('unbind ^`')
	send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon",hands="Ptero. Fin. Gaunt."}
	sets.precast.JA.Jump = {ammo="Hagneia Stone",
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Xaddi Mail",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Windbuffet Belt",legs="Cizin Breeches +1",feet="Ejekamal Boots"}
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais"}
	sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {legs="Vishap Brais"})
	sets.precast.JA['Soul Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Spirit Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Super Jump'] = sets.precast.JA.Jump
	sets.precast.JA['Spirit Link'] = {head="Drn. Armet +1",hands="Lnc. Vmbrc. +2"}
	sets.precast.JA['Call Wyvern'] = {body="Wyrm Mail +2"}
	sets.precast.JA['Deep Breathing'] = {}
	sets.precast.JA['Spirit Surge'] = {}

	
	-- Healing Breath sets
	sets.HB = {}
	sets.HB.Pre = {head="Drn. Armet +1",neck="Cuamiz Collar",ear1="Bloodgem Earring",ear2="Ethereal Earring",
		body="Gorney Haubert +1",hands="Gorney Moufles +1",ring1="Meridian Ring",ring2="K'ayres Ring",
		back="Strendu Mantle",waist="Glassblower's Belt",legs="Gor. Brayettes +1",feet="Gor. Sollerets +1"}
	sets.HB.Mid = {
		head="Wyrm Armet +2",neck="Lancer's Torque",ear1="Lancer's Earring",ear2="Bladeborn Earring",
		body="Wyvern Mail",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Updraft Mantle",waist="Glassblower's Belt",legs="Vishap Brais",feet="Ptero. Greaves"}
		
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Breath = {}
	
	-- Fast cast sets for spells
	
	sets.precast.FC = sets.HB.Pre
    
	-- Midcast Sets
	sets.midcast.FastRecast = {}	
		
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS = {
		head="Otomi Helm",neck="Ganesha's Mala",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Xaddi Mail",hands="Lnc. Vmbrc. +2",ring1="Rajas Ring",ring2="Pyrosoul Ring",
		back="Letalis Mantle",waist="Windbuffet Belt",legs="Cizin Breeches +1",feet="Ejekamal Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {head="Yaoyotl Helm",back="Letalis Mantle"})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {neck="Light Gorget",waist="Light Belt"})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {neck="Light Gorget",waist="Light Belt"})

	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {neck="Light Gorget",waist="Light Belt"})
	sets.precast.WS["Camlann's Torment"].Acc = set_combine(sets.precast.WS.Acc, {neck="Light Gorget",waist="Light Belt"})

	sets.precast.WS['Drakesbane'] = sets.precast.WS['Stardiver']
	sets.precast.WS['Drakesbane'].Acc = sets.precast.WS['Stardiver'].Acc
		
	-- Sets to return to when not performing an action.
	sets.engaged = {ammo="Hagneia Stone",
		head="Yaoyotl Helm",neck="Ganesha's Mala",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Xaddi Mail",hands="Regimen Mittens",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Letalis Mantle",waist="Windbuffet Belt",legs="Cizin Breeches +1",feet="Ejekamal Boots"}
	
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.idle = set_combine(sets.engaged, {head="Twilight Helm",neck="Wiglen Gorget",body="Kumarbi's Akar",ring1="Sheltered Ring",ring2="Paguroidea Ring",legs="Blood Cuisses"})

	-- Resting sets
	sets.resting = sets.idle

	-- Idle sets

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Town = sets.idle
	sets.idle.Field = sets.idle
	sets.idle.Weak = set_combine(sets.idle, sets.Reraise)
	
	-- Defense sets
	sets.defense.PDT = {
		head="Ighwa Cap",neck="Twilight Torque",hands="Umuthi Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Iximulew Cape",waist="Flume Belt",feet="Gor. Sollerets +1"}

	sets.defense.Reraise = set_combine(sets.defense.PDT, sets.Reraise)

	sets.defense.MDT = {
		head="Ighwa Cap",neck="Twilight Torque",
		body="Xaddi Mail",hands="Xaddi Gauntlets",ring1="Dark Ring",ring2="Dark Ring",
		back="Mubvum. Mantle",legs="Cizin Breeches +1",feet="Whirlpool Greaves"}

	sets.Kiting = {legs="Blood Cuisses"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged.Acc = set_combine(sets.engaged, {neck="Iqabi Necklace",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Enlivened Ring",waist="Dynamic Belt",legs="Xaddi Cuisses",feet="Whirlpool Greaves"})
	sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)
	sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.defense.PDT)
	sets.engaged.MDT = set_combine(sets.engaged, sets.defense.MDT)
	sets.engaged.Acc.MDT = set_combine(sets.engaged.Acc, sets.defense.MDT)
	sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
	sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)
		
	-- Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		equip(sets.HB.Pre)
	end
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)

end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		eventArgs.handled = true
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		eventArgs.handled = true
	end
--	if state.DefenseMode == 'Reraise' or
--		(state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
--		equip(sets.Reraise)
--	end
end

-- Runs when a pet initiates an action.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_midcast(spell, action, spellMap, eventArgs)
	if spell.english:startswith('Healing Breath') or spell.english == 'Restoring Breath' then
		equip(sets.HB.Mid)
	end
end

-- Run after the default pet midcast() is done.
-- eventArgs is the same one used in job_pet_midcast, in case information needs to be persisted.
function job_pet_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		eventArgs.handled = true
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if state.DefenseMode == 'Reraise' or
		(state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
	end
end

-- Run after the default aftercast() is done.
-- eventArgs is the same one used in job_aftercast, in case information needs to be persisted.
function job_post_aftercast(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_aftercast(spell, action, spellMap, eventArgs)

end

-- Run after the default pet aftercast() is done.
-- eventArgs is the same one used in job_pet_aftercast, in case information needs to be persisted.
function job_pet_post_aftercast(spell, action, spellMap, eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)

end

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, action, spellMap)

end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if player.sub_job == 'WHM' or player.sub_job == 'RDM' then
		idleSet.body = 'Twilight Mail'
	end
	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)

end

-- Called when the player's pet's status changes.
function job_pet_status_change(newStatus, oldStatus, eventArgs)

end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

end

function job_update(cmdParams, eventArgs)
	--state.CombatForm = get_combat_form()
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)

end

--function get_combat_form()
--	if areas.Adoulin:contains(world.area) and buffactive.ionis then
--		return 'Adoulin'
--	end
--end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	classes.CustomMeleeGroups:clear()
	if areas.Adoulin:contains(world.area) and buffactive.ionis then
	end
end

-- Job-specific toggles.
function job_toggle(field)

end

-- Request job-specific mode lists.
-- Return the list, and the current value for the requested field.
function job_get_mode_list(field)

end

-- Set job-specific mode values.
-- Return true if we recognize and set the requested field.
function job_set_mode(field, val)

end

-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)

end

-- Handle notifications of user state values being changed.
function job_state_change(stateField, newValue)

end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function select_default_macro_book()

end
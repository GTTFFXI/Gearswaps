

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
	state.Buff['Aftermath'] = buffactive['Aftermath'] or false
	state.Buff['Aftermath: Lv.1'] = buffactive['Aftermath: Lv.1'] or false
	state.Buff['Aftermath: Lv.2'] = buffactive['Aftermath: Lv.2'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.Buff['Hasso'] = buffactive['Hasso'] or false
	customize_melee_set()
end
 
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'Hybrid', 'Subtle', 'Schere')
    state.WeaponskillMode:options('Normal', 'Acc', 'Hybrid', 'PDL', 'Subtle')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')

end
 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
			binds_on_unload()
	end

	send_command('unbind ^`')
	send_command('unbind !-')
end
 
	   
-- Set up gear sets.
function init_gear_sets()
	-- See the sidecar file in gear/DRK.lua for gear.
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		equip(sets.precast.FC)
	end
end
 

 
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		equip(sets.midcast.FastRecast)
	end
end
 
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
--  function job_aftercast(spell, action, spellMap, eventArgs)
--      if not spell.interrupted then
--              if state.Buff[spell.english] ~= nil then
--                      state.Buff[spell.english] = true
--              end
--       end
--  end
 
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	return idleSet
end
 
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	return meleeSet
end
 
function job_buff_change(buff, gain)
	update_combat_form()
	
	--hax_and_cheats(buff, gain)
end
 
function hax_and_cheats(buff, gain)
	if buff == 'Aftermath: Lv.3' then
		if gain then
			windower.send_command('asc start')
		else
			windower.send_command('asc stop')
		end
	end
	
	if not state.Buff['Hasso'] then
		windower.send_command('input /ja "Hasso" <me>')
	end
end	 
 
-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	update_combat_form()
end

function job_post_precast(spell, action, spellMap, eventArgs)
	-- Make sure abilities using head gear don't swap 
    if spell.type:lower() == 'weaponskill' then
		if world.time >= (17*60) or world.time <= (7*60) then
			equip(sets.Lugra)
        end
    end
end

function update_combat_form()
    -- Check Weapontype
	local aftermath = false
		if S{'Ragnarok','Caladbolg','Liberator','Foenaria','Redemption'}:contains(player.equipment.main) then
        state.CombatForm:set(player.equipment.main)
	elseif S{'Anguta','Apocalypse','Drepanum'}:contains(player.equipment.main) then 
		state.CombatForm:set('Scythe')
    else
		state.CombatForm:reset()
	end
	
	
	classes.CustomMeleeGroups:clear()
	if (buffactive['Aftermath: Lv.3']) then
		aftermath = true
	end
		
	if (S{"Caladbolg","Liberator","Redemption"}:contains(player.equipment.main) and aftermath) then
		classes.CustomMeleeGroups:append('AM')
	end
end
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end
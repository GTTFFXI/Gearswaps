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
 
-- Set up gear sets.
function init_gear_sets()
	-- See the sidecar file in gear/WAR.lua for gear.
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
	if S{"Ragnarok","Chango","Nandaka","Shining One"}:contains(player.equipment.main) then
        state.CombatForm:set(player.equipment.main)
	elseif S{"Drepanum"}:contains(player.equipment.main) then
		state.CombatForm:set("Scythe")
	elseif S{"Karambit"}:contains(player.equipment.main) then
		state.CombatForm:set("H2H")
	elseif (player.sub_job == 'NIN' or player.sub_job == 'DNC') and 
		player.equipment.sub and not player.equipment.sub:contains('Shield') 
		and not player.equipment.sub:contains('Grip') and not player.equipment.sub:contains('empty') then
			state.CombatForm:set('DW')
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


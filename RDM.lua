-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
	state.Buff.Stymie = buffactive.Stymie or false
	enspells = S{'Enstone','Enwater','Enaero','Enfire','Enblizzard','Enthunder'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
end


-- Set up gear sets.
function init_gear_sets()
	-- See the sidecar file in gear/RDM.lua for gear.
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.skill == 'Enfeebling Magic' and state.Buff.Stymie then
		equip(sets.buff.Stymie)
    elseif spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
	elseif spellMap == 'Refresh' then
        equip(sets.midcast.Refresh)
	elseif enspells:contains(spell.name) then
		equip(sets.midcast.Enspell)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
	elseif spell.skill == 'Elemental Magic' then 
		if spell.element == world.weather_element or spell.element == world.day_element then 
			equip(sets.WeatherObi)
		end
	end
	
	if spellMap == 'BoostStat' then
		equip(sets.Gain)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

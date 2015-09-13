--[[============================================================================
xInstrument
============================================================================]]--
--[[

  Static methods for the renoise.Instrument 

]]

class 'xInstrument'

--------------------------------------------------------------------------------
-- @param instr (renoise.Instrument)
-- @return bool

function xInstrument.is_sliced_instrument(instr)
  --TRACE("xInstrument.is_sliced_instrument(instr)",instr)

  if (#instr.samples > 0) then
    return (instr.sample_mappings[1][1].read_only)
  end

end

--------------------------------------------------------------------------------
-- test whether the keyzone can be reached with the instrument
-- (running in program mode + sample columns, or TODO: having the entire 
-- keyzone filled with phrases using sample columns)
-- @param device (renoise.Instrument)
-- @return bool 

function xInstrument.is_keyzone_available(instr)
  --TRACE("xInstrument.is_keyzone_available(instr)",instr)

  if (#instr.phrases == 0) then
    return true
  end

  local all_sample_cols = true
  for k,v in ipairs(instr.phrases) do
    if not v.instrument_column_visible then
      all_sample_cols = false
    end
  end
  if all_sample_cols then
    return false
  end
  return true

end


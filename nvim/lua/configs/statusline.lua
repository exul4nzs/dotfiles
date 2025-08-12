local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

-- Add this component to your statusline setup
local NeoComposerStatus = {
  provider = function()
    return require("NeoComposer.ui").status_recording()
  end,
  -- Update on NeoComposer events
  update = {
    "User",
    pattern = {
      "NeoComposerRecordingSet",
      "NeoComposerPlayingSet",
      "NeoComposerDelaySet"
    },
  },
  -- Optional: Add colors
  hl = { fg = "#ff9e64" },  -- Match NeoComposer's preview_fg color
}

-- Insert into your statusline components
-- Example: Add to the right side (replace existing "right" if needed)
local statusline = {
  -- ... your existing components ...
  utils.insert({
    NeoComposerStatus,
  }, "right"),  -- or "left", "center" based on preference
}

return statusline

-- Declare top-lvl table
CraftBagKeybind = {}

local ADDON_NAME = 'CraftBagKeybind'

-- EVENT_ADD_ON_LOADED Tell UI to create menu item in Controls and func Initialize.
local function OnAddOnLoaded(event, addonName)
  if (addonName ~= ADDON_NAME) then
      return
  end
  
  ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_AUTOADD_TO_CRAFT_BAG", "Toggle Auto-Add to Craft Bag")
  EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED)
end

-- Binding
function CraftBagKeybind:Switch()
    d('Auto-Add to Craft Bag Toggled')
    local newState = 1 - GetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_ADD_TO_CRAFT_BAG)
    SetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_ADD_TO_CRAFT_BAG, newState)
end

-- Load Event Manager
EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
--end
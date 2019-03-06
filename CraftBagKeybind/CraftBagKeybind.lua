-- Declare top-lvl table
local ADDON_NAME = CraftBagKeybind

-- EVENT_ADD_ON_LOADED Tell UI to create menu item in Controls and func Initialize.
function CraftBagKeybind:OnAddOnLoaded(event, addonName)
  if (addonName ~= ADDON_NAME) then
      return
  end
  
  ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_AUTO-ADD_TO_CRAFT_BAG", "Toggle Auto-Add Craft Bag")

  EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_PLAYER_DEACTIVATED, OnPlayerDeactivated)
  EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED)
  self:Initialize()
end

-- Initialize
function CraftBagKeybind:Initialize()
    EVENT_MANAGER:UnregisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED)
end

-- Binding
function Switch()
    local newState = 1 - GetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_ADD_TO_CRAFT_BAG)
    SetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_ADD_TO_CRAFT_BAG, newState) 
end  
-- Load Event Manager
EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED, CraftBagKeybind.OnAddOnLoaded)
-- end
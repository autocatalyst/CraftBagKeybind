-- Declare top-lvl table
local ADDON_NAME = CraftBagKeybind

-- EVENT_ADD_ON_LOADED Tell UI to create menu item in Controls.
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
  EVENT_MANAGER:UnregisterForEvent(addonName, eventCode)
  CraftBagKeybind:ConsoleCommands()
  CraftBagKeybind:Switch()
end

-- Binding

function CraftBagKeybind:Switch()

  <Control name="Options_Gameplay_AutoAddToCraftBag" inherits="ZO_Options_Checkbox">
  <Anchor point="TOPLEFT" relativeTo="Options_Gameplay_UseAutoLoot_Stolen" relativePoint="BOTTOMLEFT" offsetX="-20" offsetY="4" />
  <OnInitialized>
      self.data = KEYBOARD_OPTIONS:GetSettingsData(SETTING_PANEL_GAMEPLAY, SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_ADD_TO_CRAFT_BAG)
      ZO_OptionsWindow_InitializeControl(self)
  </OnInitialized>
</Control>

--
 
-- Load the addon with this
EVENT_MANAGER:RegisterForEvent(
    ADDON_NAME,
    EVENT_ADD_ON_LOADED,
    function(...)
        CraftBagKeybind:OnAddOnLoaded(...)
    end


--end
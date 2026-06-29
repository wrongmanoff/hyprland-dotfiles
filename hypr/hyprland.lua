-- #######################################################################################
-- HYPRLAND CONFIG (converted to Lua)
-- https://wiki.hypr.land/Configuring/Start/
-- #######################################################################################

require("conifg/monitor")
require("conifg/program")
require("conifg/autostart")
require("conifg/environment")
require("conifg/looks")
require("conifg/input")
require("conifg/keybindings")
require("conifg/windowsandworkspaces")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Permission changes require a Hyprland restart

-- hl.config({ ecosystem = { enforce_permissions = true } })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

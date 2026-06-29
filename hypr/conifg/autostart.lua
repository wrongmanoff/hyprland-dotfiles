-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img /home/rightman/Downloads/wallpaper.jpg")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- network manager
    hl.exec_cmd("nm-applet")

    -- waybar
    hl.exec_cmd("waybar")

    -- notifications
    hl.exec_cmd("mako")

    -- bluetooth
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/battery-notify.sh")
    hl.exec_cmd("udiskie --tray &")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
    hl.exec_cmd("thunar --daemon &")

    -- sticky notes on desktop
    hl.exec_cmd("eww daemon")
    hl.exec_cmd("eww open sticky-desktop")
end)

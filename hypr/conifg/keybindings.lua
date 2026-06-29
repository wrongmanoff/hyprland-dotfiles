---------------------
---- KEYBINDINGS ----
---------------------

-- https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-----------
-- APPS  --
-----------

hl.bind(mainMod .. " + Q",           hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C",           hl.dsp.window.close())
hl.bind(mainMod .. " + M",           hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E",           hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",           hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",           hl.dsp.exec_cmd("rofi -show drun -show-icons -no-lazy-grab"))
hl.bind(mainMod .. " + SHIFT + C",   hl.dsp.exec_cmd("pkill -x rofi"))
hl.bind(mainMod .. " + P",           hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",           hl.dsp.layout("togglesplit"))  -- dwindle
hl.bind(mainMod .. " + L",           hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + X",           hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + F",           hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + W",           hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + N",           hl.dsp.exec_cmd("flatpak run com.vixalien.sticky"))
hl.bind(mainMod .. " + D",           hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + K",           hl.dsp.exec_cmd("networkmanager_dmenu"))
hl.bind(mainMod .. " + A",           hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Power Profiles
hl.bind(mainMod .. " + F1",          hl.dsp.exec_cmd("powerprofilesctl set performance"))   -- Performance
hl.bind(mainMod .. " + F2",          hl.dsp.exec_cmd("powerprofilesctl set balanced"))      -- Balanced
hl.bind(mainMod .. " + F3",          hl.dsp.exec_cmd("powerprofilesctl set power-saver"))   -- Power Saver

-- Screenshots
hl.bind("PRINT",                     hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy && notify-send "Screenshot" "Copied to clipboard"'))
hl.bind("SHIFT + PRINT",             hl.dsp.exec_cmd('grim -g "$(slurp)" ~/Pictures/Screenshot-$(date +%Y-%m-%d_%H-%M-%S).png && notify-send "Screenshot" "Saved to Pictures"'))
hl.bind("CTRL + PRINT",              hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(mainMod .. " + PRINT",       hl.dsp.exec_cmd('grim - | wl-copy && notify-send "Screenshot" "Full screen copied to clipboard"'))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd('grim ~/Pictures/Screenshot-$(date +%Y-%m-%d_%H-%M-%S).png && notify-send "Screenshot" "Full screen saved"'))

-- Notifications
hl.bind(mainMod .. " + BackSpace",         hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + SHIFT + BackSpace", hl.dsp.exec_cmd("makoctl dismiss --all"))

-- Spotify controls
hl.bind(mainMod .. " + F5",          hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + F6",          hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + F7",          hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + F8",          hl.dsp.exec_cmd("spotify --uri=spotify:"))
hl.bind(mainMod .. " + F9",          hl.dsp.exec_cmd('notify-send "Now Playing" "$(playerctl metadata title) — $(playerctl metadata artist)"'))

-- Screen orientation
hl.bind(mainMod .. " + F12",         hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/toggle-rotate.sh"))

-- Focus
hl.bind(mainMod .. " + left",        hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + right",       hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",          hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + down",        hl.dsp.focus({ direction = "down"  }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10  -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",           hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",   hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down",  hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",    hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272",   hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",   hl.dsp.window.resize(), { mouse = true })

-- Volume
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && notify-send -t 1500 'Volume' \"$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1)\""), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify-send -t 1500 'Volume' \"$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1)\""),    { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send -t 1500 'Volume' 'Muted'"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),                                       { locked = true, repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+ && notify-send -t 1500 'Brightness' \"$(brightnessctl get)%\""), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%- && notify-send -t 1500 'Brightness' \"$(brightnessctl get)%\""), { locked = true, repeating = true })

-- Media keys
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),    { locked = true })

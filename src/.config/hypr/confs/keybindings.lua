local vars = require("confs.vars")

hl.bind(vars.main_mod .. " + return", hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.main_mod .. " + Q", hl.dsp.window.close())

hl.bind(vars.main_mod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(vars.main_mod .. " + SPACE", hl.dsp.exec_cmd(vars.apps_menu))
hl.bind(vars.main_mod .. " + D", hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(vars.main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(vars.main_mod .. " + F",  hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(vars.main_mod .. " + l",  hl.dsp.focus({ direction = "left" }))
hl.bind(vars.main_mod .. " + h", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.main_mod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(vars.main_mod .. " + j",  hl.dsp.focus({ direction = "down" }))

hl.bind(vars.main_mod .. " + S",  hl.dsp.exec_cmd("hyprshot -m region --raw | swappy -f -"))

hl.bind(vars.main_mod .. " + B",  hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(vars.main_mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
  hl.bind(vars.main_mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(vars.main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.main_mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(vars.main_mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(vars.main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

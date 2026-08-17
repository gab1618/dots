local vars = require("confs.vars")

hl.on("hyprland.start", function ()
  hl.exec_cmd(vars.terminal)
  hl.exec_cmd("fcitx5 -d & qs & waybar & hypridle & hyprpaper & walker --gapplication-service & elephant & swayosd-server")
  hl.exec_cmd("gsettings get org.gnome.desktop.interface color-scheme && gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
end)


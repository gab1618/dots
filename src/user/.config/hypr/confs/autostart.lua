local vars = require("confs.vars")

hl.on("hyprland.start", function ()
  hl.exec_cmd(vars.terminal)
  hl.exec_cmd("fcitx5 -d & qs & hypridle & hyprpaper & walker --gapplication-service & elephant & swayosd-server")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'")
end)


{
  description = "NixOS desktop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, zen-browser, ... }: {
    nixosModules.default = { pkgs,... }: {
      environment.systemPackages = with pkgs; [
        neovim
        wget
        git
        tmux
        kitty
        zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        fastfetch
        zsh
        bitwarden-desktop
        stow
        btop
        hyprland
        hyprlock
        hyprshot
        swappy
        hyprpaper
        quickshell
        elephant
        walker
        xdg-utils
        adwaita-icon-theme
        gnome-themes-extra
        gsettings-desktop-schemas
        docker
        pkgs.qbittorrent
        asdf-vm
        gnumake
        gcc
        unzip
        ripgrep
        rustup
        rust-analyzer
        anki
      ];
      programs.hyprland.enable = true;
      programs.hyprlock.enable = true;

      nixpkgs.config.allowUnfree = true;

      programs.zsh.enable = true;
      users.defaultUserShell = pkgs.zsh;

      programs.appimage = {
        enable = true;
        binfmt = true;
      };

      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
      ];

      environment.sessionVariables = {
        GTK_THEME = "Adwaita-dark";
      };

      virtualisation.docker = {
        enable = true;
      };

      system.stateVersion = "26.05"; # Did you read the comment?

      nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };
  };
}

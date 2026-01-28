{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    bluez
    bluez-tools
    hyprlauncher
    hyprshot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # systed.enable = false;
    plugins = [ ];
  };

  stylix.targets.hyprlock.enable = false;
  programs.hyprlock.enable = true;

  xdg.configFile."hypr/hyprland.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/levib/Projects/my_nix_os/dotfiles/hypr/hyprland.conf";
  };

  stylix.targets.hyprpanel.enable = false;
  programs.hyprpanel = {
    enable = true;
    settings = {
      scalingPriority = "hyprland";
      # theme.bar.transparent = true;
      theme.font = {
        name = "FiraCode Nerd Font";
        size = "14px";
      };
    };
  };

  stylix.targets.hyprpaper.enable = false;
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/levib/Wallpapers/something_in_the_woods.png" ];
      wallpaper = [ ",/home/levib/Wallpapers/something_in_the_woods.png" ];
    };
  };

}

# Setup Dev Tooling, Editors, and Terminals here
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    rustup
    gcc
    nodejs_24
    python315
    lua
    gnumake

    tmux
    tmux-sessionizer
  ];

  stylix.targets.neovim.enable = false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/levib/Projects/my_nix_os/dotfiles/nvim";
    recursive = true;
  };

  xdg.configFile.tmux = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/levib/Projects/my_nix_os/dotfiles/tmux";
    recursive = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

}

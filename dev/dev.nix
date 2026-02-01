# Setup Dev Tooling, Editors, and Terminals here
{ config, pkgs, inputs, ... }:

let neovim-nightly = inputs.neovim-nightly-overlay.packages.x86_64-linux.neovim;
in {
  home.packages = with pkgs; [
    go
    rustup
    gcc
    nodejs_24
    python315
    lua
    gnumake

    lazygit
    rustywind
    tmux
    tmux-sessionizer
  ];

  # stylix.targets.neovim.enable = false;
  programs.neovim = {
    enable = true;
    package = neovim-nightly;
    defaultEditor = true;
    # vimAlias = true;
    # viAlias = true;
    plugins = with pkgs.vimPlugins; [ nvim-treesitter.withAllGrammars ];
  };

  xdg.configFile.nvim = {
    source =
      config.lib.file.mkOutOfStoreSymlink "/home/levib/Projects/dotfiles/nvim";
    recursive = true;
  };

  xdg.configFile.tmux = {
    source =
      config.lib.file.mkOutOfStoreSymlink "/home/levib/Projects/dotfiles/tmux";
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

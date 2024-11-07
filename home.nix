{ pkgs, ... }:

let
  # Define Vim using the default Vim configuration
  customVim = pkgs.vimHugeX;

  # plugins in the ~/.vimrc
  # # Specify Vim plugins to add
  # vimPlugins = [
  #   pkgs.vimPlugins.vim-nix       # Nix syntax highlighting
  #   pkgs.vimPlugins.vim-airline   # Vim status/tabline
  #   pkgs.vimPlugins.gruvbox       # Popular color scheme
  # ];
in
{
  # Home Manager options
  home.username = "iria";            # Replace with your actual username
  home.homeDirectory = "/home/iria"; # Replace with your actual home directory
  home.stateVersion = "24.11";

  # Additional Home Manager configurations
  home.packages = with pkgs; [
    bash-completion
    bat
    fish
    fzf
    git
    htop
    ncdu
    dust
    ripgrep
    tmux
    silver-searcher
    customVim
    git
    htop
    dust
    ncdu
  ];

  # use ~/.vimrc
  # home.file.".vimrc".text = ''
  #   syntax on
  # '';
}

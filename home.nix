{ pkgs, ... }:

let
  # Define Vim using the default Vim configuration
  customVim = pkgs.vimHugeX;
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

{ pkgs, ... }:

let
  # Define Vim using the default Vim configuration
  customVim = pkgs.vimHugeX;
in
{
  # Home Manager options
  home.username = "iria";            # replace with your actual username
  home.homedirectory = "/home/iria"; # replace with your actual home directory
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
    iperf
  ];

  # use ~/.vimrc
  # home.file.".vimrc".text = ''
  #   syntax on
  # '';
}

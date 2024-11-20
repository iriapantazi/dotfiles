{ config, pkgs, ... }:

let
  # Use an overlay to replace the default Vim package with vimHugeX
  customOverlay = self: super: {
    vim = super.vimHugeX; # Replace default Vim with vimHugeX
  };
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "iria";
  home.homeDirectory = "/home/iria";
  home.stateVersion = "24.05";

  # imports = [
  #   ./vim.nix
  # ];
  # Enable Vim through Home Manager
  programs.vim = {
    enable = true; # Enable Vim module

    # Define plugins
    plugins = with pkgs.vimPlugins; [
      vimwiki         # Note-taking and wiki management
      vim-airline     # Statusline/tabline plugin
      ale             # Asynchronous linting engine
      vim-fugitive    # Git wrapper for Vim
      vim-lsp         # Lightweight LSP integration
      vim-nix         # Nix language support
    ];

    # Add custom Vim configuration
    extraConfig = ''
      " General settings
      set number relativenumber
      set ruler
      set showmatch
      set noswapfile

      set hidden
      set tabstop=4
      set shiftwidth=4
      set expandtab
      syntax on
      filetype plugin indent on

      set hlsearch
      set incsearch
      set ignorecase
      set fileignorecase
      set foldopen-=search " Don't open folds when searching
      hi Search cterm=NONE ctermfg=DarkMagenta ctermbg=LightYellow

      " Airline configuration
      let g:airline#extensions#tabline#enabled = 1
      let g:airline_theme = 'dark'

      " ALE configuration
      let g:ale_fix_on_save = 1
      let g:ale_linters = {
        \ 'python': ['flake8', 'mypy'],
      \ }

      " LSP configuration
      let g:lsp_settings = {
        \ 'python': {'command': 'pyright'},
      \ }

      " Vimwiki configuration
      let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

      " Fugitive configuration
      autocmd FileType gitcommit setlocal spell
    '';
  };
}

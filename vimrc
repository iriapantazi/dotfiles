" to override vim's initializations
set nocompatible
colorscheme default

" both required for vimwiki
filetype plugin on
syntax on

set mouse=a
set autoread

" set clipboard+=unnamed  " use the clipboards of vim and win
set clipboard=unnamedplus  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard

autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces on save

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'github/copilot.vim'
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"
Plug 'https://github.com/qpkorr/vim-bufkill.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/bkad/CamelCaseMotion.git'
Plug 'https://github.com/tmhedberg/matchit.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/morhetz/gruvbox.git'
" Plug 'https://github.com/airblade/vim-gitgutter.git'
call plug#end()


let mapleader=","

" Section: fzf_vim
" it is set to use ripgrep (use RG command)

" Section: ALE configuration
let g:ale_linters={
  \ 'python': ['pylint',],
  \}
let g:ale_fixers={
  \ '*': ['remove_trailing_lines', 'trim_whitespace',],
  \ 'python': ['isort', 'ruff'],
  \}
" python linters
" 'pylsp', 'pylint', 'pyright'
" also available in python ['isort', 'black', 'autopep8', 'ruff', 'pycln', 'yapf']
" disable vale until learn to configure vocabulary
"   \ 'markdown': ['vale'],
" run black command for isort
let g:ale_python_isort_options = '--profile black -l 92'
let g:ale_python_pylint_options = '--max-line-length=92'
let g:ale_python_pylsp_options = '--max-line-length=92'
" will change things automatically
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_hover_cursor = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'


" Section: vimwiki
" vimwiki settings
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Section: NERDTree
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>g :NERDTreeFocus<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p> " to refresh NERDTree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf', '.beam']
" open NERDTree on startup  & cursor to the first window
" autocmd BufEnter * lcd %:p:h
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
nnoremap <leader>P :Files<CR>
nnoremap <leader>B :Buffers<CR>


" Section: CtrlP
let g:ctrlp_max_files=0 " no limit on files
" let g:ctrlp_by_filename = 1
" nnoremap <leader><C-p> :<C-u>CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|__pycache__$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" custom tool for listing files instead of  overwrite custom ignore
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_open_new_file = 't' " open file in new tab

" Section: Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_stl_path_style = 'short'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep='>'
" let g:airline_detect_spell=1

" Section: Markdown Preview
" MarkdownPreview https://github.com/iamcco/markdown-preview.nvim
let g:mkdp_auto_close = 0
let g:mkdp_auto_start = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_echo_preview_url = 1
let g:mkdp_open_ip = '127.0.0.1'
" let g:mkdp_port = '7070'
let g:mkdp_theme = 'dark'


" Section: DogGenerate
" DogGenerate: https://github.com/kkoomen/vim-doge
" let g:doge_doc_standard_python = 'numpy'


" Section: copilot
let g:copilot#enable_mappings = 0
let g:copilot_filetypes = {
  \ 'gitcommit': v:true,
  \ 'markdown': v:true,
  \ 'yaml': v:true,
  \ 'perl': v:true
  \ }

" Replace tab w/ C-j  CR is regular carriage return fallback is used
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
" accept 1 word of current suggestion
imap <C-L> <Plug>(copilot-accept-word)
imap <C-K> <Plug>(copilot-next)


" Section: Commentary
" gcc to (un)comment a line
" gc to (un)comment a block of code in visual mode
" add support for more languages
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType python setlocal commentstring=#%s

"
set encoding=utf-8

set number relativenumber
set ruler
set hidden
" set virtualedit=all " to place cursor where you click

" Bracket matching
set showmatch
set matchtime=5

" Indent by 2 spaces (no tabs) by default
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent

vnoremap <C-c> "*y
set wildmenu
set wildmode=longest:full,full
" set wildoptions=pum
set wildignorecase " requireds to set ignorecase to fully work
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.class,*.pyc,*/node_modules/*,*.o
set showcmd

" Allow some space either side (vertically) of the cursor when scrolling
set scrolloff=2

" title
set title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
" Always show the status line
set laststatus=2
set statusline=%F\

" Only jump to the next line with g[jk]
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Move around windows using ctrl
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" " Reposition windows using ctrl+alt
" nnoremap <C-M-j> <C-w>J
" nnoremap <C-M-k> <C-w>K
" nnoremap <C-M-h> <C-w>H
" nnoremap <C-M-l> <C-w>L

" Change tabs with PageUp, PageDown
" C-<Tab>, C-S-<Tab> would be nicer, but doesn't seem to be possible (probably
" because urxvt doesn't allow it)
nnoremap <PageUp> gT
nnoremap <PageDown> gt

" Sensible split directions
set splitbelow
set splitright

" Make Y behave like C and D
nnoremap Y y$

" S to join (free J up)
nnoremap S J

" % is awkward
nnoremap <Tab> %
onoremap <Tab> %
vnoremap <Tab> %

" Backspace to go to the first character of the line above
nnoremap <BS> -
set backspace=2 " make backspace work like most other programs

" Nice invisibles
set listchars=tab:▸\ ,eol:¬

" F2 for buffer list
nnoremap <F1> :ls<CR>

" Disable swap file creation
set noswapfile

" Alternative scrolling (move the cursor and the viewport)
nnoremap J <C-e>j
nnoremap K <C-y>k

" Scroll around in insert mode
inoremap <C-e> <C-x><C-e>
inoremap <C-y> <C-x><C-y>

" Default K is annoying
vnoremap K <Nop>

" Capitalize the word you've just typed
inoremap <C-u> <esc>bgU`^gi

" Search
set hlsearch
set incsearch
set ignorecase
set fileignorecase
set foldopen-=search " Don't open folds when searching
hi Search cterm=NONE ctermfg=DarkMagenta ctermbg=LightYellow



" Autocomplete (only search current buffer)
set complete=.

" Make folds easier to see
set foldcolumn=1

" " Move around in insert mode
" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>
"
" " Change key for digraphs since <C-k> is now taken
" inoremap <C-d> <C-k>


filetype plugin indent off
" Tabs and spaces
au FileType c setl et sw=4 sts=4
au FileType cpp setl et sw=2 sts=2
au FileType make setl noet sw=4 ts=4 sts=4
au FileType java setl et sw=4 sts=4
au FileType python setl et sw=4 sts=4 commentstring=#%s
au FileType rust setl et sw=4 sts=4
au FileType asm setl noet ts=4
au FileType 8o setl noet sw=4 ts=4 sts=4

" Don't interpret "vim: ..." commit messages as modelines
autocmd FileType gitrebase setlocal nomodeline
autocmd FileType gitcommit setlocal nomodeline

" au FileType tex setl cole=2

au BufRead,BufNewFile *.mustache set filetype=htmldjango
au BufRead,BufNewFile *.sbt set filetype=scala
au BufRead,BufNewFile *.md set filetype=markdown

" tagbar plugin
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_vertical = 10

" CamelCaseMotion plugin
call camelcasemotion#CreateMotionMappings(',')


" C-s to save in insert mode
inoremap <C-s> <esc>:w<CR>gi

" Buffer switching w/ <leader>
map <leader>n :bnext<cr>
map <leader>m :bprevious<cr>
map <leader>d :bdelete<cr>
map <leader>l :buffers<cr>


" set spell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
let g:lexical#spelllang = ['en_gb']

" Shortcuts using <leader>
" for next previous add suggestions
" zw to remove
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader>t :NERDTreeToggle<CR>
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=DarkGray ctermbg=yellow

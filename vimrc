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
set go+=a " Visual selection automatically copied to the clipboard

let mapleader=","

autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces on save

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'LnL7/vim-nix'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'github/copilot.vim'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()



" Section: fzf_vim
nnoremap <leader>P :Files<CR>
nnoremap <leader>B :Buffers<CR>
" use Ag silversearch to fuzzy search within folder files
nnoremap <leader>g :Ag<CR>
" make RG fold for narrow pages
let g:rg_command = 'rg --vimgrep --no-heading --smart-case'
nnoremap <leader>r :Rg<CR>

" Section: ALE configuration
let g:ale_linters={
  \ 'python': ['pyright', 'flake8'],
  \}
let g:ale_fixers={
  \ '*': ['remove_trailing_lines', 'trim_whitespace',],
  \ 'python': ['isort', 'black'],
  \ 'markdown': ['prettier'],
  \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1 " will change things automatically
let g:ale_completion_enabled = 0  " Disable ALE completion to avoid conflicts
let g:ale_hover_cursor = 0 " use hover from vim-lsp
let g:ale_python_auto_pipenv = 1
let g:ale_python_pyright_auto_pipenv = 1
let g:ale_python_pyright_executable = 'pyright-langserver'
let g:ale_python_isort_auto_pipenv = 1
let g:ale_python_isort_options = '--profile=black --project=caiman_asr_train --project=myrtle_asr_train --project=myrtle_data'
let g:ale_python_flake8_auto_pipenv = 1
let g:ale_python_flake8_options = '--extend-ignore=E203,F401,F722 --max-line-length=92 caiman-asr-dev/'
let g:ale_python_black_auto_pipenv = 1
let g:ale_markdown_prettier_options = '--single-quote --trailing-comma all'
let g:ale_virtualtext_cursor = 0 " 'current'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
" nnoremap <silent> gd :ALEGoToDefinition<CR>

" Section: vim-lsp
" Configure vim-lsp to use pyright as the LSP for Python
if executable('pyright-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyright',
        \ 'cmd': ['pyright-langserver', '--stdio'],
        \ 'whitelist': ['python'],
        \ 'initialization_options': {
        \     'python': {
        \         'analysis': {
        \             'typeCheckingMode': 'basic',
        \             'reportUnboundVariable': 'none'
        \         }
        \     }
        \ }
        \ })
endif


" can make <leader>gd instead.
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>
let g:lsp_diagnostics_virtual_text_enabled = 1 " Disable virtual text
let g:lsp_diagnostics_echo_cursor = 1  " Show diagnostics in the command area when cursor is on an error
" virtual text position
let g:lsp_diagnostics_virtual_text_position = 'right'
" let g:lsp_diagnostics_float_cursor = 0 " Disable floating windows for diagnostics

" Section: vimwiki
" vimwiki settings
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_syntax = 'markdown'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md', 'auto_toc': 1, 'auto_tags': 1}]
let g:vimwiki_filetypes = ['markdown']
let g:vimwiki_hl_headers = 1 " diff header colours
let g:vimwiki_listing_hl = 1
" let g:vimwiki_listing_hl_command = ''
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_conceallevel = 2 " default, to conceal urls
let g:vimwiki_table_auto_fmt = 1 " default, to format tables
let g:vimwiki_folding = '' " options: 'syntax' 'expr' 'syntax' 'indent'
" let g:vimwiki_rx_todo = '\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\)\>'
let g:vimwiki_auto_tags = 1
let g:vimwiki_auto_toc = 1
let g:wiki_nested_syntaxes = {'python': 'python', 'sh': 'sh', 'bash': 'sh'}
" Vimwiki mappings
" nmap <leader>ww <Plug>VimwikiIndex
" nmap <leader>wt <Plug>VimwikiTabIndex
" nmap <leader>wd <Plug>VimwikiDiaryIndex
" nmap <leader>ws <Plug>VimwikiUISelect
" nmap <leader>w<CR> <Plug>VimwikiFollowLink


" vimwiki headers colors:
hi VimwikiHeader1 cterm=bold ctermfg=blue
hi VimwikiHeader2 cterm=bold ctermfg=magenta
hi VimwikiHeader3 cterm=bold ctermfg=cyan
hi VimwikiHeader4 cterm=bold ctermfg=lightred
hi VimwikiHeader5 cterm=bold ctermfg=lightgreen
hi VimwikiHeader6 cterm=bold ctermfg=brown

" Unique highlighting for TODO and DONE keywords in Vimwiki
syntax match VimwikiKeywordTODO /\<TODO\>/
highlight VimwikiKeywordTODO cterm=bold ctermfg=Red

syntax match VimwikiKeywordDONE /\<DONE\>/
highlight VimwikiKeywordDONE cterm=bold ctermfg=DarkGreen

syntax match VimwikiKeywordWAITING /\<WAITING\>/
highlight VimwikiKeywordWAITING cterm=bold ctermfg=Yellow

syntax match VimwikiKeywordINPROGRESS /\<INPROGRESS\>/
highlight VimwikiKeywordINPROGRESS cterm=bold ctermfg=Blue

syntax match VimwikiKeywordFIXED /\<FIXED\>/
highlight VimwikiKeywordFIXED cterm=bold ctermfg=DarkCyan

syntax match VimwikiKeywordXXX /\<XXX\>/
highlight VimwikiKeywordXXX cterm=bold ctermfg=DarkYellow

syntax match VimwikiKeywordNOT /\<NOT\>/
highlight VimwikiKeywordNOT cterm=underline,bold ctermfg=Red

syntax match VimwikiKeywordNB /\<NB\>/
highlight VimwikiKeywordNB cterm=bold ctermfg=DarkYellow

syntax match VimwikiKeywordOK /\<OK\>/
highlight VimwikiKeywordOK cterm=bold ctermfg=DarkGreen ctermbg=black

syntax match VimwikiKeywordRESULT /\<RESULT:\>/
highlight VimwikiKeywordRESULT cterm=bold ctermfg=DarkCyan ctermbg=black

syntax match VimwikiKeywordINOTES /\<NOTES\>/
highlight VimwikiKeywordINOTES cterm=bold ctermfg=Blue


" single and triple code background colours
highlight VimwikiCode ctermbg=black ctermfg=magenta
highlight VimwikiCodeBlockBackground cterm=bold ctermbg=25 guibg=#2E2E2E

" Set up fenced code block syntax highlighting for common languages in Vimwiki
augroup VimwikiCodeBlockHighlight
  autocmd!
  autocmd FileType vimwiki highlight link vimwikiCode VimwikiCode
  autocmd Syntax vimwiki syntax include @markdown syntax/markdown.vim
  autocmd FileType vimwiki syntax region vimwikiCode start=/```bash/ end=/```/ keepend
  autocmd FileType vimwiki syntax region vimwikiCode start=/```python/ end=/```/ keepend
  autocmd FileType vimwiki syntax region vimwikiCode start=/```markdown/ end=/```/ keepend
  " Apply custom background color to code blocks
  autocmd FileType vimwiki highlight link vimwikiCode VimwikiCode
  "
  " autocmd FileType vimwiki syntax region VimwikiCodeBlock matchgroup=VimwikiCodeBlockBackground start=/```/ end=/```/ keepend
  " autocmd FileType vimwiki highlight link VimwikiCodeBlock VimwikiCodeBlockBackground
augroup END


" Custom highlight for table headers in markdown
highlight MarkdownTableHeader guifg=#FFA500 guibg=#2E2E2E ctermfg=214 ctermbg=235

" Match the first row in tables (assuming headers are defined there)
syntax match MarkdownTableHeader /|.*|/ containedin=markdownTable,markdownCodeBlock keepend

" Section: NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>g :NERDTreeFocus<CR>
" nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p> " to refresh NERDTree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf', '.beam']



" Section: CtrlP
let g:ctrlp_max_files=0 " no limit on files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|__pycache__$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_open_new_file = 't' " open file in new tab

" Section: Airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " skip utf-8[unix] in encoding
let g:airline_section_c = '%F'
let g:airline_section_z = '%p%% line: %l/%L col: %c'
let g:airline#extensions#fugitiveline#enabled = 1 " show git branch tagbar b
let g:airline_left_sep='>'
let g:airline_detect_spell=1
" in vim airline choose buffer with mouse
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#fnamemod = ':t'  " Show only filename in tabline
" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#show_tab_count = 1
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#show_tab_size = 1

" Section: Markdown Preview
let g:mkdp_auto_close = 0
let g:mkdp_auto_start = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_echo_preview_url = 1
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_theme = 'dark'


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

"
set encoding=utf-8
set backspace=2 " make backspace work like most other programs

" Number lines
set number relativenumber
set ruler

" when opening new buffer, (??)
set hidden

" Bracket matching
set showmatch
set matchtime=5

" Indent by 2 spaces (no tabs) by default
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent

" Copy/paste to system clipboard
vnoremap <C-c> "*y
vnoremap <C-x> "*d
vnoremap <C-v> "*p

" Search settings
set hlsearch
set incsearch
set ignorecase
set fileignorecase
set foldopen-=search " Don't open folds when searching
hi Search cterm=NONE ctermfg=DarkMagenta ctermbg=LightYellow

" Search settings
set wildmenu
set wildmode=longest:full,full
set wildignorecase " requireds to set ignorecase to fully work
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.class,*.pyc,*/node_modules/*,*.o
set showcmd

" Allow some space either side (vertically) of the cursor when scrolling
set scrolloff=2

" title NB it'll be overwritten by in tmux
set title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
" Always show the status line
set laststatus=2
set statusline=%F\


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

" Nice invisibles
set listchars=tab:▸\ ,eol:¬

" F1 for buffer list
nnoremap <F1> :ls<CR>

" Disable swap file creation
set noswapfile

" " Alternative scrolling (move the cursor and the viewport)
" nnoremap J <C-e>j
" nnoremap K <C-y>k " conflicting w/ vim-lsp

" Scroll around in insert mode
inoremap <C-e> <C-x><C-e>
inoremap <C-y> <C-x><C-y>

" Default K is annoying
vnoremap K <Nop>

" Capitalize the word you've just typed
inoremap <C-u> <esc>bgU`^gi


" Autocomplete (only search current buffer)
set complete=.

" Make folds easier to see
" set foldcolumn=1


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

" read python docstrings
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc3.10
" autocmd Filetype vimwiki set ft=markdown syntax=markdown
" autocmd BufWinEnter *.md set syntax=markdown

au BufRead,BufNewFile *.mustache set filetype=htmldjango
au BufRead,BufNewFile *.sbt set filetype=scala
au BufRead,BufNewFile *.md set filetype=markdown

" C-s to save in insert mode
inoremap <C-s> <esc>:w<CR>gi

" Section: Buffer switching w/ <leader>
map <leader>n :bnext<cr>
map <leader>m :bprevious<cr>
map <leader>d :bdelete<cr>
map <leader>l :buffers<cr>


" Section: set spell
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
let g:lexical#spelllang = ['en_gb']
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=DarkGray ctermbg=yellow

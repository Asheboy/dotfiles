" vim-plug

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'ervandew/supertab'
Plug 'Lokaltog/vim-easymotion'
Plug 'juvenn/mustache.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'terryma/vim-expand-region'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-surround'
Plug 'mattn/webapi-vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-eunuch'
Plug 'mhinz/vim-startify'
Plug 'ZoomWin'
Plug 'grep.vim'
Plug 'moll/vim-node'
Plug 'ekalinin/Dockerfile.vim'
Plug 'kshenoy/vim-signature'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'copypath.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'rstacruz/vim-closer'
Plug 'wavded/vim-stylus'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-endwise'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'xero/sourcerer.vim'
Plug 'fmoralesc/vim-pad'
Plug 'geekjuice/vim-mocha'
Plug 'w0ng/vim-hybrid'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tommcdo/vim-exchange'

call plug#end()

syntax on
filetype plugin indent on

" color scheme
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" Needed to make my colorscheme work in tmux
set t_ut=

" turn line numbering on
set number

" map leader
let mapleader=" "

" autoindent on when programming
set noai

" turn on line numbers
set number

" turn on ruler
set noruler
set nocursorline

" status line config
set laststatus=2
set statusline=%f\ -
set statusline+=%{fugitive#statusline()}

let loaded_matchparen=1
set noshowmatch
set nocursorcolumn
set scrolljump=8
let html_no_rendering=1

set bs=2

" set tabs to 2 spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8
set colorcolumn=80

" show invisible characters
"set list set listchars=eol:¬

" turn off swapfiles
set noswapfile

" show incomplete commands
set showcmd

" set encryption type to something stronger
set cryptmethod=blowfish

" keymaps

" kill buffers
noremap <Leader>bd :bd<CR>

" run a command and then paste its output into a vim buffer
noremap <Leader>nex :new<CR>!!

" switch between tabs
noremap <Leader>nt :bn<CR>
noremap <Leader>pv :bp<CR>

" faster than :w
nnoremap <Leader>w :w<CR>

" better and faster than :q
nnoremap <Leader>q :q<CR>

" list buffers
nnoremap <Leader>ls :ls<CR>

" map ZoomWin
nnoremap <Leader>o :ZoomWin<CR>

" hjkl split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural split directions
set splitbelow
set splitright

" copy and paste to the system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Enter to go the end of a file, Backspace to go to the start, and <N>Enter
" to go to line N
nnoremap <CR> G
nnoremap <BS> gg

" select text you just pasted
noremap gV `[v`]

" sudo a write if you forgot to open a root owned file with sudo
cmap w!! w !sudo tee > /dev/null %

" stop the command popup window from appearing. literally why
map q: :q

" toggle for spell checking
map <F5> :setlocal spell! spelllang=en_gb<CR> 

" NERDTree keymaps
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F12> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F12>"
let g:NERDTreeMapPreview="<F11>"

" emmet keymaps
let g:user_emmet_leader_key='<C-Z>'

" EasyAlign keymaps
vmap <Enter> <Plug>(EasyAlign)

nmap ga <Plug>(EasyAlign)

" vim-expand-region keymaps
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" turn off markdown folding. literally what.
let g:vim_markdown_folding_disabled=1

au FileType go nmap <leader>i <Plug>(go-info)

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" plugin config

" vim-pad
let g:pad#dir = '/home/benp/vim-pad/'
let g:pad#window_height = 16

" syntastic

"let g:syntastic_javascript_checkers = ['jshint', 'jscs']

" gist-vim

let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1

" CtrlP

let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
  \ }

" editorconfig-vim

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" rainbow_parentheses.vim

let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" activation based on filetype
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" vim-startify
let g:startify_custom_header = map(split(system('fortune | cowsay -f tux'), '\n'), '" ". v:val') + ['','']

" copypath.vim
let g:copypath_copy_to_unnamed_register = 1

" NERDTree
let NERDTreeShowHidden=1


" let g:python_host_prog='/usr/bin/python'
" let g:python3_host_prog='/usr/bin/python3'

call plug#begin()
" general
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/Align'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'

"================================================
" Blog
"================================================
"Plug 'cespare/vim-toml'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'

"================================================
" Dev Tools
"================================================
Plug 'rking/ag.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
" Plug 'bootleq/vim-qrpsqlpq'
" Plug 'thinca/vim-quickrun'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-cucumber'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'majutsushi/tagbar' " list all methods in a file
" Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

"ruby
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-bundler'

" clojure
Plug 'tpope/vim-fireplace'
" Plug 'Olical/conjure', {'tag': 'v2.1.2', 'do': 'bin/compile'}
" Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'} "ubuntu 18.04 need run 'sudo apt install clang libclang-dev'

" Plug 'guns/vim-sexp'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'davidhalter/jedi-vim'

"================================================
" Javascript/HTML
"================================================
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-ragtag'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'andymass/vim-matchup'


"================================================
" matlab
"================================================
" function! DoRemote(arg)
"     UpdateRemotePlugins
" endfunction
" Plug 'daeyun/vim-matlab', { 'do': function('DoRemote')  }
Plug 'vim-scripts/MatlabFilesEdition'

"================================================
" php
"================================================
" Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'dsawardekar/wordpress.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'phpactor/phpactor', { 'for': 'php', 'branch': 'develop', 'do': 'composer install'  }


"================================================
" Git
"================================================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"================================================
" Enhance Vim
"================================================
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'
Plug 'austintaylor/vim-indentobject'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" Plug 'pedrohdz/vim-yaml-folds'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

silent! color nord
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set hidden
set hlsearch
set nowrap
set list " show trailing spaces
" set cursorline
set nostartofline
set mouse=a
set number
set relativenumber
set nobackup
set nowritebackup
set noswapfile
set shiftwidth=2
set tabstop=2
" set autoindent
"

" set vue
autocmd BufRead,BufNewFile *.vue setfiletype html

" set color
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

" set pmenu
highlight Pmenu ctermbg=brown gui=bold

hi Visual term=reverse cterm=reverse ctermbg=black guibg=grey60
" highlight Search guibg='Purple' guifg='NONE'
highlight Search ctermbg=yellow guibg=grey60
" highlight Normal ctermbg=black ctermfg=white

set scrolloff=3

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nmap \ ,
nnoremap ' `
nnoremap ` '
inoremap jj <ESC>
nmap <leader>ww  :w<CR>
imap <leader>ww  <ESC>:w<CR>
inoremap <leader>a  <ESC>A
inoremap <leader>2  <ESC>2la
inoremap <leader>1  <ESC>1la
noremap  ,, <C-\><C-N>
noremap  L $
noremap  H ^
noremap  <C-e>e $
inoremap <C-e>e $
inoremap <C-a>a ^
noremap! ,, <C-\><C-N>
snoremap ,, <C-\><C-N>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

noremap <leader>q  :wq!<CR>
nnoremap <leader>=  <C-W>=
nnoremap <leader>n  :set number! number?<CR>
nnoremap <Leader>hl :set hlsearch! hlsearch?<CR>
nnoremap <Leader>ps :set paste! paste?<CR>
nnoremap <leader>iw :set invwrap wrap?<CR>
nnoremap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nnoremap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nnoremap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nnoremap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>
" nnoremap <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
" nnoremap <leader>p obinding.pry<Esc>
nnoremap <leader>co oconsole.log();<Left><Left>
" nnoremap <leader>pep :%! autopep8 -<CR>

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" python execute
nnoremap <leader>rp :!python %<CR>

" php execute
nnoremap <leader>pa :!vendor\bin\phpabf %<CR>
nnoremap <leader>pc :!vendor\bin\phpcs %<CR>
nnoremap <leader>php :!php %<CR>

" rust execute
nnoremap <leader>cr :!cargo run %<CR>

" https://github.com/neovim/neovim/issues/7994#issuecomment-388296360
au InsertLeave * set nopaste

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.yml setlocal spell
" slim is slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
" git commit textwidth limit
autocmd Filetype gitcommit setlocal spell textwidth=72

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" buffer width
nnoremap <leader><C-H> :vertical resize -10<CR>
nnoremap <leader><C-J> :resize -10<CR>
nnoremap <leader><C-K> :resize +10<CR>
nnoremap <leader><C-L> :vertical resize +10<CR>


" markdown
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


" conjure
let g:conjure_map_prefix=","
let g:conjure_log_direction="horizontal"
let g:conjure_log_size_small=15


" emmet
let g:user_emmet_install_globa = 0
autocmd FileType html,css EmmetInstall



" Disable documentation window
set completeopt-=preview
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#enable_smart_case=1
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['around', 'buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources['javascript.jsx'] = ['around', 'buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources.css  = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:ctrlp_match_window = 'order:ttb,max:20'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --ignore db/ --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" " Reduce the time that signs appear when enable gitgutter
set updatetime=200

" extra rails.vim help
autocmd User Rails silent! Rnavcommand job app/jobs -glob=**/* -suffix=_job.rb

" NerdTree Setting
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let g:NERDSpaceDelims=1

"buftabline
nnoremap <Tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>

vmap <Enter>   <Plug>(EasyAlign)


" Ale
" php PSR-1,2
" let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
" let g:ale_php_phpcs_standard = 'PSR1,PSR2'
let g:ale_php_phpcs_options = '-'

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'css': ['csslint'],
\   'php': ['phpcs'],
\}
let g:ale_python_flake8_options='--max-line-length=120'
let g:ale_fixers = {
\   'python': ['autopep8'],
\   'javascript': ['eslint'],
\   'php': ['phpcbf'],
\}
" \   'html': ['tidy'],
let g:ale_fix_on_save = 1

let g:ale_statusline_format = ['E:%d', 'W:%d', 'ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = 'w'

" Jsx
" let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"for vim-autoformat
"let g:autoformat_verbosemode=1
"autocmd BufWrite *.sql,*.c,*.py,*.java,*.js :Autoformat
noremap <F3> :Autoformat<CR>

let g:indentLine_color_term = 239
" let g:indentLine_char = '|'

" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
"

" Vim-Matchup
:hi MatchParen ctermbg=blue guibg=lightblue cterm=italic gui=italic


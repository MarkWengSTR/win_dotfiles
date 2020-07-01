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
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"================================================
" Dev Tools
"================================================
Plug 'rking/ag.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
Plug 'bootleq/vim-qrpsqlpq'
Plug 'thinca/vim-quickrun'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-cucumber'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'majutsushi/tagbar' " list all methods in a file
Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

"ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" clojure
" Plug 'tpope/vim-fireplace'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-dispatch'
Plug 'Olical/conjure', {'tag': 'v2.1.2', 'do': 'bin/compile'}
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'} "ubuntu 18.04 need run 'sudo apt install clang libclang-dev'

" Plug 'guns/vim-sexp'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'davidhalter/jedi-vim'

"================================================
" Javascript/HTML
"================================================
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-ragtag'
Plug 'othree/javascript-libraries-syntax.vim'

"================================================
" matlab
"================================================
" function! DoRemote(arg)
"     UpdateRemotePlugins
" endfunction
" Plug 'daeyun/vim-matlab', { 'do': function('DoRemote')  }
Plug 'vim-scripts/MatlabFilesEdition'

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
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

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
noremap  ,, <C-\><C-N>
noremap  L $
noremap  H ^
noremap  <C-R>e $
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
nnoremap <leader>pep :%! autopep8 -<CR>

" python execute
" for WSL
vmap <leader>rp :!python3<CR>
nnoremap <leader>rp :!python3 %<CR>
" for windows
vmap <leader>rp :!python.exe<CR>
nnoremap <leader>wrp :!python.exe %<CR>

" octave execute
nnoremap <leader>oc :!octave-cli.exe %<CR>

hi Visual term=reverse cterm=reverse ctermbg=black guibg=grey60
" highlight Search guibg='Purple' guifg='NONE'
highlight Search term=reverse cterm=reverse ctermbg=black guibg=grey60
" highlight Normal ctermbg=black ctermfg=white

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


let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

" conjure
let g:conjure_map_prefix=","
let g:conjure_log_direction="horizontal"
let g:conjure_log_size_small=15


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

"================= Helper =================
for f in split(globpath('~/dotfiles/script/vim', '*.vim'), '\n')
  exe 'source' f
endfor

" run sql file to give your the result table!
" usage: <leader_key>p + j, l, r
function! s:init_qrpsqlpq()
  nmap <buffer> <Leader>p [qrpsqlpq]
  nnoremap <silent> <buffer> [qrpsqlpq]j :call qrpsqlpq#run('split')<CR>
  nnoremap <silent> <buffer> [qrpsqlpq]l :call qrpsqlpq#run('vsplit')<CR>
  nnoremap <silent> <buffer> [qrpsqlpq]r :call qrpsqlpq#run()<CR>

  if !exists('b:rails_root')
    call RailsDetect()
  endif
  if !exists('b:rails_root')
    let b:qrpsqlpq_db_name = 'amoeba_development'
  endif
  " let b:qrpsqlpq_db_name = 'nerv_development'
endfunction

if executable('psql')
  let g:qrpsqlpq_expanded_format_max_lines = -1
  autocmd FileType sql call s:init_qrpsqlpq()
endif

"buftabline
nnoremap <Tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>

vmap <Enter>   <Plug>(EasyAlign)
set t_Co=256

" " Tmux {{{
" " Bracketed Paste Mode
" " Ref http://slashdot.jp/journal/506765/Bracketed-Paste-Mode
" " - Use tmux 1.7 `paste-buffer -p` to paste
" " - Use <F11> and tmux `send-keys "\e[201~"` for pastetoggle
" if &term =~ "xterm" && exists('$TMUX')
"   let &t_ti = &t_ti . "\e[?2004h"
"   let &t_te = "\e[?2004l" . &t_te
"   let &pastetoggle = "\e[201~"
"   map <F11> <Esc>[201~
"   imap <F11> <Esc>[201~

"   function! XTermPasteBegin(ret)
"     set paste
"     return a:ret
"   endfunction

"   map <special> <expr> <Esc>[200~ XTermPasteBegin("i")
"   imap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"   cmap <special> <Esc>[200~ <nop>
"   cmap <special> <Esc>[201~ <nop>
" endif


" function! TmuxNewWindow(...)
"   let options = a:0 ? a:1 : {}
"   let text = get(options, 'text', '')
"   let title = get(options, 'title', '')
"   let directory = get(options, 'directory', getcwd())
"   let method = get(options, 'method', 'new-window')
"   let size = get(options, 'size', '40')
"   let remember_pane = get(options, 'remember_pane', 0)
"   let pane = ''

"   if method == 'last'
"     if !exists('s:last_tmux_pane') || empty(s:last_tmux_pane)
"       echohl WarningMsg | echomsg "Can't find last tmux pane. Continue with 'horizontal-split'." | echohl None
"       let method = 'h'
"     else
"       let pane = s:last_tmux_pane
"     endif
"   elseif method == 'quit'
"     if !exists('s:last_tmux_pane') || empty(s:last_tmux_pane)
"       echohl WarningMsg | echomsg "Can't find last used pane." | echohl None
"       return
"     else
"       call system('tmux kill-pane -t ' . matchstr(s:last_tmux_pane, '%\d\+'))
"       unlet! s:last_tmux_pane
"       return
"     endif
"   endif

"   if empty(pane) && method != 'new-window'
"     " use splitted pane if available
"     let pane = matchstr(
"           \   system('tmux list-pane -F "#{window_id}#{pane_id}:#{pane_active}" | egrep 0$'),
"           \   '\zs@\d\+%\d\+\ze'
"           \ )
"   endif

"   if empty(pane)
"     if method == 'new-window'
"       let cmd = 'tmux new-window -a '
"             \ . (empty(title) ? '' : printf('-n %s', shellescape(title)))
"             \ . printf(' -c %s', shellescape(directory))
"     elseif method == 'v'
"       let cmd = 'tmux split-window -d -v '
"             \ . printf('-p %s -c %s ', size, shellescape(directory))
"     elseif method == 'h'
"       let cmd = 'tmux split-window -d -h '
"             \ . printf(' -c %s ', shellescape(directory))
"     endif

"     let pane = substitute(
"           \   system(cmd . ' -P -F "#{window_id}#{pane_id}"'), '\n$', '', ''
"           \ )
"   endif

"   if remember_pane
"     let s:last_tmux_pane = pane
"   endif

"   let window_id = matchstr(pane, '@\d\+')
"   let pane_id = matchstr(pane, '%\d\+')

"   if !empty(text)
"     let cmd = printf(
"           \   'tmux set-buffer %s \; paste-buffer -t %s -d \; send-keys -t %s Enter',
"           \   shellescape(text),
"           \   pane_id,
"           \   pane_id
"           \ )
"     sleep 300m
"     call system('tmux select-window -t ' . window_id)
"     call system(cmd)
"   endif
" endfunction
" " }}}

" Ale
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'python': ['autopep8']
" \}
" let g:ale_statusline_format = ['E:%d', 'W:%d', 'ok']
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_lint_on_enter = 1
" let g:ale_set_signs = 1
" let g:ale_sign_error = 'x'
" let g:ale_sign_warning = 'w'
" Airline
" let g:airline_left_sep  = ''
" let g:airline_right_sep = ''
" let g:airline#extensions#ale#enabled = 1
" let airline#extensions#ale#error_symbol = 'E:'
" let airline#extensions#ale#warning_symbol = 'W:'
" jedi
"disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
"semshi
let g:semshi#filetypes = ['python']
let g:semshi#excluded_hl_groups = ['local']

function MyCustomHighlights()
	hi semshiGlobal      ctermfg=red guifg=#ff0000
endfunction
autocmd FileType python call MyCustomHighlights()
autocmd ColorScheme * call MyCustomHighlights()

"vim-lsp
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif

" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> <f2> <plug>(lsp-rename)
"     " refer to doc to add more commands
" endfunction

" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
"
" neomake
" python
" " When writing a buffer (no delay).
" call neomake#configure#automake('w')
" " When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" " When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('rw', 1000)
" " Full config: when writing or reading a buffer, and on changes in insert and
" " normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_python_python_exe = 'python3'
let g:neomake_open_list = 2
let g:neomake_open_list = 0
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#', }

let g:neomake_python_enable_makers = ['flake8']
" let g:neomake_python_enable_makers = ['pylint', 'flake8']
" javascript
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"for vim-autoformat
"let g:autoformat_verbosemode=1
"autocmd BufWrite *.sql,*.c,*.py,*.java,*.js :Autoformat
noremap <F3> :Autoformat<CR>

let g:indentLine_color_term = 239
" let g:indentLine_char = '|'

" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
" autocmd FileType vim,tex let b:autoformat_autoindent=0
" gg=G :retab :RemoveTrailingSpaces

" let g:formatdef_sqlformat = '"sqlformat --keywords upper -"'
" let g:formatters_sql = ['sqlformat']
" let g:formatdef_clangformat_google = '"clang-format -style google -"'
" let g:formatters_c = ['clangformat_google']

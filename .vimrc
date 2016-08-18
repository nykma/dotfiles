" ~/.vimrc
set nocompatible                " be iMproved
language en_US.UTF-8
filetype off                    " required!
set shell=/bin/bash

call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sjl/gundo.vim'
Plug 'gcmt/wildfire.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'zefei/vim-wintabs'

Plug 'Valloric/ListToggle'
Plug 'Konfekt/FastFold'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Yggdroot/indentLine'

" Powerful jump-to 
Plug 'easymotion/vim-easymotion'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

Plug 'scrooloose/syntastic'

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote')  }

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'zenbro/mirror.vim'
Plug 'KabbAmine/zeavim.vim'

" Theme
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'

Plug 'tpope/vim-fugitive'
if has('nvim')
  " Plug 'vim-airline/vim-airline'
  Plug 'janko-m/vim-test'
  Plug 'kassio/neoterm'
end

Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'

Plug 'asins/vimcdoc'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-dispatch'
Plug 'hotoo/pangu.vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'posva/vim-vue'

Plug 'jceb/vim-orgmode'
Plug 'speeddating.vim'
Plug 'SyntaxRange'
" Plug 'kylef/apiblueprint.vim'

Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'

Plug 'mrtazz/simplenote.vim'

call plug#end()

"------------------------------------------------------------
"" * General
"------------------------------------------------------------
filetype plugin indent on
syntax on
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,iso-8859-2
set shiftwidth=2
set tabstop=8
" autocmd FileType javascript,javascript.jsx,html setlocal shiftwidth=4 tabstop=4
set expandtab
set smartindent
set autoread
set autowriteall
set scrolloff=3

" set foldmethod=syntax
set foldmethod=indent
set foldlevel=2

set backspace=2 " make backspace work like most other apps
"set backspace=indent,eol,start
" 开启实时搜索功能
set incsearch
" " 搜索时大小写不敏感
set smartcase
" " vim 自身命令行模式智能补全
set wildmenu
set t_Co=256
set laststatus=2   " Always show the statusline"
set showtabline=2
set noshowmode
set nowrap
set number
set ttyfast

let mapleader=";"
let maplocalleader="\\"
let g:auto_save = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*/coverage/*,*/log/*,*/node_modules/*,*/target/*

" 显示多余的空白字符
set list listchars=tab:»·,trail:·

set tags+=gems.tags

"------------------------------------------------------------
"" * UI & Font
"------------------------------------------------------------
set mouse=a
" set guifont=Fira\ Mono\ for\ Powerline:h12
set background=dark
if has("gui_running")
  set guifont=Monoid\ Retina:h12
  set guioptions=agm
  set guicursor=n:blinkon0
  colorscheme base16-eighties
  set transparency=5
else
  let g:hybrid_use_Xresources = 0
  colorscheme hybrid
  " colorscheme solarized
endif
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
set undodir=~/.vim/undo/
set undofile

"------------------------------------------------------------
"" * Hotkeys
"------------------------------------------------------------
nmap <Leader>e $
nnoremap <Leader>w :w<CR>
nnoremap <Leader>/ :nohl<CR>
" nnoremap <Leader>WQ :wa<CR>:q<CR>
" nnoremap <Leader>Q :qa!<CR>

nnoremap <Leader>gg :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>

nmap <silent><CR> :

nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

imap <C-o> <Esc>o
nmap <silent> to :call append('.', '')<CR>j
nmap <silent> tO :call append(line('.')-1, '')<CR>k

nmap H gT
nmap L gt

iab <expr> <dts> strftime("%Y-%m-%d %H:%M:%S")
iab <expr> <ts> strftime("%s")

"------------------------------------------------------------
"" * deoplete
"------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

"------------------------------------------------------------
"" * Syntastic
"------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_always_populate_loc_list=1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'

let g:syntastic_javascript_checkers = ['jscs']
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_checker = 'clang-check'
" let g:jsx_ext_required = 0

"------------------------------------------------------------
"" * Native Status Line
"" Comment these when Airline or Powerline is enabled
" http://stackoverflow.com/a/10416234
" http://got-ravings.blogspot.jp/2008/08/vim-pr0n-making-statuslines-that-own.html
"------------------------------------------------------------
hi User1 ctermfg=black  ctermbg=blue
hi User2 ctermfg=white  ctermbg=black
hi User5 ctermfg=lightcyan  ctermbg=black
hi User7 ctermfg=lightred ctermbg=black
hi User8 ctermfg=yellow  ctermbg=black
hi User10 ctermfg=green  ctermbg=black

set statusline=
" set statusline+=%7*\[%n]                                  "buffernr
set statusline +=%1*%-.40F\                                "File+path
set statusline +=%7*\ %{tagbar#currenttag('%s','N/A')}
" set statusline+=%2*\ %y\                                  "FileType
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline +=%5*\ %=\ %{v:register}\                     "Current register
set statusline +=%2*\ 0x%04B              " UTF-8 value of current byte
set statusline +=%5*\ %{fugitive#head()}
set statusline +=%7*\ %{SyntasticStatuslineFlag()}
set statusline+=%8*\ %l/%L             "Rownumber/total (%)
" set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%5*\ \ %m%r%w                      "Modified? Readonly? Top/bot.

"------------------------------------------------------------
"" * UltiSnips
"------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"------------------------------------------------------------
"" * Multi cursor
"------------------------------------------------------------
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"------------------------------------------------------------
"" * indentLine
"------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_char = '│'

let g:SignatureMarkTextHLDynamic = 1

"------------------------------------------------------------
"" * NERDCommenter
"------------------------------------------------------------
let g:NERDSpaceDelims=1 " Add space after comment symbol.

"------------------------------------------------------------
"" * Gundo
"------------------------------------------------------------
nnoremap <Leader>ud :GundoToggle<CR>

"------------------------------------------------------------
"" * Tagbar
"------------------------------------------------------------
" nnoremap <Leader>t :Tagbar<CR>

"------------------------------------------------------------
"" * vim-wintabs
"------------------------------------------------------------

map <C-N> <Plug>(wintabs_previous)
map <C-P> <Plug>(wintabs_next)
map <C-T>c <Plug>(wintabs_close)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

" let g:wintabs_display = 'statusline'
let g:wintabs_autoclose = 2
let g:wintabs_autoclose_vimtab = 1
" let g:wintabs_ui_active_left = '['
" let g:wintabs_ui_active_right = ']'
hi! TabLine ctermfg=bg ctermbg=DarkCyan
hi! TabLineFill ctermfg=bg ctermbg=DarkCyan
hi! TabLineSel ctermfg=black ctermbg=Blue

"------------------------------------------------------------
"" * vim-test
"------------------------------------------------------------
if has('nvim')
  nmap <silent> <leader>tt :TestNearest<CR>
  nmap <silent> <leader>tT :TestFile<CR>
  nmap <silent> <leader>ta :TestSuite<CR>
  nmap <silent> <leader>tl :TestLast<CR>
  nmap <silent> <leader>tg :TestVisit<CR>
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
end

"------------------------------------------------------------
"" * rainbow
"------------------------------------------------------------
" let g:rainbow_active=1

"------------------------------------------------------------
"" * wildfire
"------------------------------------------------------------
map <SPACE><SPACE> <Plug>(wildfire-fuel)
"vmap <SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip", "i/"]

"------------------------------------------------------------
"" * Powerline && Airline (only for NeoVim)
"------------------------------------------------------------
" if !has('nvim')
  " let g:Powerline_symbols = 'fancy'
  " set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim
" else
  " let g:airline_powerline_fonts = 1
  " " let g:airline#extensions#tabline#enabled = 1
" end

"------------------------------------------------------------
"" * Tabular
"------------------------------------------------------------
"if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
"endif


"------------------------------------------------------------
"" * Emmet
"------------------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby,javascript.jsx EmmetInstall
let g:user_emmet_leader_key='<Leader>'

"------------------------------------------------------------
"" * CtrlP
"------------------------------------------------------------
" let g:ctrlp_map = '<Leader>p'
" let g:ctrlp_cmd = 'CtrlP'
" map <Leader>P <ESC>:CtrlPTag<CR>
" let g:ctrlp_custom_ignore = {
  " \ 'dir':  '\v[\/]\.(git)$',
  " \ 'file': '\v\.(log|jpg|png|jpeg)$',
  " \ }


"------------------------------------------------------------
"" * Unite
"------------------------------------------------------------
" let g:unite_source_history_yank_enable = 1
" nnoremap <space>p :Unite -buffer-name=file_rec file_rec/async -auto-preview<cr>
" nnoremap <space>/ :Unite -buffer-name=PT grep:.<CR>
" nnoremap <space>g :Unite -buffer-name=PT grep:. -buffer-name=PT<CR><C-R><C-W>
" nnoremap <space>y :Unite -buffer-name=History\ -\ Yank history/yank<cr>
" nnoremap <space>s :Unite -buffer-name=Quick\ match  -quick-match buffer<cr>
" nnoremap <space>b :Unite -buffer-name=Buffer buffer<cr>
" nnoremap <space>t :Unite -buffer-name=Outline outline<cr>
" nnoremap <space>a :UniteBookmarkAdd <cr>
" nnoremap <space>c :Unite -buffer-name=Bookmark bookmark<CR>
" nnoremap <space>m :Unite -buffer-name=Most\ recent\ used file_mru<CR>
" nnoremap <space>l :UniteResume<CR>
" nnoremap <space>f :UniteWithBufferDir -buffer-name=Files file<CR>
" " カーソル位置の単語をgrep検索

" "インサートモードで開始
" "let g:unite_enable_start_insert = 1
" ""最近開いたファイル履歴の保存数
" let g:unite_source_file_mru_limit = 10
" let g:unite_source_file_mru_filename_format = ''
" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings()
  " nmap <buffer> <ESC> <Plug>(unite_exit)
  " nnoremap <silent> <buffer> <expr> <C-x> unite#do_action('split')
  " inoremap <silent> <buffer> <expr> <C-x> unite#do_action('split')
  " nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabnew')
  " inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabnew')
  " nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  " inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
" endfunction

" " 大文字小文字を区別しない
" let g:unite_enable_ignore_case = 1
" let g:unite_enable_smart_case = 1

" let g:neoyank#file = '~/.vim/unite/neoyank/file'

" if executable('pt')
  " let g:unite_source_grep_command = 'pt'
  " let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  " let g:unite_source_grep_recursive_opt = ''
" endif

"------------------------------------------------------------
"" * fzf.vim
"------------------------------------------------------------
set rtp+=~/.vim/bundle/fzf/bin/fzf
map <Space>m :Marks<cr>
map <Space>b :Buffers<cr>
map <Space>f :GitFiles<cr>
map <Space>F :Files<cr>
map <Space>p :Commands<cr>
map <Space>l :BLines<cr>
map <Space>h :History<cr>
map <Space>t :Tags<cr>
map <Space>s :Snippets<cr>
map <Space>c :Commits<cr>

let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'

"------------------------------------------------------------
"" * CtrlSF
"------------------------------------------------------------
map <Space>/ <Plug>CtrlSFPrompt
map <Space>? :CtrlSFToggle<CR>
let g:ctrlsf_auto_close = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_ackprg = '/usr/bin/pt'
let g:ctrlsf_extra_backend_args = {
  \ 'pt': '--home-ptignore' }
let g:ctrlsf_ignore_dir = ['bower_components', 'npm_modules']

"------------------------------------------------------------
"" * NerdTREE
"------------------------------------------------------------
map <Leader><tab> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['node_modules$[[dir]]', '.o$[[file]]', '\~$', '.d$[[dir]]']

" map <Leader>cc :NERDComToggleComment<CR>

"------------------------------------------------------------
"" * EasyMotion
"------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

nmap t <Plug>(easymotion-t2)
nmap s <Plug>(easymotion-s2)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"
" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)")

map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)


"------------------------------------------------------------
"" * Ruby
"------------------------------------------------------------
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails=1

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python,javascript,javascript.jsx,json,conf autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"------------------------------------------------------------
"" * EasyGrep
"------------------------------------------------------------
" let g:EasyGrepCommand = 1 " Use grepprg
" set grepprg=pt\ -e

"------------------------------------------------------------
"" * PanGu
"------------------------------------------------------------
" autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

"------------------------------------------------------------
"" * `terminal` buffer of neovim
"------------------------------------------------------------

if has('nvim')
  nnoremap <A-C-s> :vsp term://fish<CR>
  nnoremap <A-C-i> :sp term://fish<CR>
  nnoremap <A-C-t> :tabnew term://fish<CR>
  " tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> :wincmd h<CR>
  nnoremap <A-j> :wincmd j<CR>
  nnoremap <A-k> :wincmd k<CR>
  nnoremap <A-l> :wincmd l<CR>
end

"------------------------------------------------------------
"" * vim-ref
"------------------------------------------------------------
" let g:ref_open = 'vsplit'
" let g:ref_refe_cmd = "rurema"
" let g:ref_refe_version = 2

" nnoremap <Leader>rr :<C-U>Ref refe<Space>

"------------------------------------------------------------
"" * mirror.vim
"------------------------------------------------------------
let g:mirror#config_path = expand('~/.vim/mirrors')
let g:mirror#cache_dir = '/tmp/mirror.vim'
let g:mirror#diff_layout = 'vsplit'
let g:netrw_silent=0

"------------------------------------------------------------
"" * neocomplete.vim
"------------------------------------------------------------
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"------------------------------------------------------------
"" * Diag
"------------------------------------------------------------
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

"------------------------------------------------------------
"" * SimpleNote
"------------------------------------------------------------
source ~/.config/simplenoterc
let g:SimplenoteListHeight=20
let g:SimplenoteNoteFormat="[%F](%D) %N%>%T"
let g:SimplenoteStrftime="%Y-%m-%d %T"
let g:SimplenoteFiletype="markdown"

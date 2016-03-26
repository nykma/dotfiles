" ~/.vimrc
set nocompatible                " be iMproved
filetype off                    " required!
set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" Install Vundle first by running:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'gmarik/Vundle.vim'

"my Plugin here:
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
"Plugin 'sukima/xmledit'
Plugin 'sjl/gundo.vim'
Plugin 'gcmt/wildfire.vim'
" Plugin 'athanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'klen/python-mode'

Plugin 'Valloric/ListToggle'
Plugin 'Konfekt/FastFold'
" Plugin 'digitaltoad/vim-jade'
" Plugin 'pangloss/vim-javascript'
" Plugin 'othree/yajs.vim'
" Plugin 'mxw/vim-jsx'
" Plugin 'mattn/emmet-vim'
" Plugin 'tpope/vim-projectionist'
" Plugin 'tfnico/vim-gradle'

Plugin 'dyng/ctrlsf.vim'
Plugin 'AndrewRadev/splitjoin.vim'

" Powerful jump-to 
Plugin 'easymotion/vim-easymotion'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'
" Plugin 'thinca/vim-ref'
Plugin 'zenbro/mirror.vim'

" Theme
" Plugin 'chriskempson/base16-vim'
" Plugin 'altercation/vim-colors-solarized'
"Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'w0ng/vim-hybrid'

" IM Intergration
" Plugin 'fcitx.vim'

" Git command: https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'
if has('nvim')
  Plugin 'bling/vim-airline'
  Plugin 'janko-m/vim-test'
  Plugin 'kassio/neoterm'
end
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'nathangrigg/vim-beancount'
" Plugin 'keith/swift.vim'
Plugin 'asins/vimcdoc'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-dispatch'
Plugin 'hotoo/pangu.vim'


" Unite
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'basyura/unite-rails'
Plugin 'thinca/vim-unite-history'
Plugin 'h1mesuke/unite-outline'
Plugin 'Shougo/neocomplete.vim'

Plugin 'terryma/vim-multiple-cursors'
" Plugin 'antoyo/vim-licenses'
" Rust intergration
" Plugin 'rust-lang/rust.vim'
"Plugin 'phildawes/racer'
" Plugin 'elixir-lang/vim-elixir'
" Plugin 'avdgaag/vim-phoenix'

" Plugin 'vimwiki/vimwiki'

" Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
" Plugin 'posva/vim-vue'
" Plugin 'TAKAyukiatkwsk/vim-mongoid-syntax'
" Plugin 'hallison/vim-ruby-sinatra'
" Plugin 'slim-template/vim-slim'

Plugin 'dkprice/vim-easygrep'
Plugin 'kshenoy/vim-signature'

call vundle#end()

"------------------------------------------------------------
"" * General
"------------------------------------------------------------
filetype plugin indent on
syntax on
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set shiftwidth=2
set tabstop=2
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
set guioptions=agm
" set guifont=Fira\ Mono\ for\ Powerline:h12
set guifont=Monoid\ Retina:h12
set background=dark
if has("gui_running")
  set guicursor=n:blinkon0
  colorscheme base16-eighties
  set transparency=5
else
  let g:hybrid_use_Xresources = 1
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
nmap <Leader>b 0
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
"------------------------------------------------------------
"" * Syntastic
"------------------------------------------------------------
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list=1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
let g:syntastic_javascript_checkers = ['jscs']

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

" 保存快捷键
" map <leader>SS :mksession! ~/.vim/my.vim<cr> :wviminfo! ~/.vim/my.viminfo<cr>
" 恢复快捷键
" map <leader>RS :source ~/.vim/my.vim<cr> :rviminfo ~/.vim/my.viminfo<cr>

"------------------------------------------------------------
"" * Gundo
"------------------------------------------------------------
nnoremap <Leader>ud :GundoToggle<CR>

"------------------------------------------------------------
"" * Tagbar
"------------------------------------------------------------
" nnoremap <Leader>t :Tagbar<CR>


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
if !has('nvim')
  let g:Powerline_symbols = 'fancy'
  set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim
else
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
end

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
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <Leader>P <ESC>:CtrlPTag<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }


"------------------------------------------------------------
"" * Unite
"------------------------------------------------------------
let g:unite_source_history_yank_enable = 1
nnoremap <space>p :Unite -buffer-name=file_rec file_rec/async -auto-preview<cr>
nnoremap <space>/ :Unite -buffer-name=PT grep:.<CR>
nnoremap <space>g :Unite -buffer-name=PT grep:. -buffer-name=PT<CR><C-R><C-W>
nnoremap <space>y :Unite -buffer-name=History\ -\ Yank history/yank<cr>
nnoremap <space>s :Unite -buffer-name=Quick\ match  -quick-match buffer<cr>
nnoremap <space>b :Unite -buffer-name=Buffer buffer<cr>
nnoremap <space>t :Unite -buffer-name=Outline outline<cr>
nnoremap <space>a :UniteBookmarkAdd <cr>
nnoremap <space>c :Unite -buffer-name=Bookmark bookmark<CR>
nnoremap <space>m :Unite -buffer-name=Most\ recent\ used file_mru<CR>
nnoremap <space>l :UniteResume<CR>
nnoremap <space>f :UniteWithBufferDir -buffer-name=Files file<CR>
" カーソル位置の単語をgrep検索

"インサートモードで開始
"let g:unite_enable_start_insert = 1
""最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 10
let g:unite_source_file_mru_filename_format = ''
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  nnoremap <silent> <buffer> <expr> <C-x> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-x> unite#do_action('split')
  nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabnew')
  inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabnew')
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:neoyank#file = '~/.vim/unite/neoyank/file'

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

"------------------------------------------------------------
"" * NerdTREE
"------------------------------------------------------------
map <Leader><tab> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['node_modules$[[dir]]', '.o$[[file]]', '\~$', '.d$[[dir]]']

" map <Leader>cc :NERDComToggleComment<CR>


"------------------------------------------------------------
"" * Syntastic
"------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:jsx_ext_required = 0


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
let g:EasyGrepCommand = 1 " Use grepprg
set grepprg=pt\ -e

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
let g:mirror#config_path = '~/.vim/mirrors'
let g:mirror#cache_dir = '/tmp/mirror.vim'

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

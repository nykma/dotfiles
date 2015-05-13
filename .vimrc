" ~/.vimrc
set nocompatible                " be iMproved
filetype off                    " required!
set shell=/bin/sh
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" Install Vundle first by running:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Bundle 'gmarik/Vundle.vim'

"my Plugin here:
"
" original repos on github
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'sukima/xmledit'
Plugin 'sjl/gundo.vim'
"Plugin 'athanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'
Plugin 'klen/python-mode'
Plugin 'Valloric/ListToggle'
Plugin 'SirVer/ultisnips'
Plugin 'digitaltoad/vim-jade'
Plugin 'mattn/emmet-vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 't9md/vim-quickhl'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ryanoasis/vim-webdevicons'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'vim-ruby/vim-ruby'
Plugin 'edkolev/tmuxline.vim'
Plugin 'asins/vimcdoc'
Plugin 'TimothyYe/vim-tips'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'terryma/vim-multiple-cursors'

"..................................
" vim-scripts repos
Plugin 'YankRing.vim'
Plugin 'vcscommand.vim'
Plugin 'ShowPairs'
Plugin 'SudoEdit.vim'
Plugin 'Rename.vim'
Plugin 'EasyGrep'
Plugin 'VOoM'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tmux-plugins/vim-tmux-focus-events'
" Plugin 'VimIM'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-dispatch'
"..................................
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
"......................................

call vundle#end()

filetype plugin indent on
syntax on
set encoding=utf-8
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set autoread
set autowrite
set scrolloff=3

set foldmethod=indent
set foldlevel=2

set backspace=2 " make backspace work like most other apps
"set backspace=indent,eol,start

let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:indentLine_color_term = 239
let g:indentLine_char = '│'


let mapleader=";"

"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '.vim/Plugin/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
""Do not ask when starting vim
"let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list=1
" let g:Powerline_colorscheme='solarized256'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

let g:rainbow_active=1

"map <F5> :call CompileRunGpp()<cr>
"func! CompileRunGpp()
	"exec "w"
	"exec "!clang++ % -o %<.out"
	"exec "! ./%<.out"
"endfunc

map <F2> :Rake<CR>
map <F3> :.Rake<CR>

"powerline的设置
" let g:Powerline_symbols = 'fancy'

set nocompatible
set t_Co=256
set laststatus=2   " Always show the statusline"
" 显示光标当前位置
set ruler
" " 开启行号显示
set number
" " 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch

nmap <Leader>] :TagbarToggle<CR>

nmap <Leader>b 0
nmap <Leader>e $
" 设置快捷键将选中文本块复制至系统剪贴板
" vnoremap <Leader>y "+y
" " 设置快捷键将系统剪贴板内容粘贴至 vim
" nmap <Leader>p "+p
" " 定义快捷键关闭当前分割窗口
" nmap <Leader>q :q<CR>
"nmap <Leader>qq :q<CR>
" " 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" " 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" " 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" " 依次遍历子窗口
" nnoremap nw <C-W><C-W>
" " 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" " 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" " 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" " 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" " 定义快捷键在结对符之间跳转，助记pair
"nmap <Leader>` %"
"nnoremap <S-Up> <C-W>k
"nnoremap <S-Down> <C-W>j
"nnoremap <S-Left> <C-W>h
"nnoremap <S-Right> <C-W>l

let g:auto_save = 1

nmap <Leader>/ :nohlsearch<CR>
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall
let g:user_emmet_leader_key='<Leader>'

let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <Leader>P <ESC>:CtrlPLine<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*/coverage/*,*/log/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

let g:unite_source_history_yank_enable = 1
nnoremap <space>p :Unite file_rec/async -auto-preview<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>b :Unite buffer<cr>
nnoremap <space>a :UniteBookmarkAdd <cr>
nnoremap <space>c :Unite bookmark<CR>
nnoremap <space>m :Unite file_mru<CR>
nnoremap <space>f :UniteWithBufferDir -buffer-name=files file<CR>

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
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <Leader><tab> <ESC>:NERDTreeToggle<CR>

"map <Leader>cc :NERDComToggleComment<CR>
" 开启实时搜索功能
set incsearch
" " 搜索时大小写不敏感
set smartcase
" " vim 自身命令行模式智能补全
set wildmenu

set mouse=a

" Settings for Syntastic
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set background=dark
colorscheme base16-eighties

if has('gui_running')
      Plugin 'vim-multiple-cursors'
endif

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails=1

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" 只插空行不进模式
nmap <silent> to :call append('.', '')<CR>j
nmap <silent> tO :call append(line('.')-1, '')<CR>k

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

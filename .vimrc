" VIM基本配置==========================================================

" 关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
" 配置backspace键工作方式
set backspace=indent,eol,start

" 显示行号
set number
set numberwidth=1
" 设置在编辑过程中右下角显示光标的行列信息
set ruler
" 当一行文字很长时取消换行
" set nowrap

" 在状态栏显示正在输入的命令
set showcmd

" 设置历史记录条数
set history=1000

" 设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

" 突出现实当前行列
set cursorline
" set cursorcolumn

" 设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

" 设置C/C++方式自动对齐
set autoindent
set cindent

" 开启语法高亮功能
syntax enable
syntax on

" 指定配色方案为256色
set t_Co=256

" 配色方案
set background=dark
colorscheme fokus

" 设置搜索时忽略大小写
set ignorecase
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索） 
set incsearch 
" 在搜索时，高亮显示搜索内容
set hlsearch
" 设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
"set mouse=a

" 设置Tab宽度
set tabstop=4
" 设置自动对齐空格数
set shiftwidth=4
" 设置按退格键时可以一次删除4个空格
set softtabstop=4
" 设置按退格键时可以一次删除4个空格
set smarttab

" 将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set noexpandtab
%retab!

" 设置编码方式
set encoding=utf-8
" 自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"set fileencodings=gb2312,gb18030,utf-8
"set termencoding=gb2312
"set encoding=prc
"set fileencodings=utf-8,gbk 

autocmd BufEnter *.pc set filetype=esqlc

" 检测文件类型
filetype on
" 针对不同的文件采用不同的缩进方式
filetype indent on
" 允许插件
filetype plugin on
" 启动智能补全
filetype plugin indent on
" 代码长度提示
set colorcolumn=81
set cc=90
" 长度提示颜色 vim
highlight CursorLine cterm=NONE ctermbg=blue ctermfg=white
" 长度提示颜色 gvim
" highlight ColorColumn guibg=Red

let mapleader = ","
" select the current word
noremap <space> viw
" turn next file
noremap <C-n> :bn<CR>
" delete the current line
" noremap - dd
" go to the beginning of the current line
nnoremap H ^
" go to the end of the current line
nnoremap L $
" surround the word in double quotes!
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" surroudn the word in single quotes!
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" uppercase the current word in normal mode
nnoremap <c-u> viwUee
" uppercase the current word in visual mode
vnoremap \ U
" surround the selected texts
vnoremap <leader>' '><esc>a"<esc>'<i"<esc>
vnoremap <leader>" '<<esc>i"<esc>'>a"<esc>
" vnoremap <leader>" `<<esc>i"<esc>`>a"
" <esc>le<viw>'>i"<esc>h<viw>
" it's quite handy; this enables continuous using of 'dd'
inoremap <c-d> <esc>ddi
" convert a word into uppercase
inoremap <c-u> <esc>e<space>\i
" escape in insert mode
"inoremap jk <esc>
"inoremap <esc> <nop>

" edit my .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" abbreviations setting
iabbrev @@ chenjinlei456@sina.com
iabbrev wb weibo.com/chenjinlei
iabbrev dt 2015/09/03
iabbrev ccopy Copyright 2013 James CHEN, all rights reserved.


" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" vundle配置===============================================================
set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
     
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
  
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'ctrlp.vim'
" ...
  
filetype plugin indent on     " required!
    "
    " Brief help  -- 此处后面都是vundle的使用命令
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Bundle command are not allowed..
    "=========================================================================


" vim-powerline Download
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
" vim-powerline setting
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8
set tags=tags;

" nerd tree
Bundle 'The-NERD-tree'
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

" nerd commenter
Bundle 'The-NERD-Commenter'

let NERDShutUp=1

" 支持单行和多行的选择，//格式
map <c-h> ,c<space>

" 垂直对齐线
Bundle 'https://github.com/nathanaelkane/vim-indent-guides.git'

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" 配置YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = 
"'~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 匹配语言关键字
let g:ycm_seed_identifiers_with_syntax = 0
" 检查错误
let g:ycm_error_symbol = '>>'
" 检查警告
let g:ycm_warning_symbol = '>*'
" 按,jd 会跳转到定义
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_extra_conf_vim_data = ['&filetype']
"let g:ycm_extra_conf_vim_data = []
let g:ycm_auto_trigger = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

" 配置ctags路径
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" 配置taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1


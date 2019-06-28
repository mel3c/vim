"------>基础设置<------
set nu                          "显示行号
set relativenumber              "行号相对模式
set hidden                      "允许切换缓冲区
set autoread                    "自动重新读入
set autowrite                   "自动保存
set autochdir                   "设置当前文件为当前工作路径
set novisualbell                "关闭光标闪烁
set noerrorbells                "关闭告警声
set nocompatible                "关闭兼容模式
syntax on                       "开启高亮
filetype plugin indent on       "打开文件类型检测

set t_Co=256
set history=400                 "历史记录数
set scrolloff=3                 "光标到顶或底时保持3行距离
set laststatus=2                "倒数第二行显示状态栏，0 时关闭状态栏
set shortmess=atI               "关闭乌干达信息
set ambiwidth=double            "防止特殊符号无法正常显示
set clipboard+=unnamed          "共享剪切板
set backspace=indent,eol,start  "设置退格键删除

set viminfo+=!                  "恢复文件上次打开的地方
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"------>关闭press enter for function<------
set shortmess=a

"------>编码设置<------
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,chinese,cp936,latin-1,chinese,ucs-bom
language messages zh_CN.utf-8   "解决consle输出乱码

"------>备份设置<------
set nobackup                    "从不备份
set noswapfile                  "禁止生成临时文件

"------>行列设置<------
hi LineNr           cterm=None      ctermfg=7       ctermbg=0   "行号  [8 for xshell, 0 for mac]
hi CursorLine       cterm=None      ctermfg=None    ctermbg=0   "光标行[8 for xshell, 0 for mac]
hi CursorColumn     cterm=None      ctermfg=None    ctermbg=0   "光标列[8 for xshell, 0 for mac]
set cursorline                  "高亮当前行
set cursorcolumn                "高亮当前列
set background=light            "背景为浅色

"------>搜索设置<------
set incsearch                   "开启实时搜索
set hlsearch                    "高亮显示结果"
set nowrapscan                  "关闭重复搜索
set ignorecase	                "忽略大小写

"------>缩进设置<------
set expandtab                   "把tab键当空格来处理
set shiftwidth=4                "把tab当空格处理
set smarttab                    "按一次backspace就删除4个空格
set tabstop=4                   "设置tab键的宽度
set softtabstop=4               "统一缩进为4
set autoindent                  "开启自动对齐
set smartindent                 "C编程智能自动缩进
set formatoptions=tcrqn         "自动格式化

"------>设置Leader键<------
let mapleader="\<Space>"

"------>插件管理<------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
call plug#begin('~/.vim/bundle')
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'}

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'elzr/vim-json'

Plug 'fatih/vim-go'
Plug 'rhysd/git-messenger.vim'
Plug 'mattn/emmet-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'pangloss/vim-javascript'
call plug#end()

"------>bling/vim-bufferline设置<------
let g:bufferline_show_bufnr = 0

"------>bronson/vim-trailing-whitespace设置<------
"fix快速删除行尾的空格
nmap fix :FixWhitespace<CR>

"------>majutsushi/tagbar设置<------
"let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_ctags_bin='/usr/local/opt/ctags-exuberant/bin/ctags' "for mac
let g:tagbar_width=60
let g:tagbar_autofocus = 1
let g:tagbar_left = 0
let g:tagbar_expand = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
nmap tl :Tagbar<CR>

"------>scrooloose/syntastic设置<------
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1  "是否打开文件时检查
let g:syntastic_check_on_wq = 1      "是否保存文件时检查
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1
let g:pyflakes_use_quickfix = 0     "弥补syntastic只能打开和保存才检查语法的不足 kevinw/pyflakes-vim
let python_highlight_all = 1        "for python.vim syntax highlight hdima/python-syntax\

"------>mileszs/ack.vim设置<------
let g:ackprg = 'ag --nogroup --nocolor --column'    "需要ag命令支持
nnoremap <c-a> :Ack! -i<Space>

"------>Yggdroot/LeaderF设置<------
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_CommandMap = {'<C-C>': ['<Esc>', '<C-C>']}
let g:Lf_WindowHeight = 0.4
highlight Lf_hl_match       cterm=bold ctermfg=5
highlight Lf_hl_matchRefine cterm=bold ctermfg=201
noremap <c-f> :LeaderfLine<cr>
noremap <c-o> :LeaderfMru<cr>
noremap <c-n> :LeaderfFunction<cr>

"------>Valloric/YouCompleteMe设置<------
set report=0
set completeopt-=preview
set fillchars=vert:\ ,stl:\ ,stlnc:\

"补全窗口样式配色
highlight Pmenu     cterm=bold  ctermfg=7   ctermbg=4
highlight PmenuSel  cterm=bold  ctermfg=7   ctermbg=3

let loaded_matchparen = 1                       "关闭高亮括号匹配
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:ycm_complete_in_comments=1                "补全功能在注释中同样有效
let g:ycm_seed_identifiers_with_syntax=1        "语法关键字补全
let g:ycm_cache_omnifunc=0                      "禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_min_num_of_chars_for_completion=1     "从第一个键入字符就开始罗列匹配项

"------>fatih/vim-go设置<------
let g:go_def_mode="godef"
let g:go_fmt_command="goimports"
let g:go_fmt_autosave=1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:godef_same_file_in_same_window=1
let g:syntastic_go_checkers=['golint', 'govet', 'errcheck']
let g:syntastic_mode_map={'mode':'active', 'passive_filetypes':['go']}
nnoremap go :GoRun<CR>
nnoremap gi :GoInstall<CR>

"------>tpope/vim-markdown设置<------
let g:bookmark_no_default_key_mappings = 1
nmap <silent><leader>m <Plug>BookmarkToggle
nmap <silent><leader>i <Plug>BookmarkAnnotate
nmap <silent><leader>a <Plug>BookmarkShowAll
nmap <silent><leader>n <Plug>BookmarkNext
nmap <silent><leader>p <Plug>BookmarkPrev
nmap <silent><leader>c <Plug>BookmarkClearAll
let g:bookmark_sign            = '⚑'
let g:bookmark_highlight_lines = 0

"------>快捷键设置<------
"左右分割窗口
noremap wv <c-w>v
"关闭当前分割的窗口
noremap wd <c-w>c
"上下分割窗口
noremap ws <c-w>s
"光标移动到左边窗口
noremap <c-h> <c-w>h
"光标移动到右边窗口
noremap <c-l> <c-w>l
"光标移动到上面窗口
noremap <c-k> <c-w>k
"光标移动到下面窗口
noremap <c-j> <c-w>j

"大写H 移动光标到行首
noremap H ^
"大写L 移动光标到行尾
noremap L $
"F2打开/关闭行号
noremap <F2> :set nonumber! number?<CR>

"移动光标到右边的buffer
nmap } :bn<CR>
"移动光标到左边的buffer
nmap { :bp<CR>
"删除一个buffer
nmap bd :bd<CR>
"关闭others Buffer
function! BufCloseOthers()
   let l:currentBufNum   = bufnr("%")
   for i in range(1,bufnr("$"))
     if buflisted(i)
       if i!=l:currentBufNum
         execute("bdelete ".i)
       endif
     endif
   endfor
endfunction
noremap ba :call BufCloseOthers()<CR>

"C+h 左移光标
inoremap <c-h> <Left>
"C+l 右移光标
inoremap <c-l> <Right>
"C+k 上移光标
inoremap <c-k> <Up>
"C+j 下移光标
inoremap <c-j> <Down>
"fd退出
inoremap fd <ESC>

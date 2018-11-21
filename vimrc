"------>开启语法高亮<------
syntax enable
syntax on

"------>备份文件设置<------
set nobackup    "从不备份
set noswapfile  "禁止生成临时文件

"------>编码格式设置<------
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,chinese,cp936,latin-1,chinese,ucs-bom
language messages zh_CN.utf-8   "解决consle输出乱码

"------>基础设置<------
"set mouse=n                    "全局启用鼠标
set nu                          "显示行号
set nocp                        "让vim在不兼容的模式下工作
"set nowrap	                    "不要换行
set hidden                      "允许在有未保存的修改时切换缓冲区
set showmatch                   "代码匹配
set autoread                    "文件在vim之外修改过，自动重新读入
set autowrite                   "开启自动保存
set novisualbell                "不要光标闪烁
set noerrorbells                "不让vim发出滴滴声
set nocompatible                "关闭兼容模式
filetype plugin indent on       "打开文件类型检测

set t_Co=256
set history=400                 "历史记录数
set scrolloff=3                 "光标到顶或底时保持3行距离
set laststatus=2                "状态栏显示在倒数第二行，0 时关闭状态栏
set shortmess=atI               "启动的时候不显示乌干达信息
set ambiwidth=double            "防止特殊符号无法正常显示
set clipboard+=unnamed          "共享剪切板
set backspace=indent,eol,start  "设置退格键可用

"------>主题设置<------
colorscheme desert              "设置主题为desert.vim
autocmd InsertEnter * se cul    "用浅色高亮当前行
set cursorline                  "设置当前行，需要deset.vim配合使用
set cursorcolumn                "设置当前列 同上
set background=light

"------>文件搜索设置<------
set incsearch          "开启实时搜索功能
set hlsearch           "开启高亮显示结果"
set nowrapscan         "搜索到文件两端时不重新搜索
set ignorecase	       "设置搜索时忽略大小写

"------>缩进风格设置<------
set expandtab               "把tab键当空格来处理
set shiftwidth=4            "把tab当空格处理
set smarttab                "按一次backspace就删除4个空格
set tabstop=4               "设置tab键的宽度
set softtabstop=4           "统一缩进为4
set autoindent              "开启自动对齐
set cindent                 "自动按照C的格式进行缩进
set cindent shiftwidth=4    "自动缩进4个空格
set smartindent             "C编程智能自动缩进
set formatoptions=tcrqn     "自动格式化

"------>恢复文件上次打开的位置<------
set viminfo+=!
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"------>代码折叠设置<------
"set foldenable                  "允许折叠
"set foldcolumn=2                "设置折叠栏宽度
"set foldmethod=syntax           "用语法高亮来定义折叠
"set foldlevel=100               "启动vim时不要自动折叠代码
""zr展开所有折叠
"nnoremap rr zR
""zm关闭所有折叠
"nnoremap mm zM
""空格键打开/关闭折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"------>基础快捷键映射<------
"左右分割窗口
nnoremap wv <c-w>v
"关闭当前分割的窗口
nnoremap wd <c-w>c
"上下分割窗口
nnoremap ws <c-w>s
"光标移动到左边窗口
nnoremap h <c-w>h
"光标移动到右边窗口
nnoremap l <c-w>l
"光标移动到上面窗口
nnoremap k <c-w>k
"光标移动到下面窗口
nnoremap j <c-w>j
"大写H 移动光标到行首
nnoremap H ^
"大写L 移动光标到行尾
nnoremap L $
"F2打开/关闭行号
nnoremap <F2> :set nonumber! number?<CR>
"移动光标到右边的buffer
nnoremap ] :bn<CR>
"移动光标到左边的buffer
nnoremap [ :bp<CR>
"删除一个buffer
nnoremap bb :bd<CR>
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

"======================================插件管理==============================================
"------>使用plug.vim管理插件<------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
call plug#begin('~/.vim/bundle')
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-bufferline'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'bronson/vim-trailing-whitespace'
Plug 'fatih/vim-go'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
call plug#end()
"=========================================================================================

"------>bronson/vim-trailing-whitespace参数设置<------
"fix快速删除行尾的空格
nmap fix :FixWhitespace<CR>

"------>majutsushi/tagbar插件设置<------
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=60
let g:tagbar_autofocus = 1
let g:tagbar_left = 0
let g:tagbar_expand = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
nmap tl :Tagbar<CR>

"------>scrooloose/nerdtree插件设置<------
let NERDTreeMinimalUI=1             "不显示'Bookmarks' label 'Press ? for help'
let NERDChristmasTree=1             "显示增强
let NERDTreeAutoCenter=1            "自动调整焦点
let NERDTreeMouseMode=2             "鼠标模式:目录单击,文件双击
let NERDTreeWinSize=50              "窗口宽度
let NERDTreeShowFiles=1             "显示文件
let NERDTreeShowHidden=0            "显示隐藏文件
let NERDTreeShowLineNumbers=1       "显示行号
let NERDTreeWinPos='left'           "窗口位置
let NERDTreeHighlightCursorline=1   "高亮显示当前文件或目录
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$','\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
let g:NERDTreeDirArrows=0           "显示箭头，0传统+号
let g:NERDTreeQuitOnOpen=1          "打开文件后自动关闭
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
nmap <silent> nt :NERDTreeToggle<CR>

"------>Yggdroot/indentLine插件设置<------
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|' "¦

"------>scrooloose/syntastic插件设置<------
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

"==============LeaderF插件设置===================
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_CommandMap = {'<C-C>': ['<Esc>', '<C-C>']}
let g:Lf_WindowHeight = 0.3
highlight Lf_hl_match cterm=bold ctermfg=5
highlight Lf_hl_matchRefine cterm=bold ctermfg=201
"===========================================

"------>fatih/vim-go插件设置<------
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let g:go_fmt_command = "goimports"
nnoremap go :GoRun<CR>
nnoremap gi :GoInstall<CR>
nnoremap gb :GoBuild<CR>
nnoremap doc :GoDoc<CR>

let g:go_fmt_command="goimports"
let g:go_fmt_autosave=1
let g:syntastic_go_checkers=['golint', 'govet', 'errcheck']
let g:syntastic_mode_map={'mode':'active', 'passive_filetypes':['go']}

"---------------------------------------------------
"CSS HTML
"---------------------------------------------------
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head"

"------>Valloric/YouCompleteMe代码补全插件设置<------
set report=0                                    "告诉我们哪一行被改变过
set completeopt-=preview                        "补全内容不以分割子窗口形式出现，只显示补全列表
set fillchars=vert:\ ,stl:\ ,stlnc:\

"补全窗口菜单样式配色
highlight Pmenu     cterm=bold ctermfg=None    ctermbg=blue
highlight PmenuSel  cterm=bold ctermfg=None    ctermbg=4

let loaded_matchparen = 1                       "关闭高亮括号匹配
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:ycm_complete_in_comments=1                "补全功能在注释中同样有效
let g:ycm_seed_identifiers_with_syntax=1        "语法关键字补全
let g:ycm_cache_omnifunc=0                      "禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_min_num_of_chars_for_completion=1     "从第一个键入字符就开始罗列匹配项

"---------------------------------------------------
"  "  < cscope 工具配置 >
"---------------------------------------------------
if has("cscope")
    set csto=0
    set cspc=3
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    "查找C语言符号，即查找函数名、宏、枚举值等出现的地方
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    "列出当前字符串的全局定义处
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    "查找本函数调用的函数
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    "查找调用此函数的函数
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    "查找egrep模式，相当于egrep功能，但查找速度快多了
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    "查找包含本文件的文件
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "查找并打开文件，类似vim的find功能
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
endif
"
"set tags=./tags;


"---------------------------------------------------
"打开语法高亮
"---------------------------------------------------
syntax enable
syntax on

"---------------------------------------------------
"不产生任何备份文件
"---------------------------------------------------
set nobackup "从不备份
set noswapfile "禁止生成临时文件

"---------------------------------------------------
"设置编码格式
"---------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030,chinese,cp936,latin-1,chinese,ucs-bom
language messages zh_CN.utf-8 "解决consle输出乱码

"---------------------------------------------------
"全局设置
"---------------------------------------------------
"set mouse=n           "全局启用鼠标
set history=400       "历史记录数
set noerrorbells       "不让vim发出滴滴声
set autoread           "文件在vim之外修改过，自动重新读入
set nocp               "让vim在不兼容的模式下工作
set nowrap	            " 不要换行
set scrolloff=3        "光标到顶或底时保持3行距离
set backspace=indent,eol,start "设置退格键可用
set ambiwidth=double   "防止特殊符号无法正常显示
set autowrite          "开启自动保存
set clipboard+=unnamed "共享剪切板
set hidden             "允许在有未保存的修改时切换缓冲区
set nu                 "显示行号
set shortmess=atI      "启动的时候不显示乌干达信息
set novisualbell       "不要光标闪烁
set showcmd		"输入的命令显示出来，看的清楚些
colorscheme desert
set background=light
autocmd InsertEnter * se cul "用浅色高亮当前行

set cursorline         "设置当前行，需要deset.vim配合使用
set cursorcolumn       "设置当前列 同上


"---------------------------------------------------
"文件搜索设置
"---------------------------------------------------
set incsearch          "开启实时搜索功能
set hlsearch           "开启高亮显示结果"
set nowrapscan         "搜索到文件两端时不重新搜索
set ignorecase	       "设置搜索时忽略大小写

"---------------------------------------------------
"设置缩进风格
"---------------------------------------------------
set expandtab "把tab键当空格来处理
set shiftwidth=4 " 把tab当空格处理
set smarttab "按一次backspace就删除4个空格
set tabstop=4 "设置tab键的宽度
set softtabstop=4 "统一缩进为4
set autoindent "开启自动对齐
set cindent "自动按照C的格式进行缩进
set cindent shiftwidth=4 "自动缩进4个空格
set smartindent "C编程智能自动缩进
set formatoptions=tcrqn "自动格式化

"---------------------------------------------------
" 恢复上次文件打开位置
"---------------------------------------------------
set viminfo+=!         "保存全局变量
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------------------------
"快捷键映射
"---------------------------------------------------
"普通模式快捷键映射
nmap wv <c-w>v    "垂直分割当前窗口
nmap wd <c-w>c    "关闭当前窗口
nmap ws <c-w>s    "水平分割当前窗口
nnoremap <c-h> <c-w>h   "移动到左边的窗口
nnoremap <c-l> <c-w>l   "移动到右边的窗口
nnoremap <c-k> <c-w>k   "移动到上边的窗口
nnoremap <c-j> <c-w>j   "移动到下边的窗口
nmap H ^	"普通模式下C+H 到行首
nmap L $	"普通模式下C+L 到行尾
nnoremap <F2> :set nonumber! number?<CR>

"nmap <silent> <F12> :A<CR> "源文件头文件间切换(a.vim插件)

"编辑模式下映射方向键
imap <c-h> <Left>
imap <c-l> <Right>
imap <c-k> <Up>
imap <c-j> <Down>

imap fd <ESC>


"---------------------------------------------------
"代码折叠与补全设置
"---------------------------------------------------
"set foldenable         "允许折叠
"set foldcolumn=3       "设置折叠栏宽度
"set foldmethod=syntax  "用语法高亮来定义折叠
"set foldlevel=100      "启动vim时不要自动折叠代码
"set foldclose=all           "设置为自动关闭折叠
"set completeopt=longest,menu "关闭补全时的预览窗口preview
" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"设置Ctags
set tags=tags
set autochdir


"=========================================================================================
"开始使用Vundle的必须配置
"--------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"----------------------------------------
"编辑器默认安装插件
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-bufferline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Yggdroot/indentLine'
Bundle 'ervandew/supertab'

Bundle 'Pydiction'

"Golang环境插件
Bundle 'fatih/vim-go'

"前端开发环境插件
Bundle 'mattn/emmet-vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'pangloss/vim-javascript'

Bundle 'a.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'kien/ctrlp.vim'

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on "开启文件类型检测
"=============================================================================================

"---------------------------------------------------
"快速去行尾空格 [, + <Space>] bronson/vim-trailing-whitespace'
"---------------------------------------------------
nmap fix :FixWhitespace<CR>

let g:proj_flags="imsStg"

"---------------------------------------------------
"一、Powerline 状态栏设置
"---------------------------------------------------
set laststatus=2
set t_Co=256
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline#extensions#buffline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
nmap ] :bp<CR>    "映射Alt+]键盘，输入时Ctrl+v代替^字符
nmap [ :bn<CR>
nmap bb :bd<CR>

"---------------------------------------------------
"二、设置括号颜色
"---------------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue', 'firebrick3'],
    \ ['darkgreen', 'RoyalBlue3'],
    \ ['darkcyan', 'SeaGreen3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['red', 'firebrick3'],
    \ ]
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesToggle


"---------------------------------------------------
"三、调用Tagbar插件
"---------------------------------------------------
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=60
let g:tagbar_autofocus = 1
let g:tagbar_left = 0
let g:tagbar_expand = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
nmap tl :Tagbar<CR>

"---------------------------------------------------
"四、设置NerdTree
"----------------------------------------------------
let NERDChristmasTree=1  "显示增强
let NERDTreeAutoCenter=1 "自动调整焦点
let NERDTreeMouseMode=2  "鼠标模式:目录单击,文件双击
let NERDTreeWinSize=50   "窗口宽度
let g:NERDTreeDirArrows=0 "1显示箭头，0传统+号
let g:NERDTreeQuitOnOpen=1 "打开文件后自动关闭
let NERDTreeShowFiles=1    "显示文件
let NERDTreeShowHidden=1   "显示隐藏文件
let NERDTreeShowLineNumbers=1  "显示行号
let NERDTreeWinPos='left'   "窗口位置
let NERDTreeMinimalUI=1    "不显示'Bookmarks' label 'Press ? for help'
let NERDTreeHighlightCursorline=1  "高亮显示当前文件或目录
let NERDTreeShowLineNumbers=1     "显示行号
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$','\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
nmap <silent> nt :NERDTreeToggle<CR>

"---------------------------------------------------
"五、设置miniBufExpl浏览器
"----------------------------------------------------
"let g:miniBufExplMapWindowNavVim = 1 "<C-h,j,k,l>切换到上下左右的窗口
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplUseSingleClick = 1  " select by single click

"let g:miniBufExplForceSyntaxEnable = 1
"let g:miniBufExplorerMoreThanOne=2
"let g:miniBufExplMaxSize = 3

"---------------------------------------------------
"六、Indent_guides显示缩进对齐线
"----------------------------------------------------
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 239
let g:indentLine_color_dark = 30
let g:indentLine_char = '|'

"---------------------------------------------------
"九、Syntastic   语法检查
"---------------------------------------------------
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

"---------------------------------------------------
"十二、SuperTab Tab键智能补全
"---------------------------------------------------
let g:SuperTabRetainCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-N><C-O>"

"---------------------------------------------------
"GoLang 设置
"---------------------------------------------------
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

"---------------------------------------------------
"十三、for ycm 智能补全
"---------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
set report=0           "告诉我们哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\
let loaded_matchparen = 1   "关闭高亮括号匹配

" YCM 补全菜单配色
highlight Pmenu     cterm=bold ctermfg=None   ctermbg=blue
highlight PmenuSel  cterm=bold ctermfg=None    ctermbg=4

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

"---------------------------------------------------
"  "  < cscope 工具配置 >
"---------------------------------------------------
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
     "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
        "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
set tags=./tags;


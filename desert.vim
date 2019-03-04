set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="desert"

" color terminal definitions
hi SpecialKey	ctermfg=grey
hi Directory	ctermfg=darkcyan                "目录颜色
hi Title	    ctermfg=5                       "标题颜色
hi WildMenu	    ctermfg=0       ctermbg=3
hi Folded	    ctermfg=gray    ctermbg=NONE    "折叠的颜色
hi LineNr	    ctermfg=7       ctermbg=8       "行号
hi FoldColumn	ctermfg=gray    ctermbg=NONE    "折叠列的颜色
hi Comment	    ctermfg=7                       "注释的颜色
hi Constant	    ctermfg=brown                   "常量的颜色
hi Special	    ctermfg=5                       "字符串中的特殊字符
hi Identifier	ctermfg=6                       "标示符的颜色
hi Statement	ctermfg=3                       "声明的颜色，控制语句
hi PreProc	    ctermfg=5                       "预处理颜色
hi Type		    ctermfg=2                       "数据类型
hi Number       ctermfg=Blue    ctermbg=None    "数字
hi String       ctermfg=Red     ctermbg=None    "字符串
hi Ignore	    ctermfg=7

"状态栏提示信息
"------------------------------------------------
"hi ErrorMsg	        ctermfg=7      ctermbg=None     "错误信息
"hi WarningMsg	    ctermfg=1                       "警告信息
"hi ModeMsg	        ctermfg=brown                   "当前模式
"hi MoreMsg	        ctermfg=grey                    "其他文本
"hi Question	        ctermfg=grey                    "询问用户
"hi Error	        ctermfg=7       ctermbg=None    "错误


"文本搜索
"------------------------------------------------
"hi IncSearch	ctermfg=yellow      ctermbg=grey        "增量搜索时匹配的字符串
hi Search	    cterm=bold    ctermfg=red    ctermbg=0  "匹配的文本串

"弹出菜单
"------------------------------------------------
"hi Pmenu      ctermfg=Black           ctermbg=grey         "弹出菜单
"hi PmenuSel   ctermfg=LightBlue       ctermbg=DarkBlue     "菜单当前选择项

"窗体边框相关
"------------------------------------------------
"hi Underlined	    ctermfg=3
hi CursorLine       cterm=None   ctermfg=None  ctermbg=8    "光标所在行
hi CursorColumn     ctermfg=None           ctermbg=8        "光标所在列
"hi NonText	        ctermfg=darkblue                        "窗口尾部的~和@，以及文本里实际不显示的字符

"diff模式
"-------------------------------------------------
hi DiffAdd	    ctermbg=4                   "增加的行
hi DiffChange	ctermbg=5                   "改变的行
hi DiffDelete	ctermfg=4       ctermbg=6   "删除的行
hi DiffText	    ctermbg=1                   "插入文本


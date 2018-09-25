
set sw=4
set ts=4
set autoindent
set nu!
set tags+=tags
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set previewwindow


" *********************自动闭合设置************************
" :inoremap ( ()<Esc>i
" 表示在插入模式下，输入(时自动替换成(),并按下esc后再进入插入模式，这里光标正好在()的中间
" :inoremap < <><Esc>:let leavechar=">"<CR>i 表示把<替换成<>按下esc后输入let
" leavechar=">"后回车
" inoremap { {<CR>}<ESC>kA<CR>

" :inoremap () ()<Esc>a
" :inoremap ( ()<Esc>i

" :inoremap [] []<Esc>a
" :inoremap [ []<Esc>i

" :inoremap "" ""<Esc>a
" :inoremap " ""<Esc>i

" :inoremap '' ''<Esc>a
" :inoremap ' ''<Esc>i

:inoremap <> <><Esc>i
:inoremap </ </><Esc>i

" :nmap <C-l> <C-w><C-w>

" :inoremap {<CR> {<CR>}<ESC>kA<CR>
" :inoremap {} {}<Esc>a
" :inoremap { {}<Esc>i

" *********************自动闭合设置************************

" 按下F2时显示时间
" map <F2> :echo 'Current time is ' . strftime('%c')<CR>
" :nnoremap <F3> :ls<CR>


" <BS>           Backspace
" <Tab>          Tab
" <CR>           Enter
" <Enter>        Enter
" <Return>       Enter
" <Esc>          Escape
" <Space>        Space
" <Up>           Up arrow
" <Down>         Down arrow
" <Left>         Left arrow
" <Right>        Right arrow
" <F1> - <F12>   Function keys 1 to 12
" #1, #2..#9,#0  Function keys F1 to F9, F10
" <Insert>       Insert
" <Del>          Delete
" <Home>         Home
" <End>          End
" <PageUp>       Page-Up
" <PageDown>     Page-Down
" <bar>          the '|' character, which otherwise needs to be escaped '\|'''''

" set timeoutlen=200 ttimeoutlen=0



imap <F6> <C-x><C-o>
nmap <F8> :TagbarToggle<CR>


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs' " 自动补全{}，[], ''等
" Plugin 'scrooloose/syntastic'

" Plugin 'SuperTab'
" tab弹出上下文，tab循环选择

Plugin 'scrooloose/nerdcommenter'
"使用：
"1、 \cc 注释当前行和选中行
"2、 \cn 没有发现和\cc有区别
"3、 \c<空格>
"如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
"4、 \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
"5、 \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
"6、 \cs 添加性感的注释，代码开头介绍部分通常使用该注释
"7、 \cy 添加注释，并复制被添加注释的部分
"8、 \c$ 注释当前光标到改行结尾的内容
"9、 \cA 跳转到该行结尾添加注释，并进入编辑模式
"10、\ca 转换注释的方式，比如： /**/和//
"11、\cl \cb 左对齐和左右对其，左右对其主要针对/**/
"12、\cu 取消注释


set encoding=utf-8

Plugin 'vim-airline'
set laststatus=2  "永远显示状态栏
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩


" Plugin 'msanders/snipmate.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'https://github.com/garbas/vim-snipmate.git'
Plugin 'https://github.com/honza/vim-snippets.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'

" i和s可以水平分割或纵向分割窗口打开文件
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

Plugin 'Valloric/YouCompleteMe'

" youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
set completeopt=longest,menu
let g:ycm_confirm_extra_conf=0      " 关闭加载.ycm_extra_conf.py提示
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tags_files=1                 " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2                     " 从第2个键入字符就开始罗列匹配项
let g:ycm_path_to_python_interpreter='/usr/bin/python'
" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

"mapping
nmap <leader>gd :YcmDiags<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>           " 跳转到申明处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>            " 跳转到定义处
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 直接触发自动补全
let g:ycm_key_invoke_completion = '<C-Space>'
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'gitcommit' : 1,
      \}  



Plugin 'https://github.com/roxma/nvim-yarp.git'

" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'https://github.com/Shougo/deoplete.nvim.git'
" Plugin 'fatih/vim-go' 
" Plugin 'https://github.com/zchee/deoplete-go.git'

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type','var','const']

" let g:SuperTabMappingForward = '<s-tab>'
" let g:SuperTabMappingBackward = "<s-tab>"

" imap <C-J> <Plug>snipMateNextOrTrigger 
" smap <C-J> <Plug>snipMateNextOrTrigger 

" :PluginInstall
" All of your Plugins must be added before the following line
call vundle#end()            " required


syntax on
filetype on
filetype plugin indent on


" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

set nocompatible "不与vi兼容
filetype off "重置文件类型检查

"vim-plug的必备设置.
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify' "开屏工具

Plug 'scrooloose/nerdtree' "显示目录树
Plug 'xuyuanp/nerdtree-git-plugin' "nerdtree的git状态集成
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "nerdtree高亮
Plug 'ryanoasis/vim-devicons' "nerdtree icon

Plug 'vim-airline/vim-airline' "状态栏
Plug 'vim-airline/vim-airline-themes' "状态栏主题

Plug 'liuchengxu/vista.vim' "侧边栏显示tag

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim' "fzf的vim适配

Plug 'scrooloose/nerdcommenter' "注释插件
Plug 'jiangmiao/auto-pairs' "处理成对括号
Plug 'tpope/vim-surround'  "处理环绕的引号括号等等。和上面哪个差不多。这个的主体是环绕内容
Plug 'yggdroot/indentline' "对齐线
Plug 'lfv89/vim-interestingwords' "高亮多个单词
Plug 'easymotion/vim-easymotion' "快速跳转
Plug 'brooth/far.vim' "批量替换
Plug 'junegunn/vim-easy-align'  "对齐
Plug 'mbbill/undotree' "undotree可视化
Plug 'farmergreg/vim-lastplace' "打开文件时跳转上一次修改位置
Plug 'MattesGroeger/vim-bookmarks' "bookmarks 可视化
Plug 'lyokha/vim-xkbswitch' "切换到normal自动转为英文输入法
Plug 'ntpeters/vim-better-whitespace' "高亮多余空格,保存时自动修复
Plug 'hotoo/pangu.vim' "中文markdown美化

Plug 'neoclide/coc.nvim', {'branch': 'release'} "异步补全

Plug 'fatih/vim-go' "vim 的go集成插件

Plug 'python-mode/python-mode' "vim 的python集成插件
Plug 'vim-scripts/indentpython.vim'  "python自动缩进
Plug 'scrooloose/syntastic'  "语法检查
Plug 'nvie/vim-flake8'  "pep8语法检查
Plug 'tmhedberg/simpylfold' " python代码折叠

Plug 'tpope/vim-fugitive' "git wrapper
Plug 'junegunn/gv.vim' "git commit 浏览器,需要已安装上一个插件
Plug 'airblade/vim-gitgutter' "在左侧状态栏显示git diff

Plug 'wakatime/vim-wakatime' "统计coding时长
"主题
Plug 'fatih/molokai'
Plug 'KKPMW/sacredforest-vim'
Plug 'sainnhe/vim-color-forest-night'
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on "打开文件类型监测
syntax on

set number  "显示行号
"set relativenumber  "显示相对行号.
set ttyfast "快速重绘适用于避免屏幕在窗口切换时出现一些烦人的行,不适用于慢速远程连接服务器到情况
set hls "高亮搜索
set incsearch "搜索时随着输入高亮候选项
set autowrite  "自动显示换行
set laststatus=2 "始终显示状态栏
set autoread "打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set showcmd "显示输入的命令
set encoding=utf-8 "默认编码
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1 "默认编码
set noerrorbells "vim 不要发声
set noswapfile "不使用swap file
set nobackup "不使用备份文件
set splitright "vsp 默认新窗口在右
set splitbelow "sp 默认窗口在下面
set autowrite "某些命令执行前自动保存，比如:next, :make 命令
set noshowmode "只在airline显示mode就可以了，命令行就不必了
set showmatch "光标遇到括号时自动高亮对应括号
let g:rehash256 = 1  "显示256色

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=120
set expandtab
set autoindent "按回车后与上一行缩进保持一致
set fileformat=unix
set cursorline "光标所在行高亮

"set mapleader
let mapleader = ","

"normal模式,w保存文件
nnoremap <leader>w <esc>:w<cr>
"insert模式,w保存文件
inoremap <leader>w <ESC>:w<CR>
"insert模式,jj 退出到normal模式
inoremap jj <ESC>

"设置多窗口快速跳转快捷键
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" 代码折叠设置
set foldmethod=indent
set foldlevel=99
"空格折叠代码
nnoremap <space> za

"vim 可以访问系统剪贴板
set clipboard^=unnamed

" 解决插入模式下delete/backspce键失效问题
set backspace=2
set pastetoggle=<F8> "F8是粘贴快捷键。tmux里不启用paste模式会错位

",a退出quickfix和location list
nnoremap <leader>a :cclose<CR>
nnoremap <leader>a :lcl<CR>
"自动进入文件路径
autocmd bufenter * silent! lcd %:p:h

"记录undo历史
set undofile
set undodir=~/.vim/undodir
"undotree 设置
nnoremap <F5> :UndotreeToggle<cr>

"XkbSwitch设置
let g:XkbSwitchEnabled = 1

"vim-better-whitespace 设置
let g:better_whitespace_enabled=1 "启用高亮
let g:strip_whitespace_on_save=1  "保存时清除空格
let g:strip_whitelines_at_eof=1   "保存时清除最后的空行
"---------------------------扩展--------------------------------------------
"主题molokai
"let g:molokai_original = 1  "显示设置
"colorscheme molokai  "使用颜色主题
"let g:airline_theme='gruvbox'  "下面bar主题

"主题gruvbox
if has("termguicolors")
    " fix bug for vim
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"

    " enable true color
    set termguicolors
endif
set background=dark
let g:gruvbox_invert_selection=0 "否则visual mode 太艳丽了
colorscheme gruvbox
let g:airline_theme='gruvbox'  "下面bar主题
let g:airline_powerline_fonts = 1
"主题sacredforest
"if has("termguicolors")
    "" fix bug for vim
    "let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"

    "" enable true color
    "set termguicolors
"endif
"colorscheme sacredforest
"let g:airline_theme='gruvbox'  "下面bar主题

"主题forest-night
"if has("termguicolors")
    "" fix bug for vim
    "let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"

    "" enable true color
    "set termguicolors
"endif
"colorscheme forest-night
"let g:airline_theme='forest_night'  "下面bar主题

" vim-go 设置
let g:go_fmt_command = "goimports"  "fmt时自动修改import,增减引用库
let g:go_autodetect_gopath = 1
let g:gp_list_type = "quickfix"

"vim-go 高亮显示配置
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_addtags_transform = "camelcase"  "修改驼峰模式,默认是_分割的变量名
let g:go_metalinter_autosave = 1  "保存时自动lint
let g:go_auto_type_info = 1  "自动显示go info
let g:go_auto_sameids = 1  "自动高亮同名变量
let g:go_def_mode = 'godef'

":GoDeclsDir快捷键ctrl-g 用途是显示当前文件夹所有函数
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!
  "一个tab4个空格,默认是8空格
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  ",b是编译，根据文件是否test.go执行gotest
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd Filetype go nmap <leader>g :GoDebugStart <cr>
  " :goreferrers
  autocmd Filetype go nmap <leader>u <plug>(go-referrers)
  " :gotest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :gorun
  autocmd FileType go nmap <leader>r :GoRun %<CR>
  "autocmd FileType go nmap <leader>r  <Plug>(go-run)
  "au filetype go nmap <leader>r :gorun % <cr>
  " :godoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :gocoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :goinfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :gometaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :godef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :godef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " :goalternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup eND

" build_go_files is a custom function that builds or compiles the test file.
" it calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" go run 时需要添加当前路径到GOPATH


"vim-go debug 设置
let g:go_debug_windows = {
    \ 'stack': 'leftabove 20vnew',
    \ 'out':   'botright 5new',
    \ 'vars':  'leftabove 30vnew',
\ }
"重复使用buffer。go-def-split复用同一个窗口
let g:go_def_reuse_buffer = 1
au filetype go nmap <f12> <plug>(go-debug-stepout)

"nerdtree设置
"autocmd vimenter * NERDTree
nnoremap <f7> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20  "目录宽度
"当最后的窗口是nerdtree时，自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIgnore=['\.svn$', '\.git$', '\.pyc$', '\.vscode', '__pycache__'] "忽略特定文件类型
"nerdtree和git的兼容
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"fzf搜索快捷键和设置
nnoremap <silent> <C-p> :Files<CR>
if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
nnoremap <silent> <C-a> :Ag<CR>

"pymode配置
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1 "自动去空格
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint = 1
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length = 120

"EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <leader><leader> <Plug>(easymotion-overwin-f2)

"coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

"vista.vim 设置
"状态栏显示目前函数名
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"快捷键
nmap <f8> :Vista!!<cr>
let g:vista_sidebar_width = 30 " 侧边栏宽度.
let g:vista#renderer#enable_icon = 1 "启用icon
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "] "展示样式
let g:vista#renderer#icons = {
\    'structs': "\ufb44",
\    'struct members': "\ufb44",
\}

"nerdcommenter 设置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_go = 1
"" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1"

"vim-easy-align 设置
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"vim-gitgutter
nmap <C-d> :GitGutterLineHighlightsToggle <CR>

"pangu.vim 设置
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

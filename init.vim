
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
let mapleader=" "

set number          "显示行号
set relativenumber  "显示相对行号
set cursorline      "高亮当前行
"set cursorcolum    "高亮当前列
syntax on           "语法高亮
syntax enable
filetype on         "侦测文件类型
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a

set wildmenu
set showmode        "在底部显示当前处于命令模式还是插入模式
set showcmd
set t_Co=256        "启用256色
set autoindent      "按下回车键后下一行的缩进会自动跟上一行的缩进保持一致
set tabstop=4       "按下 Tab 键时Vim 显示的空格数
set shiftwidth=4    "在文本上按下>>增加一级缩进<<取消一级缩进或者==取消全部缩进时每一级的字符数
set expandtab       "由于 Tab 键在不同的编辑器缩进不一致该设置自动将 Tab 转为空格
set textwidth=80    "一行80个字符
set wrap            "自动折行即太长的行分成几行显示
"set linebreak      "只有遇到指定的符号比如空格连词号和其他标点符号才发生折行
set wrapmargin=2    "指定折行处与编辑窗口的右边缘之间空出的字符数
set scrolloff=5     "垂直滚动时光标距离顶部/底部的位置单位行
set sidescrolloff=15"水平滚动时光标距离行首或行尾的位置单位字符该配置在不折行时比较有用
set laststatus=2    "总显示最后一个窗口的状态行设为1则窗口数多于一个的时候显示最后一个窗口的状态行0不显示最后一个窗口的状态行
set ruler           "在状态栏显示光标的当前位置位于哪一行哪一列
set showmatch       "光标遇到圆括号方括号大括号时自动高亮对应的另一个圆括号方括号和大括号
set showtabline=2   "总是显示标签栏"
set hlsearch        "搜索时高亮显示匹配结果
exec "nohlsearch" 
set ignorecase      "搜索忽略大小写
set smartcase       "开启智能大小写
set nocompatible    "设置不兼容vi
set encoding=utf-8  "使用 utf-8 编码
set signcolumn=yes
"set list
set listchars=tab:\|\
"set backupdir=~/.local/.vim/.backup/    "设置备份文件交换文件操作历史文件的保存位置
set autochdir       "自动切换工作目录这主要用在一个Vim会话之中打开多个文件的情况默认的工作目录是打开的第一个文件的目录该配置可以将工作目录自动切换到正在编辑的文件
set autoread        "打开文件监视如果在编辑过程中文件发生外部改变比如被别的编辑器编辑了就会发出提示
set wildmenu        "命令模式下底部操作指令按下 Tab 键自动补全第一次按下Tab会显示所有匹配的操作指令的清单第二次按下Tab会依次选择各个指令

"更改光标不同模式的样式
"   https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes#For_the_Gnome-Terminal_.28version_.E2.89.A53.16.29
if has("autocmd")
      au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
        au InsertEnter,InsertChange *
            \ if v:insertmode == 'i' | 
            \   silent execute '!echo -ne "\e[6 q"' | redraw! |
            \ elseif v:insertmode == 'r' |
            \   silent execute '!echo -ne "\e[4 q"' | redraw! |
            \ endif
          au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
      endif

set laststatus=2
"保留上次编辑后光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

noremap <LEADER><CR> :nohlsearch<CR>

noremap S :w<CR>        "使用 S 保存
noremap Q :q<CR>        "使用 Q 普通退出
noremap R :source ~/.vimrc<CR> 
noremap ; :

"=====分屏======
noremap sh :set splitright<CR>:vsplit<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>
"切换
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

"
call plug#begin('~/.vim/plugged')
" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" snippets
Plug 'honza/vim-snippets',

Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
" Plug 'w0rp/ale'

" Undo Tree
Plug 'mbbill/undotree/'

" C/C++
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }

" Python
Plug 'vim-scripts/indentpython.vim'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'mg979/vim-visual-multi'
Plug 'Yggdroot/indentLine'
Plug 'tomtom/tcomment_vim'

" Visual enhancement 
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"============= Plug settings ================
"

"=== tcomment_vim
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

"=== rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle"

"=== ctags
set tags=./.tags;,.tags

"=== vim-gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

"=== asyncrun.vim
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6 

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1


" F5 运行
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F6 运行测试
" nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
nnoremap <silent> <F6> :AsyncRun -cwd=~/uEmu/build/libs2e-release/ make <cr>

" F7 编译整个项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make -f makefile <cr>

" F8 运行当前项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F9 为编译单文件
nnoremap <silent> <F9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"=== ale
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']

"=== cpp
" set path=.,/usr/include/,/root/Github/stm32f103-template/**,/root/Github/stm32f103-template/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/**
" /root/Github/stm32f103-template/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/inc/,/root/Github/stm32f103-template/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/

"=== leaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': ''  }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:coc_global_extensions = [
            \'coc-diagnostic',
            \'coc-vimlsp',
            \'coc-json',
            \'coc-python',
            \'coc-snippets',
            \'coc-marketplace',
            \'coc-prettier',
            \'coc-clangd',
            \'coc-translator',
            \'coc-tsserver',
            \'coc-syntax',
            \'coc-lists',
            \'coc-calc',
            \'coc-highlight',
            \'coc-gitignore',
            \'coc-yank',
            \'coc-explorer']

"            \'coc-spell-checker',


"
" ===
" === coc.nvim
" ===
" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

"don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>h to show documentation in preview window.
nnoremap <silent> <LEADER>H :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"===coc-translator 
" NOTE: do NOT use `nore` mappings
" " popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader>r <Plug>(coc-translator-r)
vmap <Leader>r <Plug>(coc-translator-rv)

"===coc-explorer
nnoremap <LEADER>E :CocCommand explorer<CR>

"===coc-calc
" append result on current expression
nmap <Leader>cr <Plug>(coc-calc-result-replace)

"===coc.highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

"===coc.actions
" Remap for do codeAction of selected region
"function! s:cocActionsOpenFromSelected(type) abort
"      execute 'CocCommand actions.open ' . a:type
"endfunction
"xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
"nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

"===coc.spell-checker
"vmap <leader>a <Plug>(coc-codeaction-selected)
"nmap <leader>a <Plug>(coc-codeaction-selected)

"===coc.snippets
"Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)






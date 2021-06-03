set nocompatible 
set mouse=a


set number
set backspace=2  " 回退键删除生效
syntax on
set cursorline  "cursoring current line

" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
set cursorline              " 突出显示当前行
" 侦测文件类型
filetype on
set hlsearch "highlight search
filetype plugin indent on


"coc.nvim works best on vim >= 8.1.1719 and neovim >= 0.4.0, consider upgrade your vim.
"You can add this to your vimrc to avoid this message:
let g:coc_disable_startup_warning = 1

"let g:ycm_auto_trigger=1  "value 0 will close auto trigger complete,need to type <c-space> trigger
let g:ycm_global_ycm_extra_conf='/usr/lib/ycmd/ycm_extra_conf.py'
set completeopt=menu,menuone " this two lines stop preview 
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
"参考 options tags和韦易笑对set tags的说明，本机man ctags实际是universl ctags的文档
set tags=./tags;,tags,/usr/include/tags



"vim插件仓库
"https://vimawesome.com/
call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'chun-yang/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'preservim/nerdcommenter'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'vim/killersheep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'skywind3000/vim-quickui'
"Plug 'skywind3000/vim-terminal-help'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf'

call plug#end()

"vim-signify, default updatetime 4000ms is not good for async update
set updatetime=100

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"complete preview popup color set ,default is ugly 
"https://zhuanlan.zhihu.com/p/33046090
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"inoremap <silent><expr> <c-space> coc#refresh()
tnoremap <m-q> <c-\><c-n>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F2> :vnew ~/.vimrc<CR> 
nnoremap <F3> :NERDTree ~/.vim/<CR>
let g:Lf_ShortcutF = '<c-p>'

"搜索ctrl-f，在insert normal mode下都可以使用
noremap <C-f> <ESC>:/
noremap! <C-f> <ESC>:/
"前一个C是ctrl键，后一个C是shift+c,复制vim内的文本到系统剪切板
noremap <C-C> "+y
so ~/.vim/myvimconf/keymap.vim
" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

call quickui#menu#install('&C/C++', [
            \ [ '&Compile', 'echo 1' ],
            \ [ '&Run', 'echo 2' ],
            \ ], '<auto>', 'c,cpp')

" enable to display tips in the cmdline
let g:quickui_show_tip = 1


" hit space twice to open menu

noremap <space><space> :call quickui#menu#open()<cr>





"======================================================================
"
" menu_init.vim -
"
" Created by skywind on 2019/12/26
" Last Modified: 2019/12/26 16:23:48
"
"======================================================================

if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
	finish
endif

call quickui#menu#reset()

call quickui#menu#install("&File", [
			\ [ "&Open\t(:w)", 'call feedkeys(":tabe ")'],
			\ [ "&Save\t(:w)", 'write'],
			\ [ "--", ],
			\ [ "LeaderF &File", 'Leaderf file', 'Open file with leaderf'],
			\ [ "LeaderF &Mru", 'Leaderf mru --regexMode', 'Open recently accessed files'],
			\ [ "LeaderF &Buffer", 'Leaderf buffer', 'List current buffers in leaderf'],
			\ [ "--", ],
			\ [ "J&unk File", 'JunkFile', ''],
			\ ])

if has('win32') || has('win64') || has('win16')
	call quickui#menu#install('&File', [
				\ [ "--", ],
				\ [ "Start &Cmd", 'silent !start /b cmd /C c:\drivers\clink\clink.cmd' ],
				\ [ "Start &PowerShell", 'silent !start powershell.exe' ],
				\ [ "Open &Explore", 'call Show_Explore()' ],
				\ ])
endif

call quickui#menu#install("&File", [
			\ [ "--", ],
			\ [ "E&xit", 'qa' ],
			\ ])

call quickui#menu#install("&Edit", [
			\ ['Copyright &Header', 'call feedkeys("\<esc> ec")', 'Insert copyright information at the beginning'],
			\ ['&Trailing Space', 'call StripTrailingWhitespace()', ''],
			\ ['Update &ModTime', 'call UpdateLastModified()', ''],
			\ ['&Paste Mode Line', 'PasteVimModeLine', ''],
			\ ['Format J&son', '%!python -m json.tool', ''],
			\ ['--'],
			\ ['&Align Table', 'Tabularize /|', ''],
			\ ['Align &Cheatsheet', 'MyCheatSheetAlign', ''],
			\ ])

call quickui#menu#install('&Symbol', [
			\ [ "&Grep Word\t(In Project)", 'call MenuHelp_GrepCode()', 'Grep keyword in current project' ],
			\ [ "--", ],
			\ [ "Find &Definition\t(GNU Global)", 'call MenuHelp_Gscope("g")', 'GNU Global search g'],
			\ [ "Find &Symbol\t(GNU Global)", 'call MenuHelp_Gscope("s")', 'GNU Gloal search s'],
			\ [ "Find &Called by\t(GNU Global)", 'call MenuHelp_Gscope("d")', 'GNU Global search d'],
			\ [ "Find C&alling\t(GNU Global)", 'call MenuHelp_Gscope("c")', 'GNU Global search c'],
			\ [ "Find &From Ctags\t(GNU Global)", 'call MenuHelp_Gscope("z")', 'GNU Global search c'],
			\ [ "--", ],
			\ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
			\ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
			\ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
			\ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
			\ ])

call quickui#menu#install('&Move', [
			\ ["Quickfix &First\t:cfirst", 'cfirst', 'quickfix cursor rewind'],
			\ ["Quickfix L&ast\t:clast", 'clast', 'quickfix cursor to the end'],
			\ ["Quickfix &Next\t:cnext", 'cnext', 'cursor next'],
			\ ["Quickfix &Previous\t:cprev", 'cprev', 'quickfix cursor previous'],
			\ ])

call quickui#menu#install("&Build", [
			\ ["File &Execute\tF5", 'AsyncTask file-run'],
			\ ["File &Compile\tF9", 'AsyncTask file-build'],
			\ ["File E&make\tF7", 'AsyncTask emake'],
			\ ["File &Start\tF8", 'AsyncTask emake-exe'],
			\ ['--', ''],
			\ ["&Project Build\tShift+F9", 'AsyncTask project-build'],
			\ ["Project &Run\tShift+F5", 'AsyncTask project-run'],
			\ ["Project &Test\tShift+F6", 'AsyncTask project-test'],
			\ ["Project &Init\tShift+F7", 'AsyncTask project-init'],
			\ ['--', ''],
			\ ["T&ask List\tCtrl+F10", 'call MenuHelp_TaskList()'],
			\ ['E&dit Task', 'AsyncTask -e'],
			\ ['Edit &Global Task', 'AsyncTask -E'],
			\ ['&Stop Building', 'AsyncStop'],
			\ ])

call quickui#menu#install("&Git", [
			\ ['&View Diff', 'call svnhelp#svn_diff("%")'],
			\ ['&Show Log', 'call svnhelp#svn_log("%")'],
			\ ['File &Add', 'call svnhelp#svn_add("%")'],
			\ ])


if has('win32') || has('win64') || has('win16') || has('win95')
	call quickui#menu#install("&Git", [
				\ ['--',''],
				\ ["Project &Update\t(Tortoise)", 'call svnhelp#tp_update()', 'TortoiseGit / TortoiseSvn'],
				\ ["Project &Commit\t(Tortoise)", 'call svnhelp#tp_commit()', 'TortoiseGit / TortoiseSvn'],
				\ ["Project L&og\t(Tortoise)", 'call svnhelp#tp_log()',  'TortoiseGit / TortoiseSvn'],
				\ ["Project &Diff\t(Tortoise)", 'call svnhelp#tp_diff()', 'TortoiseGit / TortoiseSvn'],
				\ ['--',''],
				\ ["File &Add\t(Tortoise)", 'call svnhelp#tf_add()', 'TortoiseGit / TortoiseSvn'],
				\ ["File &Blame\t(Tortoise)", 'call svnhelp#tf_blame()', 'TortoiseGit / TortoiseSvn'],
				\ ["File Co&mmit\t(Tortoise)", 'call svnhelp#tf_commit()', 'TortoiseGit / TortoiseSvn'],
				\ ["File D&iff\t(Tortoise)", 'call svnhelp#tf_diff()', 'TortoiseGit / TortoiseSvn'],
				\ ["File &Revert\t(Tortoise)", 'call svnhelp#tf_revert()', 'TortoiseGit / TortoiseSvn'],
				\ ["File Lo&g\t(Tortoise)", 'call svnhelp#tf_log()', 'TortoiseGit / TortoiseSvn'],
				\ ])
endif

call quickui#menu#install('&Tools', [
			\ ['Compare &History', 'call svnhelp#compare_ask_file()', ''],
			\ ['&Compare Buffer', 'call svnhelp#compare_ask_buffer()', ''],
			\ ['--',''],
			\ ['List &Buffer', 'call quickui#tools#list_buffer("FileSwitch tabe")', ],
			\ ['List &Function', 'call quickui#tools#list_function()', ],
			\ ['Display &Messages', 'call quickui#tools#display_messages()', ],
			\ ['--',''],
			\ ["&DelimitMate %{get(b:, 'delimitMate_enabled', 0)? 'Disable':'Enable'}", 'DelimitMateSwitch'],
			\ ['Read &URL', 'call menu#ReadUrl()', 'load content from url into current buffer'],
			\ ['&Spell %{&spell? "Disable":"Enable"}', 'set spell!', 'Toggle spell check %{&spell? "off" : "on"}'],
			\ ['&Profile Start', 'call MonitorInit()', ''],
			\ ['Profile S&top', 'call MonitorExit()', ''],
			\ ["Relati&ve number %{&relativenumber? 'OFF':'ON'}", 'set relativenumber!'],
			\ ["Proxy &Enable", 'call MenuHelp_Proxy(1)', 'setup http_proxy/https_proxy/all_proxy'],
			\ ["Proxy D&isable", 'call MenuHelp_Proxy(0)', 'clear http_proxy/https_proxy/all_proxy'],
			\ ])

call quickui#menu#install('&Plugin', [
			\ ["&NERDTree\t<space>tn", 'NERDTreeToggle', 'toggle nerdtree'],
			\ ['&Tagbar', '', 'toggle tagbar'],
			\ ["&Choose Window/Tab\tAlt+e", "ChooseWin", "fast switch win/tab with vim-choosewin"],
			\ ["-"],
			\ ["&Browse in github\trhubarb", "Gbrowse", "using tpope's rhubarb to open browse and view the file"],
			\ ["&Startify", "Startify", "using tpope's rhubarb to open browse and view the file"],
			\ ["&Gist", "Gist", "open gist with mattn/gist-vim"],
			\ ["&Edit Note", "Note", "edit note with vim-notes"],
			\ ["&Display Calendar", "Calendar", "display a calender"],
			\ ['Toggle &Vista', 'Vista!!', ''],
			\ ["-"],
			\ ["Plugin &List", "PlugList", "Update list"],
			\ ["Plugin &Update", "PlugUpdate", "Update plugin"],
			\ ])

call quickui#menu#install('Help (&?)', [
			\ ["&Index", 'tab help index', ''],
			\ ['Ti&ps', 'tab help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'tab help tutor', ''],
			\ ['&Quick Reference', 'tab help quickref', ''],
			\ ['&Summary', 'tab help summary', ''],
			\ ['--',''],
			\ ['&Vim Script', 'tab help eval', ''],
			\ ['&Function List', 'tab help function-list', ''],
			\ ['&Dash Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
			\ ], 10000)

" let g:quickui_show_tip = 1


"----------------------------------------------------------------------
" context menu
"----------------------------------------------------------------------
let g:context_menu_k = [
			\ ["&Peek Definition\tAlt+;", 'call quickui#tools#preview_tag("")'],
			\ ["S&earch in Project\t\\cx", 'exec "silent! GrepCode! " . expand("<cword>")'],
			\ [ "--", ],
			\ [ "Find &Definition\t\\cg", 'call MenuHelp_Fscope("g")', 'GNU Global search g'],
			\ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
			\ [ "Find &Called by\t\\cd", 'call MenuHelp_Fscope("d")', 'GNU Global search d'],
			\ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
			\ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
			\ [ "--", ],
			\ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
			\ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
			\ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
			\ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
			\ [ "--", ],
			\ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
			\ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
			\ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
			\ ]


"----------------------------------------------------------------------
" hotkey
"----------------------------------------------------------------------
nnoremap <silent><space><space> :call quickui#menu#open()<cr>

nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>

if has('gui_running') || has('nvim')
	noremap <c-f10> :call MenuHelp_TaskList()<cr>
endif




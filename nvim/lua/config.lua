-- :h vim.
local utils = require('utils')

local opt = utils.opt
local cmd = vim.cmd
local g = vim.g
local indent = 4

-------------------------------------------------------------------------------
---------------------------------------
cmd 'au BufRead,BufNewFile,BufWritePost *.{ass,ASS,ssa,SSA,srt,SRT} set filetype=ass'
cmd 'au BufRead,BufNewFile,BufWritePost *.{wiki,md,markdown,Markdown} set filetype=markdown'
cmd 'au BufRead,BufNewFile,BufWritePost *.{wiki,mw,mediawiki} set filetype=wiki'
cmd 'au BufRead,BufNewFile,BufWritePost *.{sh,bash,shell,zsh} set filetype=shell'
cmd 'au BufWritePre,BufRead .c,.cpp,.py,.sh :normal! gg=G'
cmd 'au FileType c,cpp,rust,shell exe ":set colorcolumn=81" | nn G'
cmd 'au FileType c,cpp,rust,shell set expandtab | set tabstop=4 | set shiftwidth=4'
cmd 'au FileType make set noexpandtab | set tabstop=8 | set shiftwidth=8'

cmd 'colorscheme gruvbox8'
cmd 'filetype on' -- 侦测文件类型
cmd 'filetype plugin indent on'

--g.tex_flavor = 'latex'

---------------------------------------
opt('b', 'expandtab', true) -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent) -- Size of an indent
opt('b', 'smartindent', true) -- Insert indents automatically
opt('b', 'softtabstop', indent) -- 使得按退格键时可以一次删掉 4 个空格
opt('b', 'tabstop', indent) -- Number of spaces tabs count for
-------------------------------------------------------------------------------
---------------------------------------
opt('w', 'cursorcolumn', true) -- 列高亮  行高亮
opt('w', 'cursorline', true) -- 列高亮  行高亮
opt('w', 'fillchars', 'vert: ,stl: ,stlnc: ')
opt('w', 'lcs', 'tab:>-,trail:?') -- 显示不可视字符
opt('w', 'list', true) -- Show some invisible characters (tabs...)
opt('w', 'number', true) -- 显示行号
---------------------------------------
opt('o', 'foldmethod', 'indent')
opt('o', 'termguicolors', true) -- 24位深度256色
opt('o', 'autochdir', true) -- 自动切换当前目录为当前文件所在的目录
opt('o', 'autoindent', true)
opt('o', 'autoread', true) -- 外部修改更新文件
opt('o', 'autowrite', true) -- 自动保存
opt('o', 'background', 'dark')
opt('o', 'backup', false) -- 覆盖文件时不备份
opt('o', 'backupcopy', 'yes') -- 设置备份时的行为为覆盖
opt('o', 'clipboard', 'unnamed,unnamedplus')
opt('o', 'cmdheight', 1) -- 设定命令行的行数为 1
opt('o', 'compatible', false) -- !!!关闭vi兼容!!!
opt('o', 'directory', '/tmp/nvim/swap//')
opt('o', 'encoding', 'utf-8')
opt('o', 'errorbells', false) -- 出错时  不要发出响声
opt('o', 'expandtab', true)
opt('o', 'fencs', 'utf-8')
opt('o', 'ff', 'unix') -- 设置文本格式
opt('o', 'fileencodings', 'utf-8,sjis,gb18030,gbk')
opt('o', 'formatoptions', 'mMB') -- 在断行  合并(join)行时  针对多字节字符的优化处理
opt('o', 'guifont', '*')
opt('o', 'history', 100) -- 历史记录数为100
opt('o', 'hlsearch', true) -- 搜索时高亮显示被找到的文本
opt('o', 'ignorecase', true) -- 关闭搜索大小写敏感
opt('o', 'incsearch', true) -- 输入搜索内容时就显示搜索结果
opt('o', 'iskeyword', '_,$,@,%,#,-') -- 带有如下符号的单词不要被换行分割
opt('o', 'keywordprg', 'trans\\ :zh')
opt('o', 'laststatus', 2) -- 永远显示状态栏
opt('o', 'lazyredraw', true)
opt('o', 'linespace', 0) -- 字符间插入的像素行数目
opt('o', 'magic', true)
opt('o', 'mouse', 'a') -- 支持全局使用鼠标
opt('o', 'pyxversion', 0)
opt('o', 're', 1)
opt('o', 'report', 0) -- 通过使用 :commands 命令  告诉我们文件的哪一行被改变过
opt('o', 'ruler', true) -- 显示光标位置
opt('o', 'scrolloff', 20) -- 光标上下保留20行
opt('o', 'shiftwidth', 4) -- 设定 << 和 >> 命令移动时的宽度为 4
opt('o', 'showcmd', true) -- 输入的命令显示出来
opt('o', 'showmode', false)
opt('o', 'sidescrolloff', 30) -- 光标左右30列可见
opt('o', 'smartcase', true) -- 智能区分大小写
opt('o', 'smartindent', true) -- 开启新行时使用智能自动缩进
opt('o', 'spell', false) -- 关闭拼写检查
opt('o', 'synmaxcol', 128)
opt('o', 'tabpagemax', 20) -- 设置最大标签页上限为20
opt('o', 'tags', './.tags;,.tags')
opt('o', 'timeoutlen', 400) -- 设置终端按键检测超时为200毫秒
opt('o', 'ttimeoutlen', 10)
opt('o', 'undolevels', 1000)
opt('o', 'updatetime', 2000)
opt('o', 'whichwrap', 'h,l,b') -- 连续移动
opt('o', 'wildoptions', 'pum') -- 底部操作指令按下 Tab 键自动补全。
opt('o', 'writebackup', false) -- 保存文件前建立备份，保存成功后删除该备份

opt('o', 'undodir' , '/tmp/nvim/undotree')
opt('o', 'undofile', true)
opt('o', 'autochdir', true)

-- opt('o', 'virtualedit', 'all')            -- 全方位移动
---------------------------------------
-------------------------------------------------------------------------------
---------------------------------------
-- ### gruvbox
g.gruvbox_bold = 1
g.gruvbox_filetype_hi_groups = 1
g.gruvbox_plugin_hi_groups = 1
g.gruvbox_italics = 0
g.gruvbox_italicize_strings = 0
g.gruvbox_transp_bg = 0
---------------------------------------
-- ### netrw
g.netrw_altv = 1
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_liststyle = 3
g.netrw_winsize = 24
g.netrw_dirhistmax = 0

-- g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

-- ### hiamlaya
vim.o.runtimepath = vim.o.runtimepath ..
                        ',~/.local/share/nvim/site/pack/packer/start/himalaya/vim'
vim.g['himalaya_mailbox_picker'] = 'native'





local utils = require('utils')
local map = utils.map
local mapa = utils.mapa
local g = vim.g
local cmd = vim.cmd

-------------------------------------------------------------------------------
----------------------------------------
g.mapleader = ' '
----------------------------------------
-- redo
map('n', 'U', '<CMD>:redo<CR>')

-- CR
--map('n', '<Space><Space>', '<CR>')
-- 切换窗口的键盘映射
map('n', '<A-H>', '<CMD>:wincmd h<CR>')
map('n', '<A-J>', '<CMD>:wincmd j<CR>')
map('n', '<A-K>', '<CMD>:wincmd k<CR>')
map('n', '<A-L>', '<CMD>:wincmd l<CR>')

-- 用方向键切换缓存的键盘映射
map('n', '<S-up>', ':bf<CR>')
map('n', '<S-down>', ':bl<CR>')
----------------------------------------
map('c', '<A-h>', '<Left>')
map('c', '<A-j>', '<Down>')
map('c', '<A-k>', '<Up>')
map('c', '<A-l>', '<Right>')

----------------------------------------
map('i', '<A-,>', '<Home>')
map('i', '<A-.>', '<End>')

map('i', '<A-H>', '<C-Left>')
map('i', '<A-J>', '<PageDown>')
map('i', '<A-K>', '<PageUp>')
map('i', '<A-L>', '<C-Right>')

map('i', '<A-h>', '<Left>')
map('i', '<A-j>', '<Down>')
map('i', '<A-k>', '<Up>')
map('i', '<A-l>', '<Right>')


cmd 'au FileType markdown inoremap <S-CR> <End> <br /><CR>'
    -- for markdown


----------------------------------------
map('n', ',', '^')
map('n', '.', '$')
map('n', ';', ':')
map('v', ',', '^')
map('v', '.', '$')

map('n', 'zo', 'mkggVGzO`k')

-- 保存文件并退出
map('i', '<F10>', '<ESC>:w<CR>')
map('n', '<F10>', '<ESC>:x<CR>')
map('n', 'qq', ':q!<CR>')
map('v', 'qq', '<Esc>:q!<CR>')

-- Close current buffer
-- 关闭当前缓冲区
map('n', '<C-c>', '<CMD>:bp | bd #<CR>')

-- ESC 键清除高亮痕迹
map('n', '<Esc><Esc>', ':noh<CR><Esc>')

map('n', '<A-h>', '<C-Left>')
map('n', '<A-j>', '<PageDown>')
map('n', '<A-k>', '<PageUp>')
map('n', '<A-l>', '<C-Right>')

-- 删除|复制|粘贴|全选
map('i', '<C-c>', '<Esc>YYi')
map('i', '<C-d>', '<Esc>ddi')
map('i', '<C-x>', '<Esc>"*pi<right>')
map('n', '<C-a>', '<Esc>ggVG')

map('n', '<leader>ss', 'lggVG:s```<left>')
map('n', '<Tab>h', ':bprev<CR>')
map('n', '<Tab>l', ':bnext<CR>')

-- ## Plug
-- ### tagbar

map('n', '<F8>', '<CMD>:TagbarToggle<CR>')

---
-- ### trans
g.translator_window_type = 'popup'
g.translator_proxy_url = 'http://127.0.0.1:8889'
-- g.translator_default_engines = "['youdao','google']"

cmd 'hi def link TranslatorQuery             Identifier'
cmd 'hi def link TranslatorDelimiter         Special'
cmd 'hi def link TranslatorExplain           Statement'
cmd 'hi def link TranslatorNF                NormalFloat'
cmd 'hi def link TranslatorBorderNF          NormalFloat'

mapa('v', '<Tab>tt', '<Plug>TranslateV<CR>')
mapa('v', '<Tab>tw', '<Plug>TranslateWV<CR>')
mapa('v', '<Tab>th', ':Translate engines=trans ""<left>')

---
-- ### coc
map('n', '<A-?>', "<CMD>:call CocActionAsync('doHover')<CR>")

---
-- ### himalaya
mapa('n', '<CR>', '<plug>(himalaya-msg-read)')
mapa('n', 'gm', '<plug>(himalaya-mbox-input)')
mapa('n', 'gh', '<plug>(himalaya-mbox-prev-page)')
mapa('n', 'gl', '<plug>(himalaya-mbox-next-page)')
mapa('n', 'gw', '<plug>(himalaya-msg-write)')
mapa('n', 'gR', '<plug>(himalaya-msg-reply)')
mapa('n', 'gr', '<plug>(himalaya-msg-reply-all)')
mapa('n', 'gf', '<plug>(himalaya-msg-forward)')
mapa('n', 'ga', '<plug>(himalaya-msg-attachments)')
mapa('n', 'gM', '<plug>(himalaya-msg-move)')
mapa('n', 'gD', '<plug>(himalaya-msg-delete)')

---
-- ### fn
map('n', '<F2>', '<CMD>:lua tk4e_zoom()<CR>')
map('n', '<F3>', '<CMD>:Lex<CR>')

map('n', '<F12>', '<CMD>:lua tk4e_build()<CR>')
map('i', '<F12>', '<CMD>:lua tk4e_build()<CR>')

---
-- ### undotree
map('n', '<F4>', '<CMD>:UndotreeToggle<CR>')

---
-- ### hop
map('n', '-f', '<CMD>:HopPattern<CR>')
map('n', '-d', '<CMD>:HopChar2<CR>')
map('n', '--', '<CMD>:HopWord<CR>')




local utils = require('utils')

local opt = utils.opt
local map = utils.map
local cmd = vim.cmd
local g = vim.g
local l = vim.l
local bo = vim.bo
local api = vim.api
local fn = vim.fn

-- #### 临时放大窗口
function tk4e_zoom()

    if fn.tabpagenr('$') > 1 then
        cmd 'tabclose'
        if fn.bufname('') then cmd 'call winrestview(winsaveview())' end
    else
        cmd 'tab split'
    end

end

--- #### Build
function tk4e_build()

    cmd 'exec "w"'
    local run = {
        ['rust'] = function() cmd 'exec "RustRun"' end,
        ['c'] = function()
            cmd 'exec "!gcc -std=c99 % -o %<"'
            cmd 'exec "!./%<"'
        end,
        ['cpp'] = function()
            cmd 'exec "!g++ % -o %<"'
            cmd 'exec "!./%<"'
        end,
        ['python'] = function() cmd 'exec "!python3 %"' end,
        ['lua'] = function()
            cmd 'exec "!lua-format % | sponge % && lua %"'
            cmd 'exec ":e"'
        end
    }
    local t = vim.bo.filetype
    local f = run[t]
    if (f) then
        f()
    else
        print("error")
    end

end

-- ### Load template
function tk4e_template()
    cmd 'au BufNewFile *.sh 0r ~/.config/nvim/template/shell'
    cmd 'au BufNewFile *.c 0r ~/.config/nvim/template/c'
    cmd 'au BufNewFile *.rs 0r ~/.config/nvim/template/rust'
    cmd 'au BufNewFile *.md 0r ~/.config/nvim/template/markdown'


end

function tk4e_netrw() cmd 'au VimEnter * :Lex | :wincmd l' end

function tk4e_q_netrw()
    cmd 'au WinEnter * if winnr(\'$\') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == \'quickfix\' |q| endif'
end

-- ###
function tk4e_DeleteSP() end

function tk4e_DeleteMM() end


---
tk4e_template()
tk4e_netrw()
tk4e_q_netrw()



" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/root/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/root/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/root/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Chips = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/Chips"
  },
  ass = {
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/ass"
  },
  ["auto.pairs"] = {
    config = { "require [[Plug/auto-pairs]]" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/auto.pairs"
  },
  ["coc.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/coc.nvim"
  },
  eleline = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/eleline"
  },
  himalaya = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/himalaya/vim"
  },
  hop = {
    config = { "require [[Plug/hop]]" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/hop"
  },
  init = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/init"
  },
  ["numb.nvim"] = {
    config = { "require [[Plug/numb]]" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "require [[Plug/nvim-bufferline]]" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  tabular = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/tabular"
  },
  tagbar = {
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/tagbar"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "require [[Plug/undotree]]" },
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-gruvbox8"] = {
    config = { "require [[Plug/gruvbox8]]" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
  },
  ["vim-illuminate"] = {
    config = { "require [[Plug/vim-illuminate]]" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-markdown-toc"] = {
    config = { "require [[Plug/vim-markdown-toc]]" },
    loaded = false,
    needs_bufread = true,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-translator"
  },
  ["vim-visual-multi"] = {
    config = { "require [[Plug/vim-visual-multi]]" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/root/.local/share/nvim/site/pack/packer/start/himalaya/vim"
time([[Runtimepath customization]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
require [[Plug/numb]]
time([[Config for numb.nvim]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
require [[Plug/vim-illuminate]]
time([[Config for vim-illuminate]], false)
-- Config for: auto.pairs
time([[Config for auto.pairs]], true)
require [[Plug/auto-pairs]]
time([[Config for auto.pairs]], false)
-- Config for: vim-gruvbox8
time([[Config for vim-gruvbox8]], true)
require [[Plug/gruvbox8]]
time([[Config for vim-gruvbox8]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require [[Plug/nvim-bufferline]]
time([[Config for nvim-bufferline.lua]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
require [[Plug/vim-visual-multi]]
time([[Config for vim-visual-multi]], false)
-- Config for: hop
time([[Config for hop]], true)
require [[Plug/hop]]
time([[Config for hop]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'tagbar', 'coc.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'tagbar', 'coc.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'tagbar', 'coc.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType str ++once lua require("packer.load")({'ass'}, { ft = "str" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown-toc'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType py ++once lua require("packer.load")({'tagbar', 'coc.nvim'}, { ft = "py" }, _G.packer_plugins)]]
vim.cmd [[au FileType ass ++once lua require("packer.load")({'ass'}, { ft = "ass" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'tagbar', 'coc.nvim'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType shell ++once lua require("packer.load")({'tagbar', 'coc.nvim'}, { ft = "shell" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'tagbar', 'coc.nvim'}, { ft = "cpp" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /root/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], true)
vim.cmd [[source /root/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /root/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

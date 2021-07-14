local utils = require('utils')

local opt = utils.opt
local fn = vim.fn
local g = vim.g
local cmd = vim.cmd

g.undotree_WindowLayout = 3

cmd 'call mkdir("/tmp/nvim/undotree", "p", 0700)'

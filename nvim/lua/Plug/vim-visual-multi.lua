local g = vim.g

vim.cmd 'let VM_maps = {} '
vim.cmd 'let g:VM_leader = \'\\\\\''
g.VM_maps["Add Cursor At Pos"] = '\\\\\\'
g.VM_mouse_mappings = 1
g.VM_default_mappings = 1
g.VM_show_warnings = 0
g.VM_theme = 'iceblue'
g.VM_maps["Redo"] = 'U'
g.VM_maps["Undo"] = 'u'
g.VM_maps["Visual All"] = '\\\\A'
g.VM_maps["Visual Cursors"] = '\\\\c'
g.VM_maps["Visual Find"] = '\\\\f'
g.VM_maps["Visual Regex"] = '\\\\/'
g.VM_maps['Find Under'] = ''

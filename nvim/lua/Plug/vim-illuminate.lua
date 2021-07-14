local g = vim.g
local cmd = vim.cmd



g.Illuminate_delay = 500



cmd 'hi illuminatedWord guibg=#555555'
cmd 'autocmd VimEnter * hi LspReferenceText cterm=italic gui=underline'
cmd 'autocmd VimEnter * hi LspReferenceRead cterm=italic gui=underline'
cmd 'autocmd VimEnter * hi LspReferenceWrite cterm=italic gui=underline'

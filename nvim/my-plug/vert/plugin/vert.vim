" enters insert mode to write vertically
function! VertStart()
    augroup Vert
        autocmd!
        " handles each entered character and moves cursor down
        autocmd InsertCharPre * call feedkeys("\<left>\<down>", 'n')
        autocmd InsertLeave * call VertEnd()
    augroup END

    inoremap <BS> <Up><Del>
    startinsert
endfunction

" cleans up on leaving insert mode
function! VertEnd()
    iunmap <BS>
    augroup Vert
        autocmd!
    augroup END
endfunction

" command to start writing vertically
command! Vert call VertStart()

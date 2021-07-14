inoremap <expr> ;<cr> getline('.')[-1:] == ';' ? '<Nop>' : '<End>;<CR>'
    " 检查是否存在 ; 在该行的末尾
    " 如果不存在则添加
    " 否则什么都不做





" i模式下输入 C-k + Enter + Enter  即可输入  .
  "下载插件
"let @p = ':PlugInstall'

"au InsertLeave * set nopaste
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" C
:au BufEnter c abbr #FOR for (i = 0; i < ; i++i) {<CR>}<Esc>O
:au BufLeave c unabbr #FOR

:au BufEnter c abbr #MAIN #include <stdio.h><CR><CR>int main(int argc, char *argv){<CR><CR><CR>}<Esc>kk0a
:au BufLeave c unabbr #MAIN

au FileType c nnoremap <buffer> <localleader>c I//<esc>



func! AsciiMode()
  syntax off
  setlocal virtualedit=all
  setlocal cc=80
  hi ColorColumn ctermbg=8 guibg=8
  autocmd BufWritePre * :%s/\s\+$//e
endfu

com! ASC call AsciiMode()
":ASC<CR>R



" 这个函数通过替换命令删除行尾空格
func! DeleteSP()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc


" 这个函数通过替换命令删除行尾^M
func! DeleteMM()
    exec "normal mz"
    %s/\r$//ge
    exec "normal `z"
endfunc

func! MMM()
    exec "normal mz"
    3s/date:.*/\=system("date '+date: %Y-%m-%d %H:%M:%S'", submatch(0))[0:-2]
    exec "normal mz"
endfunc



" 保存时自动删除行尾空格
au BufWritePre * :call DeleteSP()
au BufWritePre * :call DeleteMM()

au BufWritePre *.md :call MMM()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"let g:wiki_filetypes = ['md']
"let g:wiki_link_extension = '.md'

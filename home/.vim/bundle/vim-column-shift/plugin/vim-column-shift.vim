let b:ColumnShiftLastColumn = 0

function! s:LineShift(column)
    let b:ColumnShiftLastColumn = a:column
    call s:DoLineShift()
endfunction

function! s:DoLineShift()
    let l:curcol = virtcol('.')
    if l:curcol > b:ColumnShiftLastColumn
        execute "normal! d" . b:ColumnShiftLastColumn . "|"
    elseif l:curcol < b:ColumnShiftLastColumn
        execute "normal! " . (b:ColumnShiftLastColumn - l:curcol) . "i \<ESC>l"
    endif
endfunction

com! -nargs=1 Shift call s:LineShift(<f-args>)
nnoremap <silent> <Plug>Shift :call <SID>DoLineShift()<CR>
silent! call repeat#set("\<Plug>Shift", -1)

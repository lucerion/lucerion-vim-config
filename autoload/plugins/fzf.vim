comm! -nargs=* -range Grep call s:grep(<count>, <q-args>)

func! s:grep(selected_symbols, pattern) abort
  if !exists('g:grep_prog')
    call s:show_error('g:grep_prog is not defined') | return
  endif

  if !executable(g:grep_prog)
    call s:show_error(g:grep_prog . ' not found') | return
  endif

  if !exists('g:grep_options')
    let g:grep_options = ''
  endif

  let l:pattern = s:pattern(a:selected_symbols, a:pattern)
  let l:command = g:grep_prog . ' ' . g:grep_options . ' ' . shellescape(l:pattern)

  call fzf#vim#grep(l:command, fzf#vim#with_preview())
endfunc

func! s:pattern(selected_symbols, pattern) abort
  if a:selected_symbols >= 1
    return s:selection()
  endif

  return empty(a:pattern) ? expand('<cword>') : a:pattern
endfunc

func! s:selection() abort
  try
    let l:register_previous_value = @z
    normal! gv"zy
    let l:selection = @z
  finally
    let @z = l:register_previous_value
  endtry

  return l:selection
endfunc

func! s:show_error(message)
  echohl ErrorMsg | echomsg a:message | echohl None
endfunc

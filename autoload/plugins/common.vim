func! plugins#common#selection(selected_symbols, user_input) abort
  if a:selected_symbols >= 1
    return s:selection()
  endif

  return empty(a:user_input) ? expand('<cword>') : a:user_input
endfunc

func! plugins#common#show_error(message) abort
  echohl ErrorMsg | echomsg a:message | echohl None
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

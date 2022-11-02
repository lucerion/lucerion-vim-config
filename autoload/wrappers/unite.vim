if !exists('s:previous_grep')
  let s:previous_grep = {}
endif

func! wrappers#unite#grep(previous, selected_symbols_count, input) abort
  let l:previous_input = get(s:previous_grep, 'input')
  let l:previous_path = get(s:previous_grep, 'path')

  let l:input = a:previous && !empty(l:previous_input) ? l:previous_input : s:input(a:selected_symbols_count, a:input)
  if empty(l:input)
    return
  endif

  let l:path = a:previous && !empty(l:previous_path) ? l:previous_path : input('Target: ', '.', 'file')

  silent exec 'Unite grep' . ' -input='.escape(l:input, ' \\.') . ' -path='.l:path

  let s:previous_grep = { 'input': l:input, 'path': l:path }
endfunc

func! s:input(selected_symbols_count, input) abort
  let l:input = a:input

  if a:selected_symbols_count >= 1
    try
      let l:register_previous_value = @z
      normal! gv"zy
      let l:input = @z
    finally
      let @z = l:register_previous_value
    endtry
  endif

  if empty(l:input)
    let l:input = expand('<cword>')
  endif

  if empty(l:input)
    let l:input = input('Pattern: ')
  endif

  return l:input
endfunc

comm! -nargs=* -range Fr call s:replace(<count>, <q-args>)

let s:default_file_masks = {
  \ 'vimgrep': '**/*.*',
  \ 'ag': '.*',
  \ }

func! s:replace(selected_symbols, pattern) abort
  silent exec join([':Far', s:pattern(a:selected_symbols, a:pattern), s:replace_with(), s:filemask()])
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

func! s:replace_with() abort
  return input('Replace with: ', '', 'customlist,far#FarReplaceComplete')
endfunc

func! s:filemask() abort
  let l:filemask = input('File mask: ', '', 'customlist,far#FarFileMaskComplete')

  if !empty(l:filemask)
    return l:filemask
  endif

  return get(s:default_file_masks, g:far#source, '')
endfunc

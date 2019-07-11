let s:default_file_masks = {
  \ 'vimgrep': '**/*.*',
  \ 'ag': '.*',
  \ }

func! helpers#far#replace(selected_symbols_count, pattern) abort
  silent exec join([':Far', s:pattern(a:selected_symbols_count, a:pattern), s:replace_with(), s:filemask()])
endfunc

func! s:pattern(selected_symbols_count, pattern) abort
  if a:selected_symbols_count >= 1
    try
      let l:register_previous_value = @z
      normal! gv"zy
      let l:pattern = @z
    finally
      let @z = l:register_previous_value
    endtry
  else
    let l:pattern = empty(a:pattern) ? expand('<cword>') : a:pattern
  endif

  return l:pattern
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

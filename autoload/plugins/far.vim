let s:default_file_masks = {
  \ 'vimgrep': '**/*.*',
  \ 'ag': '.*',
  \ }

func! plugins#far#replace(selected_symbols, user_input) abort
  silent exec join([':Far', plugins#common#selection(a:selected_symbols, a:user_input), s:replace_with(), s:filemask()])
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

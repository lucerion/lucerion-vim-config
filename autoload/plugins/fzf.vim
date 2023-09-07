func! plugins#fzf#grep(selected_symbols, user_input) abort
  if !exists('g:grep_prog')
    call plugins#common#show_error('g:grep_prog is not defined') | return
  endif

  if !executable(g:grep_prog)
    call plugins#common#show_error(g:grep_prog . ' not found') | return
  endif

  if !exists('g:grep_options')
    let g:grep_options = ''
  endif

  let l:dir = input('Directory: ', '.', 'file')
  if !isdirectory(l:dir)
    call plugins#common#show_error('Directory ' . l:dir . ' not found') | return
  endif

  let l:pattern = plugins#common#selection(a:selected_symbols, a:user_input)
  let l:command = g:grep_prog . ' ' . g:grep_options . ' ' . shellescape(l:pattern)

  call fzf#vim#grep(l:command, fzf#vim#with_preview({ 'dir': l:dir }))
endfunc

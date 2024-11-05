comm! -nargs=* -range Grep call plugins#fzf#grep(<count>, <q-args>)
comm! -nargs=* -range Fr call plugins#far#replace(<count>, <q-args>)
comm! Cd silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()
comm! Err :ALEDetail
comm! Bookmarks call fzf#run(fzf#wrap({ 'source': g:fzf_bookmarks }))

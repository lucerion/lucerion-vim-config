comm! -nargs=* -range Grep call plugins#fzf#grep(<count>, <q-args>)
comm! -nargs=* -range Fr call plugins#far#replace(<count>, <q-args>)
comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()
comm! Det :ALEDetail

comm! -nargs=* -range Fr call plugins#far#replace(<count>, <q-args>)
comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()
comm! Det :ALEDetail

comm! -nargs=* -range Fr call wrappers#far#replace(<count>, <q-args>)
comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()
comm! Det :ALEDetail

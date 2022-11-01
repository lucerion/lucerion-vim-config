comm! -nargs=* -range -bang Grep call unite#grep_wrapper(!empty('<bang>'), <count>, <q-args>)
comm! -nargs=* -range Fr call far#replace_wrapper(<count>, <q-args>)
comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()

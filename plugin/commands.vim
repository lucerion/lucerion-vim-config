comm! -nargs=* -range -bang Grep call unite#grep_wrapper(!empty('<bang>'), <count>, <q-args>)
comm! -nargs=* -range Fr call far#replace_wrapper(<count>, <q-args>)
comm! GStatus silent exec 'Git | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
comm! GCommit silent exec 'Git commit'
comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()

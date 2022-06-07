comm! -nargs=* -range -bang Grep call helpers#unite#grep(!empty('<bang>'), <count>, <q-args>)
comm! -nargs=* -range Fr call helpers#far#replace(<count>, <q-args>)
comm! GStatus silent exec 'Git | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
comm! GCommit silent exec 'Git commit'
comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()

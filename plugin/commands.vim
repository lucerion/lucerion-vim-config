comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()
comm! Det :ALEDetail

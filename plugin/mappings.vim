let mapleader = ' '

noremap Q O<Esc>
noremap q o<Esc>
noremap <F1> <Nop>

noremap <S-l> gt
noremap <S-h> gT

noremap <Leader>tl :tabmove +1<CR>
noremap <Leader>th :tabmove -1<CR>
noremap <Leader>tL :tabmove <CR>
noremap <Leader>tH :tabmove 0<CR>

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

vnoremap < <gv
vnoremap > >gv

" next paragraph begin
noremap <Leader>jj })
" next paragraph end
noremap <Leader>J }}k
" previous paragraph begin
noremap <Leader>kk {(
" previous paragraph end
noremap <Leader>K {k
" current paragraph begin
noremap <Leader>jk }k
" current paragraph end
noremap <Leader>kj {j

" vim-test
noremap <Leader>ra :TestSuite<CR>
noremap <Leader>rd :TestSuite %:p:h<CR>
noremap <Leader>rf :TestFile<CR>
noremap <Leader>rn :TestNearest<CR>
noremap <Leader>rl :TestLast<CR>
noremap <Leader>rv :TestVisit<CR>

" splitjoin.vim
noremap <Leader>sj :SplitjoinJoin<CR>
noremap <Leader>ss :SplitjoinSplit<CR>

" vifm.vim
noremap <Leader>os :Left 50 TabVifm<CR>
noremap <Leader>ov :Bottom TabVifm<CR>

" vim-wordmotion
let g:wordmotion_mappings = {
  \ 'w':  '<Leader>w',
  \ 'b':  '<Leader>b',
  \ 'e':  '<Leader>e',
  \ 'ge': '<Leader>ge',
  \ 'aw': 'aw',
  \ 'iw': 'iw',
  \ '<C-R><C-W>': ''
  \ }

" vim-smartword
let g:smartword_mappings = {
  \ 'w':  '<Leader><Leader>w',
  \ 'b':  '<Leader><Leader>b',
  \ 'e':  '<Leader><Leader>e',
  \ 'ge': '<Leader><Leader>ge'
  \ }

" sideways.vim
noremap <Leader>aw :SidewaysJumpRight<CR>
noremap <Leader>ab :SidewaysJumpLeft<CR>
noremap <Leader>al :SidewaysRight<CR>
noremap <Leader>ah :SidewaysLeft<CR>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" far.vim
augroup FarMappings
  autocmd!
  autocmd FileType far nnoremap <buffer><silent>q :q<CR>
  autocmd FileType far nmap <buffer><silent>r Xi:Fardo<CR>I
augroup END

" help
augroup VimHelpMappings
  autocmd!
  autocmd FileType help nnoremap <buffer>q :q<CR>
augroup END

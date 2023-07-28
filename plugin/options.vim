if &rtp =~ 'srcery'
  colorscheme srcery
  let [g:srcery_bold, g:srcery_italic, g:srcery_underline] = [0, 0, 0]
endif

set statusline=%w%h\ %F\ %m
if &rtp =~ 'vim-fugitive'
  set statusline+=\ %{fugitive#statusline()}
endif
set statusline+=\ %r%=%l-%v/%L

if executable('ag')
  let g:grep_prog = 'ag'
  let g:grep_options = '--hidden --silent --vimgrep'
  let g:grep_command = g:grep_prog . ' ' . g:grep_options

  silent exec 'set grepprg=' . fnameescape(g:grep_command)
endif

" tagbar
let g:tagbar_compact = 1

" vifm.vim
let g:vifm_embed_split = 1
let g:vifm_embed_term = 1
let g:vifm_exec_args .= "-c ':only'"

" emmet-vim
let g:user_emmet_leader_key = '<C-e>'

" vim-trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ['far_vim']

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
augroup delimitMate_quotes
  autocmd!
  autocmd FileType ruby,eruby,haml,slim let delimitMate_quotes = "\" ' ` |"
augroup END
" https://github.com/tpope/vim-endwise/issues/133
if empty(maparg('<CR>', 'i'))
  imap <CR> <Plug>delimitMateCR
endif

" vim-gitgutter
let g:gitgutter_max_signs = 5000
if &rtp =~ 'vim-gitgutter'
  autocmd BufWritePost * GitGutter
endif

" splitjoin.vim
let g:splitjoin_ruby_hanging_args = 0

" vim-instant-markdown
let g:instant_markdown_autostart = 0

" vim-extract
let g:extract_hidden = 1

" vim-executor
let g:executor_reuse_buffer = 1

" vim-smartword
let g:smartword_enabled = 1

" ale
let g:ale_sign_warning = '>'
let g:ale_echo_msg_format = '[%linter%] %severity%: %s'
let g:ale_linters = {
  \ 'ruby': ['ruby', 'rubocop', 'reek'],
  \ 'elixir': ['credo', 'dialyxir'],
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'ruby': ['rubocop'],
  \ 'elixir': ['mix_format'],
  \ 'javascript': ['eslint'],
  \ }

" far.vim
let g:far#preview_window_height = 15
let g:far#file_mask_favorites = [
  \ '**/*.*',
  \ '%',
  \ '**/*.rb',
  \ '**/*.js',
  \ '**/*.ts',
  \ '**/*.coffee',
  \ '**/*.html',
  \ '**/*.erb',
  \ '**/*.haml',
  \ '**/*.slim',
  \ '**/*.css',
  \ '**/*.scss',
  \ '**/*.less',
  \ '**/*.vim',
  \ '**/*.ex*',
  \ '**/*.ex',
  \ '**/*.exs',
  \ ]
if exists('g:grep_prog')
  let g:far#source = g:grep_prog
  let g:far#file_mask_favorites = [
    \ '.*',
    \ '%',
    \ '\.rb$',
    \ '\.js$',
    \ '\.ts$',
    \ '\.coffee$',
    \ '\.html$',
    \ '\.erb$',
    \ '\.haml$',
    \ '\.slim$',
    \ '\.css$',
    \ '\.scss$',
    \ '\.less$',
    \ '\.vim$',
    \ '\.ex.*$',
    \ '\.ex$',
    \ '\.exs$',
    \ ]
endif

" projectionist
let g:projectionist_heuristics = {
 \   'lib/*.ex': {
 \     'alternate': 'test/{}_test.exs',
 \     'type': 'src'
 \   },
 \   'test/*_test.ex': {
 \     'alternate': 'lib/{}.ex',
 \     'type': 'test'
 \   }
 \ }

" vim-autocomplpop, alchemist.vim
let g:acp_behavior = {
  \   'elixir': [{
  \     'command': "\<C-x>\<C-o>",
  \     'meets': 'acp#meetsForRubyOmni',
  \     'repeat': 0
  \   }]
  \ }

" alchemist.vim
let g:alchemist_tag_map = 'gf'

" vim-snipmate
let g:snipMate = { 'snippet_version' : 1 }

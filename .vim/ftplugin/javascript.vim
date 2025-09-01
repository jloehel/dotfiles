setlocal expandtab
setlocal colorcolumn=81
" Use 2 space tabs for JavaScript
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell
" Include - for completion.
setlocal iskeyword+=-

let b:ale_fixers = [
\    'biome',
\    'eslint',
\]
let b:ale_linters = [
\    'biome',
\    'eslint',
\    'tsserver',
\]
let b:ale_javascript_eslint_options = '--ignore-pattern ''!.eslintrc.js'''
let b:ale_exclude_highlights = [
\   'Remember not to commit fit()',
\   'Remember not to commit fdescribe()',
\]
setlocal completeopt=menu,menuone,preview,noselect,noinsert

let s:dir = ale#path#Dirname(ale#path#FindNearestDirectory(bufnr(''), 'node_modules'))

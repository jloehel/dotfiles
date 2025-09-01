setlocal expandtab
setlocal colorcolumn=80
setlocal textwidth=79
" Enable comment continuation.
setlocal formatoptions+=cro
setlocal foldmethod=indent
setlocal foldminlines=10
setlocal textwidth=0

" Multi-line commenting and uncommenting.
vmap <buffer> <C-m> :s/^\(\s*\)/\1#/<Return>
vmap <buffer> <C-,> :s/^\(\s*\)#/\1/<Return>

" Change the line length for Python files based on configuration files.
function! ChangePythonLineLength() abort
    let l:conf = ale#path#FindNearestFile(bufnr(''), 'setup.cfg')
    " Reset settings back to defaults when configuration files are not found
    let l:line_length = 79

    if !empty(l:conf)
        for l:match in ale#util#GetMatches(
        \   readfile(l:conf),
        \   '\v^ *max-line-length *\= *(\d+)',
        \)
            let l:line_length = str2nr(l:match[1])
        endfor
    endif

    let &l:colorcolumn = l:line_length + 1
endfunction

call ChangePythonLineLength()

let b:ale_linters = ['ruff', 'mypy', 'bandit', 'refurb']
let b:ale_linters_ignore = []
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'ruff',
\   'black',
\   'isort',
\]
let g:ale_python_ruff_use_global = 1

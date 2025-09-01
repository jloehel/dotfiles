setlocal formatoptions-=t
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
" Use tabs for Go code, display them as 4 spaces.
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal nospell
setlocal colorcolumn=100

compiler go
"function! SetBuildTags()
"    ALEStopAllLSPs
"    if has_key(g:ale_go_gopls_init_options, 'build.buildFlags')
"      call remove(g:ale_go_gopls_init_options, 'build.buildFlags')
"    endif
"    if match(getline(1), '//go:build.*') >= 0
"      echo 'Loading build tags'
"      let tags = ParseGoBuildTags(matchstr(getline(1), '//go:build\s\+\zs\(.*\)'))
"      if !empty(tags)
"        let g:ale_go_gopls_init_options['build.buildFlags'] = ['-tags='.tags]
"      endif
"    endif
"endfunction
"
"function! ParseGoBuildTags(line)
"  echo 'Parsing go build tags: '.a:line
"  let tags = ''
"  for tag in split(a:line)
"    echo 'Tag: '.tag
"    if tag !~? '^!.*'
"      if empty(tags)
"        let tags = tags.tag
"      else
"        let tags = tags.','.tag
"      endif
"    endif
"  endfor
"  echo 'Return tags: '.tags
"  return tags
"endfunction
"
let b:ale_linters = ['gofmt', 'golangci-lint', 'gopls', 'govet']
let b:ale_fixers = ['gofmt', 'goimports', 'golines']
" Enable analyzers
" S1005: Drop unnecessary use of the blank identifier
" S1021: Merge variable declaration and assignment
" SA1002: Invalid format in time.Parse
" SA1017: Channels used with os/signal.Notify should be buffered
" SA1029: Inappropriate key in call to context.WithValue
" SA1032: Wrong order of arguments to errors.Is
" SA9007: Deleting a directory that shouldn't be deleted
" ST1003: Poorly chosen identifier
" ST1006: Poorly chosen receiver name
" ST1011: Poorly chosen name for variable of type time.Duratio
" ST1012: Poorly chosen name for error variable
" ST1013: Should use constants for HTTP error codes, not magic numbers
" ST1020: The documentation of an exported function should start with the function's name
" ST1021: The documentation of an exported type should start with type's name
" ST1022: The documentation of an exported variable or constant should start with variable's name
let g:ale_go_gopls_init_options = {
\   'ui.diagnostic.analyses': {
\       'S1005': v:true,
\       'S1021': v:true,
\       'SA1002': v:true,
\       'SA1017': v:true,
\       'SA1029': v:true,
\       'SA1032': v:true,
\       'SA9007': v:true,
\       'ST1003': v:true,
\       'ST1006': v:true,
\       'ST1011': v:true,
\       'ST1012': v:true,
\       'ST1013': v:true,
\       'ST1020': v:true,
\       'ST1021': v:true,
\       'ST1022': v:true,
\   },
\}

"augroup ALEProgress
"    autocmd!
"    autocmd User ALELintPre  call SetBuildTags()
"augroup END

augroup FiletypeGroup
    autocmd!
    " Treat lzz files like cpp files.
    au BufNewFile,BufRead *.lzz set filetype=cpp
    " .md is a markdown file.
    au BufNewFile,BufRead *.md set filetype=markdown
    " .ts is a Typescript file
    au FileType typescript JsPreTmpl
    au BufNewFile,BufRead *.ts set filetype=typescript
    " .pyi is a Python interface file.
    au BufNewFile,BufRead *.pyi set filetype=python
    " .dart is a Dart file
    au BufNewFile,BufRead *.dart set filetype=dart
    " .sublime-files are JSON files.
    au BufRead,BufNewFile *.sublime-project set filetype=json
    au BufRead,BufNewFile *.cson set filetype=coffee
    " Go files
    au BufRead,BufNewFile *.tmpl set filetype=gohtmltmpl
augroup EN

function! startup#autocmd#Init() abort
endfunction

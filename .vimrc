if empty(glob('~/.vim/autoload/plug.vim'))
   !mkdir -p ~/.vim/autoload/
    !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"" vim-plug
call plug#begin('~/.vim/bundle')
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json', { 'for': 'json' } "json
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-haml'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'reedes/vim-lexical'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'nanotech/jellybeans.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'plytophogy/vim-virtualenv'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vim-latex'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"" vim-gitgutter
set updatetime=200
let g:gitgutter_enabled = 1

"" vim-fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"" vim-airline
set noshowmode
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled=1
let g:airline_skip_empty_sections=1
let g:airline_detect_spell=1
let g:airline_symbols={}
let g:airline_symbols.maxlinenr=''

"" ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 20
let g:ctrlp_show_hidden = 1
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*.venv*
set wildignore+=*.git/*
set wildignore+=*.tox/*
set wildignore+=*.pytest/*
set wildignore+=*.eggs/*

"" nerdtree
map <C-n> :NERDTreeToggle<CR>

"" syntastic
" Python checks will be done by python-mode
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" complete-me
set previewpopup=height:10,width:60,highlight:PMenuSbar
set completeopt+=popup
set completepopup=height:15,width:60,border:off,highlight:PMenuSbar
let g:ycm_auto_hover=''

"" python-mode
let g:pymode = 1
let g:pymode_doc = 0
let g:pymode_options_max_line_length = 90
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace() # XXX BREAKPOINT'
let g:pymode_rope = 0
let g:pymode_folding = 0

"" spelling
augroup lexical
autocmd!
autocmd FileType markdown,mkd call lexical#init()
autocmd FileType textile call lexical#init()
autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=Red
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=Red
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=Red
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=Red
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
augroup END
let g:lexical#spelllang = ['en_us']
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add', '~/.vim/spell/de.utf-8.add', '~/.vim/spell/es.utf-8.add']
let g:lexical#spell_key = '<leader>s'
nmap <Leader>de :set spelllang=de<CR>
nmap <Leader>es :set spelllang=es<CR>

"" solarized
set background=dark
colorscheme solarized

"" vim-startify
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]

""
" Basics

filetype on
filetype plugin on
filetype indent on
syntax on
set encoding=utf-8

""
" Global stuff

" Timeouts
set timeout timeoutlen=1500 ttimeoutlen=100

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

" Show matched result.
set showmatch

" Don't show the current command in the lower right corner.
set showcmd

" Show numbers.
set number

" Don't show the mode, since this will be shown by the status line.
set noshowmode

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Don't wrap lines
set nowrap

" I don't like the backup and the swapfile thingies.
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undo/
    set undofile
    set undolevels=1000
catch
endtry


set backup
set backupdir=~/.vim/backups
set backupext=.bak
set directory=~/.vim/swap/

" Use always the clipboard.
" NOTE: this only works if you have vim with clipboard support. You can check
" this by calling vim --version and see if you have +clipboard.
set clipboard=unnamed

" Paste toggle
set pastetoggle=<f2>

""
" Cursor setup
set cursorline

""
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""
" Shell
if exists('$TMUX')
    set term=xterm-256color
endif
set ffs=unix,dos,mac


""
" Status line

" Returns the mode we are currently.
function! Mode()
  redraw
  let l:mode = mode()

  if     mode ==# "n" | return "NORMAL"
  elseif mode ==# "i" | return "INSERT"
  elseif mode ==# "R" | return "REPLACE"
  elseif mode ==# "v" | return "VISUAL"
  elseif mode ==# "V" | return "VISUAL-LINE"
  elseif mode ==# "s" | return "SELECT"
  elseif mode ==# ""  | return "VISUAL-BLOCK"
  else                | return l:mode
  endif
endfunc

" My own status line.
set stl=\ %{Mode()}\ \|\ %f\ %m\ %r\ %=\ Line:\ %l\ Column:\ %v\ Buf:#%n


" Always show the status line.
set laststatus=2

""
" Searching stuff.

" Ignore the case on search by default.
set ignorecase

" Case sensitive if we start the search by an uppercase letter.
set smartcase

" Find as you type search.
set incsearch

""
" Tabs, Indentation

set textwidth=79
set tabstop=2
set shiftwidth=2
set cindent
set autoindent
set smarttab
set expandtab
set backspace=indent,eol,start

" make needs hard tabs
autocmd FileType make setl noet

""
" Dev Languages

" yaml options
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

" latex options
let g:tex_flavor="latex"
autocmd FileType tex normal zR

" golang options
autocmd FileType go setl noet
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']

" rust options
autocmd FileType rust nnoremap <buffer><leader>f :<C-u>RustFmt<cr>
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

""
" Re-mappings
let mapleader = ','

" Make window navigation easier.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>v :vs<CR>
nnoremap <leader>V :vs<CR><C-w><C-l>

" <C-s> in normal/insert mode: switch to normal mode and write to disk.
inoremap <C-s> <ESC>:w<RETURN>
nnoremap <C-s> :w<RETURN>
vmap <C-s> <esc>:w<CR>gv

" Buffer navigation
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Close the current buffer
map <leader>bd :bd<cr>

" Editing
map 4 ^
map 0 $

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <C-u> mz:m+<cr>`z
nmap <C-i> mz:m-2<cr>`z
vmap <C-u> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-i> :m'<-2<cr>`>my`<mzgv`yo`z



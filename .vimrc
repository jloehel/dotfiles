" vint: -ProhibitSetNoCompatible
""
" Basics

filetype plugin indent on
syntax on
set encoding=utf-8
scriptencoding utf-8

""
" Global stuff

" Prefer unix format for files.
set fileformats=unix,dos,mac

" Timeouts
" I am not that fast anymore
set timeout timeoutlen=3000 ttimeoutlen=3000

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

" Enable the ruler
set ruler

" Disable folding
set nofoldenable

" Make the relative path automatic.
" set autochdir

" I don't like the backup and the swapfile thingies.
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
if has('nvim')
" nvim does not support the old undo format
" https://github.com/neovim/neovim/commit/6995fad260e3e7c49e4f9dc4b63de03989411c7b
    set undodir=~/.config/nvim/undo/
    set undofile
    set undolevels=10000
else
    set undodir=~/.vim/undo/
    set undofile
    set undolevels=10000
endif
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
set timeoutlen=500

""
" Shell
if exists('$TMUX')
    set term=xterm-256color
endif

" Returns the mode we are currently.
function! Mode()
  redraw
  let l:mode = mode()

  if     mode ==# 'n' | return 'NORMAL'
  elseif mode ==# 'i' | return 'INSERT'
  elseif mode ==# 'R' | return 'REPLACE'
  elseif mode ==# 'v' | return 'VISUAL'
  elseif mode ==# 'V' | return 'VISUAL-LINE'
  elseif mode ==# 's' | return 'SELECT'
  elseif mode ==# ''  | return 'VISUAL-BLOCK'
  else                | return l:mode
  endif
endfunc

" My own status line.
set statusline=\ %{Mode()}\ \|\ %f\ %m\ %r\ %=\ Line:\ %l\ Column:\ %v\ Buf:#%n

" Always show the status line.
set laststatus=2

""
" Searching stuff.

" Ignore the case on search by default.
set ignorecase

" Case sensitive if we start the search by an uppercase letter.
set smartcase
set completeopt=menu,preview,noselect

" Find as you type search.
set incsearch

""
" Tabs, Indentation
set colorcolumn=76
set textwidth=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cindent
set autoindent
set smarttab
set expandtab

""
" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
   !mkdir -p ~/.vim/autoload/
    !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"" vim-plug
call plug#begin('~/.vim/bundle')
"" Config
Plug 'editorconfig/editorconfig-vim'

"" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"" Look & Feel
Plug 'ryanoasis/vim-devicons'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/edge'

"" Essentials
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'

"" Syntax Highlighting
Plug 'sheerun/vim-polyglot'

""Linting
Plug 'dense-analysis/ale'

"" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-typos', {'do': 'yarn install --frozen-lockfile'}
" Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}
Plug 'jloehel/coc-pydocstring', {'branch': 'wip-fix-toml', 'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'npm install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}

"" Language support
""" Python
Plug 'plytophogy/vim-virtualenv'
""" reStructuredText
Plug 'habamax/vim-rst'
""" HTML, Javascript, CSS, ...
Plug 'ap/vim-css-color'
Plug 'lepture/vim-jinja'
Plug 'tpope/vim-haml'
""" Tern
Plug 'ternjs/tern_for_vim',

"" Git
Plug 'airblade/vim-gitgutter'

"" Tagging
Plug 'liuchengxu/vista.vim'

"" Spelling
Plug 'reedes/vim-lexical'
call plug#end()

"" vim-gitgutter
set updatetime=200
let g:gitgutter_enabled = 1

""
" vim-easymotion
map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"" vim-fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"" vim-airline
set noshowmode
let g:airline_theme='edge'
let g:airline#extensions#tabline#enabled=1
let g:airline_skip_empty_sections=1
let g:airline_detect_spell=1
let g:airline_symbols={}
let g:airline_symbols.maxlinenr=''
let g:airline#extensions#ale#enabled = 1

" coc
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"" ale
let g:ale_maximum_file_size = 1024 * 1024
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 1
let g:ale_loclist_msg_format = '[%linter%][%severity%] %s (%code%)'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s (%code%)'
let g:ale_sign_error = " \UF00E4"
let g:ale_sign_style_error = " \UF082D"
let g:ale_sign_warning = " \UF0026"
let g:ale_sign_style_warning = " \UF0027"
let g:ale_sign_info = " \UF02FD"
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
\   'site-packages/.*$': {
\       'ale_enabled': 0,
\       '&modifiable': 0,
\   },
\   '\v\.min\.(js|css)$': {
\       'ale_linters': [],
\       'ale_fixers': [],
\   },
\   'node_modules': {
\       'ale_fixers': [],
\   },
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

"" Vista
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'python': 'coc',
  \ 'go': 'coc',
  \ 'vimwiki': 'markdown',
  \ 'pandoc': 'markdown',
  \ 'markdown': 'toc',
  \ }
let g:vista_stay_on_open = 0
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\    'func': "\Uf0295",
\    'function': "\Uf0295",
\    'functions': "\Uf0295",
\    'var': "\uea88",
\    'variable': "\uea88",
\    'variables': "\uea88",
\    'const': "\ueb5d",
\    'constant': "\ueb5d",
\    'constructor': "\uf976",
\    'method': "\uea8c",
\    'package': "\ueb29",
\    'packages': "\ueb29",
\    'enum': "\uea95",
\    'enummember': "\ueb5e",
\    'enumerator': "\uea95",
\    'module': "\ueaec",
\    'modules': "\ueaec",
\    'type': "\uebb9",
\    'typedef': "\uebb9",
\    'types': "\uebb9",
\    'field': "\ueb5f",
\    'fields': "\ueb5f",
\    'macro': "\Uf03a4",
\    'macros': "\Uf03a4",
\    'map': "\Uf0645",
\    'class': "\ueb5b",
\    'augroup': "\Uf0645",
\    'struct': "\uea91",
\    'union': "\Uf0564",
\    'member': "\uf02b",
\    'target': "\Uf0394",
\    'property': "\ueb65",
\    'interface': "\ueb61",
\    'namespace': "\uea8b",
\    'subroutine': "\Uf04b0",
\    'implementation': "\uebba",
\    'typeParameter': "\uea92",
\    'default': "\uf29c"
\}


"" fzf
let g:fzf_command_prefix = 'FZF'
nnoremap <silent> <C-p> :FZFFiles<CR>
let g:fzf_buffers_jump = 1
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }


"" nerdtree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = [
\   '\.pyc$',
\   '^junit\.xml$',
\   '^__pycache__$',
\]
map <C-n> :NERDTreeToggle<CR>


"" spelling
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
let g:lexical#spellfile = [
\   '~/.vim/spell/en.utf-8.add',
\   '~/.vim/spell/de.utf-8.add',
\   '~/.vim/spell/es.utf-8.add',
\]
let g:lexical#spell_key = '<leader>s'

"" colorscheme
if has('termguicolors')
  set termguicolors
endif
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme edge

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

let g:path_remove_regex_list = [
\   '^.*/git/[^/]*/',
\]

" Disable replace mode, which turns on in bad terminals for some reason.
nnoremap R <Nop>

""" Tab Control
"""""""""""""""
" Bind Ctrl + t to opening new tabs.
noremap <C-t> :tabnew <Return>
" Bind Ctrl + w to close current tab.
noremap <C-w> :tabc <Return>
let g:lasttab = 1
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>
augroup TabControl
  autocmd!
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

""" Buffer Control
""""""""""""""""""
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
" Close the current buffer
map <leader>bd :bd<cr>

""" Window Control
""""""""""""""""""
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>v :vs<CR>
nnoremap <leader>V :vs<CR><C-w><C-l>
" Resize the window panes
noremap <silent> <C-S-Right> :vertical resize +1<CR>
noremap <silent> <C-S-Left> :vertical resize -1<CR>

""" Selections
""""""""""""""
" CTRL-A is Select all
" This works better than the default Windows script.
noremap <C-A> ggVG
inoremap <C-A> <Esc>ggvG
vnoremap <C-A> <Esc>ggVG

""" Motions
"""""""""""
map <leader>, ^

""" Spelling
""""""""""""
nmap <Leader>de :set spelllang=de_de<CR>
nmap <Leader>es :set spelllang=es_mx<CR>
nmap <Leader>en :set spelllang=en_us<CR>

""" Saving
""""""""""
" <C-s> in normal/insert mode: switch to normal mode and write to disk.
inoremap <C-s> <ESC>:w<RETURN>
nnoremap <C-s> :w<RETURN>
vmap <C-s> <esc>:w<CR>gv

""" Quitting
""""""""""
" Quit terminals with just 'q'
" TODO: Fix with popups
"tnoremap q <C-w>N:q!<CR>

""" Ale
""""""""""""
" Bind keys for moving between warnings.
nmap <silent> <leader>aj <Plug>(ale_previous_wrap)
nmap <silent> <leader>ak <Plug>(ale_next_wrap)
nnoremap K :ALEHover<CR>
nnoremap F :ALEFindReferences -tab<CR>
nnoremap <leader>rn :ALERename<CR>
noremap <leader>d  :ALEDetail<CR>
nnoremap <leader>df :ALEGoToDefinition -vsplit<CR>
nnoremap <leader>dt :ALEGoToTypeDefinition -vsplit<CR>
nnoremap <leader>ca :ALECodeAction<CR>
" Toggle ALE quick list
noremap <Leader>qf :call QFixToggle()<CR>
function! QFixToggle()
  if exists('g:qfix_win')
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr('$')
  endif
endfunction

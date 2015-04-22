set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-projectionist.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/TailMinusF.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/dbext.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'ecomba/vim-ruby-refactoring'

"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

call vundle#end()             " required
filetype plugin indent on     " required
"
map <C-n> :NERDTreeToggle<CR>

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

colorscheme railscasts
set backspace=2
syntax on
filetype indent on
set autoindent			" always set autoindenting on
set number
set nobackup
set ruler			" show cursor position all the time
set showcmd			" show incomplete commands
set incsearch			" do incremental searching
set history=50			" 50 linesof command line history
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
autocmd FileType ruby set sw=2 sts=2 et

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

hi StatusLine                guifg=#E6E1DC guibg=#414243 gui=NONE ctermfg=0 ctermbg=220 cterm=NONE
hi StatusLineNC              guibg=#303030 gui=NONE ctermbg=241 cterm=NONE

if executable('ag')
  " use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files - respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast so no need to cache
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  nnoremap \ :Ag<SPACE>
endif

" bind K to search text under cursor in a quick fix window
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Alt+movement to navigate window panes
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Maximise vertically and make panes the same size
nmap <silent> <A-Up> :wincmd _<CR>
nmap <silent> <A-Down> :wincmd =<CR>

" set minimum window height to zero
set wmh=0

" disable folding in markdown
let g:vim_markdown_folding_disabled=1


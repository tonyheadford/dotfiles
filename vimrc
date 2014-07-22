set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-projectionist.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tomtom/tcomment_vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'vim-scripts/TailMinusF.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/dbext.vim'

map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on     " required
"
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



set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
filetype plugin indent on     " required

colorscheme railscasts
set backspace=2
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
"
" fzf integration
set rtp+=/opt/homebrew/opt/fzf

autocmd FileType ruby set sw=2 sts=2 et

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" map <C-n> :NERDTreeToggle<CR>
" Show highlighting groups for current word
" nmap <C-S-P> :call <SID>SynStack()<CR>
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
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ 'vendor/bundle'

  " use ag in CtrlP for listing files - respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  " ag is fast so no need to cache
  " let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  " command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  " nnoremap \ :Ag<SPACE>
endif

" bind K to search text under cursor in a quick fix window
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Alt+movement to navigate window panes
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>

" Maximise vertically and make panes the same size
nmap <silent> <A-Up> :wincmd _<CR>
nmap <silent> <A-Down> :wincmd =<CR>

" map buffer list to F3
nnoremap <F3> :ls<CR>
" map buffer selection list to F2
nnoremap <F2> :buffers<CR>:buffer<Space>

nnoremap <C-X> :Explore<CR>

" map end of line to not include carriage-return
nmap $ g_

set clipboard=unnamed

" set minimum window height to zero
set wmh=0

" disable folding in markdown
let g:vim_markdown_folding_disabled=1

" ignore files and directories
set wildignore+=*/tmp/**
set wildignore+=*/vendor/**

" fat fingers helpers
:command W w
:command Q q

" enable jsx in .js files
let g:jsx_ext_required=0

" standard for linting js
let g:ale_linters = {
      \ 'javascript': ['standard'],
      \}
" only run linters that have been specified
let g:ale_linters_explicit = 1

" hide dot files by default (gh to toggle)
"' let ghregex='\(^\|\s\s)\zs\.\S\+'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" vim-rspec
let g:rspec_command = "!bundle exec rspec {spec}"
map <Leader>a :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>

" fzf
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>c :BCommits<CR>


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
set nocompatible              " be iMproved, required
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()



Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'chrisbra/unicode.vim'
"Plugin 'junegunn/fzf.vim' 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree' 
Plugin 'morhetz/gruvbox'
Plugin 'mattn/emmet-vim' 
"Plugin 'tpope/vim-fugitive'
"all new plugin here

call vundle#end()            " required
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1

if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"show the current line and coloumn also side numbers"
set ruler
set number


"set tab to four spaces"
set tabstop=4
set sw=4
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Underline the current line with dashes in normal mode
nnoremap <F5> yyp<c-v>$r-

" Underline the current line with dashes in insert mode
inoremap <F5> <Esc>yyp<c-v>$r-A
colorscheme gruvbox
set bg=dark
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

set autowrite

"let g:airline_right_alt_sep = '〈'
"let g:airline_right_sep = '🢐
"let g:airline_left_alt_sep= '〉'
"let g:airline_left_sep = ''

" Loads plugins that supports filetype and the related indent file
filetype plugin indent on

" Carry over the current lines indentation
set autoindent
" and autoindent if a new scope is entered
set smartindent
" Make tab and backspace work on entire indent levels
set smarttab
" Set tab and backspace to work on 4 columns
set softtabstop=4
" and set actual indent as 4 columns
set tabstop=4
" and set the smart / autoindent indent width to 4
set shiftwidth=4

" Set the maximum line length
set textwidth=79
" and draw a colored column there so that it acts as a guide
set colorcolumn=79





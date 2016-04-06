set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"""""""""""""""""""""""""""""""""""""""""""""""
"                                             "
" Vim settings in Windows OS Chinesse version "
"                                             "
"""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312,chinese,latin-1

if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

"language messages zh_CN.utf-8

" Font settings

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set gfw=Microsoft_Yahei_Mono:h10

set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
  	if &sh =~ '\<cmd'
      		let cmd = '""' . $VIMRUNTIME . '\diff"'
      		let eq = '"'
  	else
      		let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
  	endif
  else
  	let cmd = $VIMRUNTIME . '\diff'
  endif

  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq

endfunction

"""""""""""""""""""
"                 "
" Global Settings "
"                 "
"""""""""""""""""""

filetype off
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set showcmd
set smartcase
set incsearch
set hlsearch
set autoindent
set smartindent
set autowrite
set nu
set nospell
set mouse=a
"set relativenumber
set expandtab
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""
"                "
" Vundle Plugins "
"                "
""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gabrielelana/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

if has('gui_running')
    colorscheme solarized
    set background=dark
    "set guioptions-=m " remove menu bar
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scroll bar
    set nospell
    set lines=36 columns=108
    set colorcolumn=80
    "set guifont=Ubuntu_Mono
else
	"set background=dark
endif

set laststatus=2
set spell spelllang=en_us

" Specific backup files dir
" set nobackup
" set nowritebackup
set backupdir=~/.vimbackup
set directory=~/.vimbackup

""""""""""
" Keymap "
"        "
""""""""""
map <F3> :NERDTreeToggle<CR>

" The ArchLinux global vimrc - setting only a few sane defaults
"
" NEVER EDIT THIS FILE, IT'S OVERWRITTEN UPON UPGRADES, GLOBAL CONFIGURATION
" SHALL BE DONE IN /etc/vimrc, USER SPECIFIC CONFIGURATION IN ~/.vimrc

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing
syntax on 			"enable syntax highlighting
set number			"display line numbers
set cindent			"auto indent
set smartindent			"enable smartindent
set showcmd			"display commands

" Now we set some defaults for the editor
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" Move the swap file location to protect against CVE-2017-1000382
if ! isdirectory('~/.vim/swap/')
  silent! call system('install -dm 700 ~/.vim/swap')
endif
set directory=~/.vim/swap/

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

let g:powerline_pycmd = 'py3'

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

filetype plugin on
let g:pydiction_location = '/home/mukul/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3

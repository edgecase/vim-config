" required for several plugins
  set nocompatible

" enable syntax highlighting
  syntax on

" default color scheme
  set t_Co=256

" don't wrap long lines
  set nowrap

" show commands as we type them
  set showcmd

" highlight matching brackets
  set showmatch

" scroll the window when we get near the edge
  set scrolloff=4 sidescrolloff=10

" use 2 spaces for tabs
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  set smarttab

" enable line numbers, and don't make them any wider than necessary
  set number numberwidth=2

" show the first match as search strings are typed
  set incsearch

" highlight the search matches
  set hlsearch

" searching is case insensitive when all lowercase
  set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
  set gdefault

" set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

" pick up external file modifications
  set autoread

" don't abandon buffers when unloading
  set hidden

" match indentation of previous line
  set autoindent

" perform autoindenting based on filetype plugin
  filetype plugin indent on

" don't blink the cursor
  set guicursor=a:blinkon0

" show current line info (current/total)
  set ruler rulerformat=%=%l/%L

" show status line
  set laststatus=2

" augment status line
  function! ETry(function, ...)
    if exists('*'.a:function)
      return call(a:function, a:000)
    else
      return ''
    endif
  endfunction
  " set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{coc#status()}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

" When lines are cropped at the screen bottom, show as much as possible
  set display=lastline

" flip the default split directions to sane ones
  set splitright
  set splitbelow

" don't beep for errors
  set visualbell

" make backspace work in insert mode
  set backspace=indent,eol,start

" highlight trailing whitespace
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set list

" have the mouse enabled all the time
  set mouse=a

" use tab-complete to see a list of possiblities when entering commands
  set wildmode=list:longest,full

" allow lots of tabs
  set tabpagemax=20

" font
set guifont=Monaco:h13
set background=light

" show whitespace characters
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+ ",eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" native file finding
set path+=**
set wildmenu
set wildignore+=**/node_modules/**,**/deps/**,**/_build/**,**/target/**

" netrw config
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_list_hide = &wildignore

set grepprg=rg\ --vimgrep

" base16 config
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

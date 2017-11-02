" Use <SPACE> as <LEADER>
let mapleader = ' '

" Default color scheme
packadd! gruvbox
set background=dark
color gruvbox

" Fuzzy Finding
set rtp+=/usr/local/opt/fzf " use the Homebrew installed fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>T :Tags<CR>

" Ack.vim setup
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap g/ :Ack!<space>
nmap g* :Ack! <C-R><C-W><space>
nmap gn :cnext<CR>
nmap gp :cprev<CR>

" NERDTree
nmap <leader>g :NERDTreeToggle<CR>
nmap <leader>G :NERDTreeFind<CR>

" ProseMode
function! ProseMode()
  call goyo#execute(0, [])
  " TODO: enable Writegood mode
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction
command! ProseMode call ProseMode()
nmap <Leader>p :ProseMode<CR>

packadd! vim-rails
packadd! vim-rake
packadd! vim-bundler
packadd! vim-surround

" Rails extensions
if exists(':Emodel')
  map <Leader>oc :Econtroller<Space>
  map <Leader>ov :Eview<Space>
  map <Leader>om :Emodel<Space>
endif

" Elm
if exists(':ElmRepl')
  nmap <Leader>em :w<CR> :ElmMakeCurrentFile<CR>
  nmap <Leader>emm :wa<CR> :ElmMakeMain<CR>
  nmap <Leader>el :w<CR> :ElmEvalLine<CR>
  vmap <Leader>es :w<CR> :<C-u>ElmEvalSelection<CR>
  nmap <Leader>er :w<CR> :call ElmRepl()<CR>
endif


" TO RE-REVIEW:
" - matchit
" - ruby-matchit
"
" LOOKS COOL, INVESTIGATE LATER
" - easyclips
" - vim-easytags
" - UltiSnips
" - YouCompleteMe
"
"
" " Dash Searching"
"   NeoBundle "rizzatti/funcoo.vim"
"   NeoBundle "rizzatti/dash.vim"
"     nmap <Leader>qs <Plug>DashSearch
"     nmap <Leader>qa <Plug>DashGlobalSearch
"
"
" " Tagbar for navigation by tags using CTags
"   NeoBundle "majutsushi/tagbar"
"     let g:tagbar_autofocus = 1
    " map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
"     map <Leader>. :TagbarToggle<CR>
"
" " Tabular for aligning text
"   NeoBundle "godlygeek/tabular"
"   if exists(':Tabularize')
"     function! CustomTabularPatterns()
"       if exists('g:tabular_loaded')
"         AddTabularPattern! symbols         / :/l0
"         AddTabularPattern! hash            /^[^>]*\zs=>/
"         AddTabularPattern! chunks          / \S\+/l0
"         AddTabularPattern! assignment      / = /l0
"         AddTabularPattern! comma           /^[^,]*,/l1
"         AddTabularPattern! colon           /:\zs /l0
"         AddTabularPattern! options_hashes  /:\w\+ =>/
"       endif
"     endfunction
"
"     autocmd VimEnter * call CustomTabularPatterns()
"
"     " shortcut to align text with Tabular
"     map <Leader>a :Tabularize<space>
"   endif
"
" " ZoomWin to fullscreen a particular buffer without losing others
"   NeoBundle "vim-scripts/ZoomWin"
"     map <Leader>z :ZoomWin<CR>
"
"
" " Unimpaired for keymaps for quicky manipulating lines and files
"   NeoBundle "tpope/vim-unimpaired"
"     " Bubble single lines
"     nmap <C-Up> [e
"     nmap <C-Down> ]e
"
"     " Bubble multiple lines
"     vmap <C-Up> [egv
"     vmap <C-Down> ]egv
"



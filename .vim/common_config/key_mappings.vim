" close all other windows (in the current tab)
nnoremap gW :only<cr>

" go to the alternate file (previous buffer) with g-enter
nnoremap g<enter> <c-^>

" or with backspace
nnoremap <BS> <C-^>

" shortcuts for frequency used files
" nmap gs :e db/schema.rb<cr>
" nmap gr :e config/routes.rb<cr>
" nmap gm :e Gemfile<cr>

" insert blank lines without going into insert mode
nnoremap go o<esc>
nnoremap gO O<esc>

" mapping the jumping between splits. Hold control while using vim nav.
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" select the lines which were just pasted
nnoremap vv `[V`]

" clean up trailing whitespace
nnoremap <Leader>w :StripTrailingWhitespaces<cr>

" use bufkill-vim to delete the buffer without closing the window
" map <Leader>d :BD
" doesn't work....deletes a random character in the next buffer...
" nnoremap <Leader>d :buffer #<cr> && bd #<cr>
" delete all buffers
nnoremap <Leader>D :bufdo bd<cr>

" map spacebar to clear search highlight
nnoremap <Leader><cr> :noh<cr>

" Idea: <space><space> => " => peekaboo
" nnoremap <silent> <Plug>(peekaboo) :<c-u>call peekaboo#aboo()<cr>
" nnoremap <Leader><cr> "

" Idea: visual mode replace with default buffer
" vnoremap <vnoremap >p "rd"0P:let @"=@0

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" reindent the entire file
nnoremap <Leader>I gg=G``<cr>

" insert the path of currently edited file into a command
" Command mode: Ctrl-P
cnoremap <C-S-P> <C-R>=expand("%:p:h") . "/" <cr>
" explore a file relative to the current buffer's file
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . "/" <cr>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. With " line wrapping on, this can cause the cursor to actually skip a few lines on the screen because " it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' " to mean the next line on the screen
nnoremap j gj
nnoremap k gk

" Quickly fix spelling errors choosing the first result
nnoremap <Leader>z z=1<CR><CR>

nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>vv :vsplit ~/.vim/common_config/01_general_config.vim<cr>
nnoremap <leader>ve :e ~/.vim/common_config/01_general_config.vim<cr>
nnoremap <leader>vk :e ~/.vim/common_config/key_mappings.vim<cr>

" Join without a space
nnoremap gJ jx
vnoremap gJ jx
" Join and add a comma
nnoremap <leader>j Ji,<esc>
vnoremap <leader>j Ji,<esc>

" netrw commands
" nnoremap <leader>g :30Lexplore<CR>
" nnoremap <leader>G :30Lexplore <C-r>=expand("%:p:h") . "/" <CR><CR>

" easier escaping
" inoremap jk <esc><esc>
" inoremap kj <esc><esc>
" inoremap <esc> JK!
" nnoremap jk <esc><esc>
" nnoremap kj <esc><esc>
" nnoremap <esc> :echo JK!<cr>
" vnoremap jk <esc><esc>
" vnoremap kj <esc><esc>
" vnoremap <esc> :echo JK!<cr>
" onoremap jk <esc><esc>
" onoremap kj <esc><esc>
" onoremap <esc> :echo JK!<cr>

" to the left
nnoremap gh H
vnoremap gh H
nnoremap H ^
vnoremap H ^
" to the right
nnoremap gl L
vnoremap gl L
nnoremap L g_
vnoremap L g_

" always use very-magic searches
nnoremap / /\v

" setup grep properly
nnoremap g/ :silent execute "grep! " :copen<cr>
nnoremap g* :silent execute "grep!" shellescape(expand("<cWORD>")) <cr>:copen<cr>
nnoremap gn :cnext<cr>
nnoremap gp :cprev<cr>

nnoremap <leader><space>j :jumps<cr>
nnoremap <leader><space>m :marks<cr>
nnoremap <leader><space>r :registers<cr>

nnoremap <leader>f :find 
nnoremap <leader>F :find <c-r><c-w>

" Not sure why this doesn't work...
" nnoremap <leader>" ysiw"

" avoid stupid typos
iabbrev f63 f64
iabbrev f53 f64
iabbrev f54 f64
iabbrev f74 f64
iabbrev f73 f64

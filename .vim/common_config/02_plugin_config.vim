" Use <SPACE> as <LEADER>
let mapleader = ' '
let maplocalleader = '\'

" Default color scheme
" packadd! gruvbox8
set background=light
color gruvbox8

" Fuzzy Finding
" set rtp+=/usr/local/opt/fzf " use the Homebrew installed fzf
" nmap <Leader>b :Buffers<CR>
" nmap <Leader>t :Files<CR>
" nmap <Leader>T :Tags<CR>

" Ack.vim setup
" if executable('rg')
"   let g:ackprg = 'rg --vimgrep'
" endif
" nmap g/ :Ack!<space>
" nmap g* :Ack! <C-R><C-W><space>
" nmap gn :cnext<CR>
" nmap gp :cprev<CR>

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
nmap <Leader>P :ProseMode<CR>

" vim-surround: bracket manipulation
packadd! vim-surround

" ruby + rails
" packadd! vim-rails
" packadd! vim-rake
" packadd! vim-bundler

" Elixir
packadd! vim-elixir

" Rails extensions
if exists(':Emodel')
  map <Leader>oc :Econtroller<Space>
  map <Leader>ov :Eview<Space>
  map <Leader>om :Emodel<Space>
endif

" More text objects
packadd! argtextobj.vim
" packadd! vim-textobj-user
" packadd! vim-textobj-entire
" packadd! vim-textobj-indent
" packadd! vim-textobj-line
" packadd! vim-textobj-rubyblock

" vim-wiki: note organization
let g:vimwiki_list = [{'path': '/files/notes/vimwiki', 'ext': '.md', 'syntax': 'markdown'}]

" vim-signature: shows marks in gutter
let g:SignatureEnabledAtStartup=1

" traces.vim: better previews of substitions
packadd! traces.vim

" vim-peekaboo: quick view at the registers
packadd! vim-peekaboo

" COC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" packadd! coc.nvim
" set updatetime=400
" set signcolumn=number
" " tab completion
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" " trigger completion
" inoremap <silent><expr> <c-space> coc#refresh()
" 
" " navigation
" nnoremap <silent> gd <Plug>(coc-definition)
" nnoremap <silent> gy <Plug>(coc-type-definition)
" nnoremap <silent> gi <Plug>(coc-implementation)
" nnoremap <silent> gr <Plug>(coc-references)
" 
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
" nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
" nnoremap <leader>ce :CocDiagnostics<cr>
" nnoremap <leader>cc :CocConfig<cr>
" nnoremap <leader>ci :CocInfo<cr>
" 
" " documentation
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
" 
" " Highlight the symbol and its references when holding the cursor.
" augroup Highlight
"   autocmd!
"   autocmd CursorHold * silent call CocActionAsync('highlight')
" augroup END
" 
" " Symbol renaming.
" nnoremap <leader>rn <Plug>(coc-rename)
" 
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" vnoremap <leader>a  <Plug>(coc-codeaction-selected)
" nnoremap <leader>a  <Plug>(coc-codeaction-selected)
" " Remap keys for applying codeAction to the current buffer.
" nnoremap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nnoremap <leader>af  <Plug>(coc-fix-current)
" 
" " Find symbol of current document.
" nnoremap <leader>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <leader>s  :<C-u>CocList -I symbols<cr>
" 
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



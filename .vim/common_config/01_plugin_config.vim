" Plugins are managed by NeoBundle. Once VIM is open run :NeoBundleInstall to
" install plugins.
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins requiring no additional configuration or keymaps
  NeoBundle "michaeljsmith/vim-indent-object"
  NeoBundle "oscarh/vimerl"
  NeoBundle "pangloss/vim-javascript"
  NeoBundle "tomtom/tcomment_vim"
  NeoBundle "tpope/vim-endwise"
  NeoBundle "tpope/vim-fugitive"
  NeoBundle "tpope/vim-haml"
  NeoBundle "tpope/vim-rake"
  NeoBundle "tpope/vim-repeat"
  NeoBundle "vim-ruby/vim-ruby"
  NeoBundle "vim-scripts/L9"
  NeoBundle "vim-scripts/matchit.zip"
  NeoBundle "vim-scripts/ruby-matchit"
  NeoBundle "tpope/vim-abolish"
  NeoBundle "leafgarland/typescript-vim"

 " Vim airline configs
  NeoBundle 'bling/vim-airline'
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Easy motion config
  NeoBundle "Lokaltog/vim-easymotion"

"Supertab code completion"
  NeoBundle "ervandew/supertab"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Dash Searching"
  NeoBundle "rizzatti/funcoo.vim"
  NeoBundle "rizzatti/dash.vim"
    nmap <Leader>qs <Plug>DashSearch
    nmap <Leader>qa <Plug>DashGlobalSearch


" CtrlP
  NeoBundle "kien/ctrlp.vim"
    nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
    nnoremap <Leader>t :<C-U>CtrlP<CR>
    nnoremap <Leader>T :<C-U>CtrlPTag<CR>

    " respect the .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Go
  NeoBundle "jnwhiteh/vim-golang"
    au BufNewFile,BufRead *.go set filetype=go

" Slim
  NeoBundle "slim-template/vim-slim"
    au BufNewFile,BufRead *.slim set filetype=slim

" Less
  NeoBundle "groenewege/vim-less"
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars, Mustache, and Friends
  NeoBundle "mustache/vim-mustache-handlebars"
  au  BufNewFile,BufRead *.mustache,*.handlebars,*.hbs,*.hogan,*.hulk,*.hjs set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" Stylus
  NeoBundle "wavded/vim-stylus"
    au BufNewFile,BufRead *.styl set filetype=stylus

" Coffee script
  NeoBundle "kchmck/vim-coffee-script"
    au BufNewFile,BufRead *.coffee set filetype=coffee

" AG aka The Silver Searcher
  NeoBundle 'rking/ag.vim'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  NeoBundle "majutsushi/tagbar"
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
  NeoBundle "tpope/vim-markdown"
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  NeoBundle "scrooloose/nerdtree"
    let NERDTreeHijackNetrw = 0
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>


" Tabular for aligning text
  NeoBundle "godlygeek/tabular"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabularize<space>

" ZoomWin to fullscreen a particular buffer without losing others
  NeoBundle "vim-scripts/ZoomWin"
    map <Leader>z :ZoomWin<CR>


" Unimpaired for keymaps for quicky manipulating lines and files
  NeoBundle "tpope/vim-unimpaired"
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  NeoBundle "scrooloose/syntastic"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass','vue'] }


" gundo for awesome undo tree visualization
  NeoBundle "sjl/gundo.vim"
    map <Leader>h :GundoToggle<CR>


" rails.vim, nuff' said
  NeoBundle "tpope/vim-rails"
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  NeoBundle "tpope/vim-surround"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"


" Clojure Highlighting"
  NeoBundle "tpope/vim-fireplace"
  NeoBundle "tpope/vim-classpath"
  NeoBundle "guns/vim-clojure-static"
  NeoBundle "vim-scripts/paredit.vim"
  NeoBundle "amdt/vim-niji"
  autocmd BufNewFile,BufRead *.clj set filetype=clojure
  autocmd BufNewFile,BufRead *.edn set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs set filetype=clojure
  autocmd BufNewFile,BufRead *.cljx set filetype=clojure

  let g:paredit_leader= '\'
  let vimclojure#ParenRainbow  = 1

" Jade Highlighting"
  NeoBundle "digitaltoad/vim-jade"
  autocmd BufNewFile,BufRead *.jade set filetype=jade

" Scala Highlighting"
  NeoBundle "derekwyatt/vim-scala"
  autocmd BufNewFile,BufRead *.scala set filetype=scala

" Elixir plugin
  NeoBundle "elixir-lang/vim-elixir"
    au BufNewFile,BufRead *.ex set filetype=elixir
    au BufNewFile,BufRead *.exs set filetype=elixir

" Rust!
  NeoBundle 'wting/rust.vim'

" Easy async RSpec running
  NeoBundle 'thoughtbot/vim-rspec'
  NeoBundle "tpope/vim-dispatch"
  let g:rspec_command = "Dispatch rspec --format=progress --no-profile {spec}"
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

" Elm support -- https://elm-lang.org
  NeoBundle "lambdatoast/elm.vim"
  " Compilation
  nmap <Leader>em :w<CR> :ElmMakeCurrentFile<CR>
  nmap <Leader>emm :wa<CR> :ElmMakeMain<CR>

  " Evaluation
  nmap <Leader>el :w<CR> :ElmEvalLine<CR>
  vmap <Leader>es :w<CR> :<C-u>ElmEvalSelection<CR>

  " REPL
  nmap <Leader>er :w<CR> :call ElmRepl()<CR>

" React JSX support
  NeoBundle "mxw/vim-jsx"
  let g:jsx_ext_required = 0

" Vue Single File Component support
  NeoBundle "posva/vim-vue"
  
 call neobundle#end()

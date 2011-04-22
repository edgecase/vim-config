" Plugins are managed by Vundle. Once VIM is open run :BundleInstall to
" install plugins.

" Plugins requiring no additional configuration or keymaps
  Bundle "git://github.com/vim-scripts/Color-Sampler-Pack.git"
  Bundle "git://github.com/oscarh/vimerl.git"
  Bundle "git://github.com/tpope/vim-git.git"
  Bundle "git://github.com/harleypig/vcscommand.vim.git"
  Bundle "git://github.com/kchmck/vim-coffee-script.git"
  Bundle "git://github.com/altercation/vim-colors-solarized.git"
  Bundle "git://github.com/tpope/vim-cucumber.git"
  Bundle "git://github.com/tpope/vim-endwise.git"
  Bundle "git://github.com/tpope/vim-fugitive.git"
  Bundle "git://github.com/tpope/vim-haml.git"
  Bundle "git://github.com/digitaltoad/vim-jade.git"
  Bundle "git://github.com/pangloss/vim-javascript.git"
  Bundle "git://github.com/vim-scripts/L9.git"
  Bundle "git://github.com/tpope/vim-rake.git"
  Bundle "git://github.com/vim-ruby/vim-ruby.git"
  Bundle "git://github.com/ervandew/supertab.git"
  Bundle "git://github.com/tsaleh/vim-tcomment.git"
  Bundle "git://github.com/michaeljsmith/vim-indent-object.git"
  Bundle "git://github.com/kana/vim-textobj-user.git"
  Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
  Bundle "git://github.com/vim-scripts/SearchComplete.git"
  Bundle "git://github.com/tpope/vim-repeat.git"
  Bundle "git://github.com/vim-scripts/ruby-matchit.git"
  Bundle "git://github.com/wgibbs/vim-irblack.git"


" ACK (TRAILING WHITESPACE IS INTENTIONAL)
  Bundle "git://github.com/mileszs/ack.vim.git"
    nmap g/ :Ack!
    nmap g* :Ack! -w <C-R><C-W>
    nmap ga :AckAdd!
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>


" Taglist-plus for navigation by tags using CTags
  Bundle "git://github.com/int3/vim-taglist-plus.git"
    let Tlist_WinWidth='auto'

    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <C-\> :tnext<CR>
    map <Leader>. :TlistToggle<CR>


" Ruby focused unit test (wrapped in an if-loaded because it doesn't like
" being loaded twice)
  if !exists(':RunRubyFocusedUnitTest')
    Bundle "git://github.com/drewolson/ruby_focused_unit_test_vim.git"
      nmap <Leader>ra :wa<CR> :RunAllRubyTests<CR>
      nmap <Leader>rc :wa<CR> :RunRubyFocusedContext<CR>
      nmap <Leader>rf :wa<CR> :RunRubyFocusedUnitTest<CR>
      nmap <Leader>rl :wa<CR> :RunLastRubyTest<CR>
  endif

" Markdown syntax highlighting
  Bundle "git://github.com/tpope/vim-markdown.git"
    augroup mkd
      autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
      autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:>
      autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:>
    augroup END


" Markdown preview to quickly preview markdown files
  Bundle "git://github.com/robgleeson/vim-markdown-preview.git"
  map <buffer> <Leader>mp :Mm<CR>


" NERDTree for project drawer
  Bundle "git://github.com/scrooloose/nerdtree.git"
    let NERDTreeHijackNetrw = 0

    nmap gt :NERDTreeToggle<CR>
    nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>


" Tabular for aligning text
  Bundle "git://github.com/godlygeek/tabular.git"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /,\zs /l0
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabular<space>


" Fuzzy finder for quickling opening files / buffers
  Bundle "git://github.com/clones/vim-fuzzyfinder.git"
    let g:fuf_coveragefile_prompt = '>GoToFile[]>'
    let g:fuf_coveragefile_exclude = '\v\~$|' .
    \                                '\.(o|exe|dll|bak|swp|log|sqlite3|png|gif|jpg)$|' .
    \                                '(^|[/\\])\.(hg|git|bzr|bundle)($|[/\\])|' .
    \                                '(^|[/\\])(log|tmp|vendor|system|doc|coverage|build)($|[/\\])'

    let g:fuf_keyOpenTabpage = '<D-CR>'

    nmap <Leader>t :FufCoverageFile<CR>
    nmap <Leader>b :FufBuffer<CR>
    nmap <Leader>f :FufRenewCache<CR>


" ShowMarks to visually show placement of marks in files
  Bundle "git://github.com/garbas/vim-showmarks.git"
    let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
    highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
    highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
    highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen


" ZoomWin to fullscreen a particular buffer without losing others
  Bundle "git://github.com/vim-scripts/ZoomWin.git"
    map <Leader><Leader> :ZoomWin<CR>


" Unimpaired for keymaps for quicky manipulating lines and files
  Bundle "git://github.com/tpope/vim-unimpaired.git"
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  Bundle "git://github.com/scrooloose/syntastic.git"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_warnings=1


" gist-vim for quickly creating gists
  Bundle "git://github.com/mattn/gist-vim.git"
    if has("mac")
      let g:gist_clip_command = 'pbcopy'
    elseif has("unix")
      let g:gist_clip_command = 'xclip -selection clipboard'
    endif

    let g:gist_detect_filetype = 1
    let g:gist_open_browser_after_post = 1


" gundo for awesome undo tree visualization
  Bundle "git://github.com/sjl/gundo.vim.git"
    map <Leader>h :GundoToggle<CR>


" rails.vim, nuff' said
  Bundle "git://github.com/tpope/vim-rails.git"
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>


" surround for adding surround 'physics'
  Bundle "git://github.com/tpope/vim-surround.git"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"

" Markdown syntax highlighting
  augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:>
    autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:>
  augroup END

" Allow old-school vim directory exploring
let NERDTreeHijackNetrw = 0

" Add some alignment patterns for :Tabular
function! CustomTabularPatterns()
  AddTabularPattern! symbols         / :/l0
  AddTabularPattern! hash            /=>/
  AddTabularPattern! chunks          / \S\+/l0
  AddTabularPattern! assignment      /= /l1l0
  AddTabularPattern! comma           /,\zs /l0
  AddTabularPattern! colon           /:\zs /l0
endfunction
autocmd VimEnter * call CustomTabularPatterns()

let g:fuf_coveragefile_prompt = '>GoToFile[]>'
let g:fuf_coveragefile_exclude = '\v\~$|' .
\                                '\.(o|exe|dll|bak|swp|log|sqlite3|png|gif|jpg)$|' .
\                                '(^|[/\\])\.(hg|git|bzr|bundle)($|[/\\])|' .
\                                '(^|[/\\])(log|tmp|vendor|system|doc|coverage|build)($|[/\\])'


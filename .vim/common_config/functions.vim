fun! Html2haml()
  %!html2haml -r
  save %:r.haml
  setf haml
  !git rm %:r.erb
endfun

let html_use_css = 1 " Use stylesheet instead of inline style
let html_number_lines = 0 " don't show line numbers
let html_no_pre = 1 " don't wrap lines in <pre>

function! OpenHtml(line1, line2)
  exec a:line1.','.a:line2.'TOhtml'
  %s/monospace/Monaco/g
  %s/bold/normal/g
  save! /tmp/__OpenHtml.html
  !open %
  q
endfunction
command! -range=% OpenHtml :call OpenHtml(<line1>,<line2>)

" Tidy an HTML/XML file inline
command! Tidy :%! tidy -indent -quiet -wrap 100

" Align all colon-separated content (CSS rules) in a file
command! AlignColons execute 'g/:/Tabularize colon' | noh

" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

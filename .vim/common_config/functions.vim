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


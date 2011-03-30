fun! Html2haml()
  %!html2haml -r
  save %:r.haml
  setf haml
  !git rm %:r.erb
endfun


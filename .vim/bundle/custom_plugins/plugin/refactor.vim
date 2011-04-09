" :Refactor oldname newname
"   - project-wide substitution, with confirmation

function! Refactor(old, new)
  let files = system('ack -l ' . a:old)
  let substitution = '%s/' . a:old . '/' . a:new . '/ce'

  " reset the args list to all files (recursively) in the current directory that contain <old>
  execute 'args' substitute(files, "\n", " ", "g")

  " replace <old> with <new> in each arg file, with confirmation, suppress 'no match' errors, and save each file
  " (argdo will add Syntax to eventignore, but we want syntax highlighting)
  execute 'argdo set eventignore-=Syntax | ' . substitution . ' | update'
endfunction

command! -nargs=+ Refactor call Refactor(<f-args>)


" :Refactor oldname newname
"   - project-wide substitution, with confirmation
"   - substitution will persist the case of what is replaced

function! MatchCase(original, master)
  if match(a:master, '^\C[A-Z_]\+$') > -1
    return AllCaps(a:original)
  elseif match(a:master, '^\C[A-Z]') > -1
    return CamelCase(a:original, 1)
  elseif match(a:master, '\C[A-Z]') > -1
    return CamelCase(a:original, 0)
  else
    return Underscore(a:original)
  endif
endfunction

function! AllCaps(name)
  let words = []
  for word in Words(a:name)
    call add(words, toupper(word))
  endfor
  return join(words, '_')
endfunction

function! CamelCase(name, capitalize_first_char)
  let words = []
  for word in Words(a:name)
    let word = toupper(strpart(word, 0, 1)) . tolower(strpart(word, 1))
    call add(words, word)
  endfor
  if a:capitalize_first_char
    return join(words, '')
  else
    return substitute(join(words, ''), '^.', '\=tolower(submatch(0))', '')
  endif
endfunction

function! Underscore(name)
  let words = []
  for word in Words(a:name)
    call add(words, tolower(word))
  endfor
  return join(words, '_')
endfunction

function! Words(name)
  if len(split(a:name, '\C[A-Z]')) > 1
    let remaining = a:name
    let next_cap = match(remaining, '\C.[A-Z]') + 1
    let words = []
    while len(remaining) > 0
      if next_cap > 0
        let word = strpart(remaining, 0, next_cap)
        let remaining = strpart(remaining, next_cap)
        let next_cap = match(remaining, '\C.[A-Z]') + 1
      else
        let word = strpart(remaining, 0)
        let remaining = ''
      endif
      call add(words, word)
    endwhile
    return words
  else
    return split(a:name, '_')
  endif
endfunction

function! Refactor(old, new)
  let pattern = substitute(Underscore(a:old), '_', '_\\?', 'g')
  let files = system('ack -li ' . pattern)
  let substitution = '%s/' . pattern . '/\=MatchCase("' . a:new . '", submatch(0))/ce'

  " reset the args list to all files in the app directory that contain <old> (case insensitive)
  execute 'args' substitute(files, "\n", " ", "g")

  " replace <old> with <new> in each arg file, with confirmation, suppress 'no match' errors, and save each file
  " (argdo will add Syntax to eventignore, but we want syntax highlighting)
  execute 'argdo set eventignore-=Syntax | ' . substitution . ' | update'
endfunction

command! -nargs=+ -complete=file Refactor call Refactor(<f-args>)


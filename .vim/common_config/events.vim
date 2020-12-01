" remember last position in file
augroup RememberLastPosition
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
augroup END

" Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
augroup RubyIshFiles
  autocmd!
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
augroup END

" JSON is JS
augroup JsonIsJavascript
  autocmd!
  autocmd BufNewFile,BufRead *.json set ai filetype=javascript
augroup END

augroup GitCommitEditMsg
  autocmd!
  " for git, add spell checking and automatic wrapping at 72 columns
  autocmd Filetype gitcommit setlocal spell textwidth=72
  autocmd BufReadPost */.git/COMMIT_EDITMSG :normal! gg
augroup END

" Source the vimrc file after saving it
autocmd bufwritepost ~/src/vim-config/.vim/custom_config/custom.gvim source ~/src/vim-config/.vim/custom_config/custom.gvim

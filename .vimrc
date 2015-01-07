set rtp+=~/.vim/bundle/neobundle.vim/

runtime! custom_preconfig/*.vim
runtime! common_config/*.vim
runtime! custom_config/*.vim

" for git, add spell checking and automatic wrapping at 72 columns
autocmd Filetype gitcommit setlocal spell textwidth=72


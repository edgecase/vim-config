" bring in the bundles
set rtp+=~/.vim/vundle.git/
call vundle#rc()

runtime! common_config/*.vim

" attempt to load a custom config for the currently logged in user
runtime! custom_config/*.vim

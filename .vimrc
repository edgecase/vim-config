" bring in the bundles
set rtp+=~/.vim/vundle.git/
call vundle#rc()

runtime! common_config/*.vim
runtime! custom_config/*.vim

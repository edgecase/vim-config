" bring in the bundles
call pathogen#runtime_append_all_bundles()

runtime! common_config/*.vim

" attempt to load a custom config for the currently logged in user
runtime! custom_config/`whoami`.vim

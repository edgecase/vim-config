" Add the Configs command to pull in custom configuration
"
" Example: The following will try to pull in configs from
"          .vim/custom_config/adam.vim
"
"   :Configs adam

command! -nargs=1 Configs runtime! custom_config/<args>.vim | runtime! custom_config/<args>.gvim

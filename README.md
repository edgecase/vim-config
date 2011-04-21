# EdgeCase Vim Config

You should give it a try.

## Install

1) git clone git://github.com/edgecase/vim-config.git
2) rake (This will symlink the necessary files to your home directory, asking for permission before clobbering anything.)
3) vim
4) :BundleInstall (This will clone and install all of the plugins from github.)

## Customizing

Customizations can be added to .vim/custom_config/username.vim and .vim/custom_config.username.gvim,
where username == `whoami`.  When Vim starts up, it will look for customization files matching the
name of the currently logged-in user.

You can add custom plugins by registering them in this custom config file with the same Bundle "<plugin-repo>" 
syntax used in the common_config/plugin_config.vim, and then performing steps 3 & 4 from the install steps above.

## TODO

* Add some documentation

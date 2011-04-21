# EdgeCase Vim Config

You should give it a try.

## Pre-requisites

This config is built primarily to work on top of the OSX version of `MacVim`, but should be usable on top of other `vim` or `gvim` 
installations that are built with all of the `vim` features necessary to support the used plugins.

## Install

1. `git clone git://github.com/edgecase/vim-config.git`
2. `rake` (This will symlink the necessary files to your home directory, asking for permission before clobbering anything.)
3. `vim`
4. `:BundleInstall` (This will clone and install all of the plugins from github.)

## Customizing

Customizations can be added to `.vim/custom_config/username.vim` and `.vim/custom_config.username.gvim`,
where username == `whoami`.  When Vim starts up, it will look for customization files matching the
name of the currently logged-in user.

You can add custom plugins by registering them in this custom config file with the same `Bundle "plugin-repo-url"`
syntax used in the `.vim/common_config/plugin_config.vim`, and then performing steps 3 & 4 from the install steps above.

## Ruby focused unit test

Makes it easy to run a focused set of ruby tests from within `vim`.

* Run the test/spec your cursor is currently on
* Run the context your cursor is currently in
* Run the entire test/spec you are working in
* Streaming output to a new buffer

This plugin currently supports

* `test/unit`
* `dust`
* `rspec`
* `shoulda`

**Customizations**:

* `<Leader>ra` - run all tests in the current buffer
* `<Leader>rc` - run all tests in the current context
* `<Leader>rf` - run current test
* `<Leader>rl` - re-run last test command

## "Project Drawer" aka NERDTree

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
`:help NERDTree`.

**Customizations**:
Use `<Leader>t` to toggle NERDTree

## Ack.vim

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack

**Customizations**: `g/` to bring up `:Ack `.

## Align

Align lets you align statements on their equal signs, make comment
boxes, align comments, align declarations, etc.

* `:5,10Align =>` to align lines 5-10 on `=>`'s

## indent\_object

Indent object creates a "text object" that is relative to the current
ident. Text objects work inside of visual mode, and with `c` (change),
`d` (delete) and `y` (yank). For instance, try going into a method in
normal mode, and type `v ii`. Then repeat `ii`.

## text-object-ruby-block

When textobj-rubyblock is installed you will gain two new text objects, 
which are triggered by `ar` and `ir` respectively. These follow Vim convention, 
so that `ar` selects all of a ruby block, and `ir` selects the inner portion 
of a rubyblock.

In ruby, a block is always closed with the end keyword. Ruby blocks may 
be opened using one of several keywords, including module, class, def, if, 
and do. 

## surround

Surround allows you to modify "surroundings" around the current text.
For instance, if the cursor was inside `"foo bar"`, you could type
`cs"'` to convert the text to `'foo bar'`.

There's a lot more; check it out at `:help surround`

## SuperTab

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.

## ctags

Includes the TagList plugin, which binds `:Tlist` to an overview
panel that lists all ctags for easy navigation.

**Customizations**: Binds `<Leader>rt` to the ctags command to
update tags. Bind `<Leader>.` to toggle the taglist window

**Note**: For full language support, run `brew install ctags` to install
exuberant-ctags.

**Tip**: Check out `:help ctags` for information about VIM's built-in
ctag support. Tag navigation creates a stack which can traversed via
`Ctrl-]` (to find the source of a token) and `Ctrl-T` (to jump back up
one level).

## Git Support (Fugitive)

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

## Gist-vim

Nice [gist integration](https://github.com/mattn/gist-vim) by mattn.
Requires exporting your `GITHUB_TOKEN` and `GITHUB_USER` as environment
variables or setup your [GitHub token config](http://help.github.com/git-email-settings/).

Try `:Gist`, `:Gist -p` and visual blocks.

## ZoomWin

When working with split windows, ZoomWin lets you zoom into a window and
out again using `Ctrl-W o`

**Customizations**: Janus binds `<Leader>z` to `:ZoomWin`

## Markdown Preview

Markdown preview takes the current buffer, converts the Markdown to
HTML, and opens it in your default browser.

**Customizations**: Binds `<Leader>mp` to this plugin.

## Additional Syntaxes

Ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)

## Color schemes

Includes the vim color sampler pack, which includes [over 100
popular color themes](http://www.vi-improved.org/color_sampler_pack/):

* jellybeans
* matrix
* railscasts2
* tango
* vibrantink
* vividchalk
* wombat
* xoria256

Use `:color vibrantink` to switch to a color scheme.


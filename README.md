# EdgeCase Vim Config

You should give it a try.

## Pre-requisites

This config is built primarily to work on top of the OSX version of `MacVim`, but should be usable on top of other `vim` or `gvim` installations that are built with all of the `vim` features necessary to support the used plugins.

## Font Requirement
This vim configuration requires the Meslo font from
[https://github.com/Lokaltog/powerline-fonts](https://github.com/Lokaltog/powerline-fonts)

## Attention Windows Users!

If you are installing this config on Microsoft Windows, you must download and install the latest [RailsInstaller](http://www.railsinstaller.org/) package.  Go ahead and do it now.  I'll wait.

Install the latest version of [Vim](http://www.vim.org/download.php#pc) and install with default options + checking the "Create .bat files for command line use".

The Windows version of the Vim configuration uses rake (for installation) git (for Vim plugin installations), and requires several other packages to emulate Ack (for file searching) and Curl (for gists) under Windows.  RailsInstaller is a single package that installs everything we will need to get things working.

## Install

Windows users: be sure to use **RailsInstaller** > **Command Prompt with Ruby and Rails** to perform these installation steps instead of the normal command prompt.

1. `git clone git@github.com:edgecase/vim-config.git`
2. `cd vim-config`
3. `rake` (This will symlink the necessary files to your home directory, asking for permission before clobbering anything.)
4. `vim` (or in Windows: `gvim`)
5. `:NeoBundleClean` (if you have previously used this EdgeCase Vim config)
6. `:NeoBundleInstall` (This will clone and install all of the plugins from github.)

## Customizing

Customizations can be added to the folder `.vim/custom_preconfig/` or `.vim/custom_config/`

* Any files with a `.vim` extension in that folder will be loaded when running all versions of `vim`.
* Any files with a `.gvim` extension in that folder will be loaded when running a graphical version of `vim`.

The custom_preconfig settings are loaded prior to the common config. A common usecase for this is to reset mapleader.  Most of the rest of the customizations are placed in custom_config.

You can add custom plugins by registering them in a `.vim` file in the custom_config folder with the same `NeoBundle "plugin-repo-url"`
syntax used in the `.vim/common_config/plugin_config.vim`, and then performing steps 3 & 4 from the install steps above.

Common practice is to symlink a folder containing your custom configuration files as the `.vim/custom_config` folder.

## Key mappings (remember case matters!)

* `CMD + i` - exit out of insert mode
* `<leader>w` - turn on line wrapping
* `<leader>W` - turn off line wrapping
* `<leader>ss` - save all buffers
* `Y` - copy (yank) from the cursor to the end of the line
* `vv` - select the lines which were just pasted
* `<leader><spacebar>` - clear search highlighting
* `<C-p>` - insert path of currently active buffer into command

#### Whitespace key mappings

* `go` - insert blank line below current without entering insert mode
* `gO` - insert blank line above current without entering insert mode
* `<leader>I` - reindent the entire file
* `<leader>c` - cleanup trailing whitespace in current buffer
* `<leader>e` - compress excess whitespace on current line (cleans tabularize spacing)

#### Buffers & Navigation key mappings

* `gW` - close all buffers other than the active one (within current tab)
* `g<Enter>` - go back to the previously active buffer
* `<leader>d` - delete all buffers
* `<tab>` - match bracket pairs in normal and visual mode

* `<C-w-j>` - move one buffer down
* `<C-w-k>` - move one buffer up
* `<C-w-h>` - move one buffer left
* `<C-w-l>` - move one buffer right

* `shift + up-arrow` - make horizontal split larger
* `shift + down-arrow` - make horizontal split smaller
* `shift + left-arrow` - make vertical split smaller
* `shift + right-arrow` - make vertical split larger

#### Ruby key mappings

* `<C-l>` - insert a `=>` surrounded by spaces

#### Rails key mappings

* `gs` - jump to schema file
* `gr` - jump to routes file
* `gm` - jump to Gemfile

#### Macros (from within insert mode type abbreviation followed by punctuation or space)

* `Lidsa` - insert some lorem ipsum text
* `rdebug` - insert ruby specfic debugger statement

## CtrlP

Provides convenient ways to quickly reach the
buffer/file/command/bookmark/tag you want. CtrlP searches with the
fuzzy/partial pattern to which it converted an entered pattern.

* `<leader>t` - fuzzy find files
* `<leader>b` - fuzzy find open buffers
* `<leader>T` - use fuzzy finder to navigate via tags instead of built-in tag navigation
* `<C-j>` - open selected item in window in horizontal split
* `<C-k>` - open selected item in vertical split

## Unimpaired

Utility functions for working with lines, files, and elements.

**Customizations**

* `<C-Up>` - Move lines up through a file (works in normal or visual mode, and multiple lines)
* `<C-Down>` - Move lines down through a file (works in normal or visual mode, and multiple lines)

## Syntastic

Syntastic is a syntax checking plugin that runs buffers through external syntax
checkers as they are saved and opened. If syntax errors are detected, the user
is notified and is happy because they didn't have to compile their code or
execute their script to find them.

## Gundo

Awesome visual representation of `vim` undo tree.

**Customizations**

* `<leader>h` - Toggle gundo

## T-Comment

TComment works like a toggle, i.e., it will comment out text that
contains uncommented lines, and it will remove comment markup for
already commented text (i.e. text that contains no uncommented lines).

If the file-type is properly defined, TComment will figure out which
comment string to use. Otherwise you use |TCommentDefineType()| to
override the default choice.

TComment can properly handle an embedded syntax, e.g., ruby/python/perl
regions in vim scripts, HTML or JavaScript in php code etc.

* `gc{motion}` - Toggle comments (for small comments within one line the &filetype_inline style will be used, if defined)
* `gcc`        - Toggle comment for the current line
* `gC{motion}` - Comment region
* `gCc`        - Comment the current line


## Fugitive

I'm not going to lie to you; fugitive.vim may very well be the best
Git wrapper of all time.  Check out these features:

View any blob, tree, commit, or tag in the repository with `:Gedit` (and
`:Gsplit`, `:Gvsplit`, `:Gtabedit`, ...).  Edit a file in the index and
write to it to stage the changes.  Use `:Gdiff` to bring up the staged
version of the file side by side with the working tree version and use
Vim's diff handling capabilities to stage a subset of the file's
changes.

Bring up the output of `git status` with `:Gstatus`.  Press `-` to
`add`/`reset` a file's changes, or `p` to `add`/`reset` `--patch` that
mofo.  And guess what `:Gcommit` does!

`:Gblame` brings up an interactive vertical split with `git blame`
output.  Press enter on a line to reblame the file as it stood in that
commit, or `o` to open that commit in a split.  When you're done, use
`:Gedit` in the historic buffer to go back to the work tree version.

`:Gmove` does a `git mv` on a file and simultaneously renames the
buffer.  `:Gremove` does a `git rm` on a file and simultaneously deletes
the buffer.

Use `:Ggrep` to search the work tree (or any arbitrary commit) with
`git grep`, skipping over that which is not tracked in the repository.
`:Glog` loads all previous revisions of a file into the quickfix list so
you can iterate over them and watch the file evolve!

`:Gread` is a variant of `git checkout -- filename` that operates on the
buffer rather than the filename.  This means you can use `u` to undo it
and you never get any warnings about the file changing outside Vim.
`:Gwrite` writes to both the work tree and index versions of a file,
making it like `git add` when called from a work tree file and like
`git checkout` when called from the index or a blob in history.

Use `:Gbrowse` to open the current file on GitHub, with optional line
range (try it in visual mode!).  If your current repository isn't on
GitHub, `git instaweb` will be spun up instead.

Add `%{fugitive#statusline()}` to `'statusline'` to get an indicator
with the current branch in (surprise!) your statusline.

Oh, and of course there's `:Git` for running any arbitrary command.


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

* `<leader>ra` - run all tests in the current buffer
* `<leader>rc` - run all tests in the current context
* `<leader>rf` - run current test
* `<leader>rl` - re-run last test command

## "Project Drawer" aka NERDTree

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
`:help NERDTree`.

**Customizations**:
Use `<leader>g` to toggle NERDTree

## Tabular

Lets you align statements on their equal signs, make comment
boxes, align comments, align declarations, etc.

Tabular's commands are based largely on regular expressions.  The basic
technique used by Tabular is taking some regex to match field delimiters,
splitting the input lines at those delimiters, trimming unnecessary spaces
from the non-delimiter parts, padding the non-delimiter parts of the lines
with spaces to make them the same length, and joining things back together
again.

For instance, consider starting with the following lines:


    Some short phrase,some other phrase
    A much longer phrase here,and another long phrase


Let's say we want to line these lines up at the commas.  We can tell
Tabularize to do this by passing a pattern matching , to the Tabularize
command:

    :Tabularize /,


    Some short phrase         , some other phrase
    A much longer phrase here , and another long phrase


**Customizations**

The following tabular patterns have been added:

* `symbols         / :/l0`
* `hash            /=>/`
* `chunks          / \S\+/l0`
* `assignment      / = /l0`
* `comma           /,\zs /l0`
* `colon           /:\zs /l0`
* `options_hashes  /:\w\+ =>/`


## indent\_object

Indent object creates a "text object" that is relative to the current
indent. Text objects work inside of visual mode, and with `c` (change),
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

## Tagbar

Plugin for browsing the tags of source code files. It provides a
sidebar that displays the ctags-generated tags of the current file, ordered by
their scope. This means that for example methods in C++ are displayed under
the class they are defined in.

**Customizations**: Binds `<leader>rt` to the ctags command to
update tags. Bind `<leader>.` to toggle the taglist window

**Note**: For full language support, run `brew install ctags` to install
exuberant-ctags. Also if using OSX you may need to rename the system installed
ctags version so that vim correctly finds the exuberant ctags version instead,
`sudo mv /usr/bin/ctags /usr/bin/ctags_orig`. In addition, TagBar supports
doctorjs/jsctags if installed for awesome tag support for javascript.


**Tip**: Check out `:help ctags` for information about VIM's built-in
ctag support. Tag navigation creates a stack which can traversed via
`<C-]>` (to find the source of a token) and `<C-T>` (to jump back up
one level).

## Matchit / ruby-matchit

Improves `vim` ability to jump back and forth between matching pairs of
opening and ending items with `%`.


## Gist-vim

Nice [gist integration](https://github.com/mattn/gist-vim) by mattn.
Requires exporting your `GITHUB_TOKEN` and `GITHUB_USER` as environment
variables or setup your [GitHub token config](http://help.github.com/git-email-settings/).

Try `:Gist`, `:Gist -p` and visual blocks.

## ZoomWin

When working with split windows, ZoomWin lets you zoom into a window and
out again using `<C-W> o`

**Customizations**: Binds `<leader>z` to `:ZoomWin`

## Markdown Preview

Markdown preview takes the current buffer, converts the Markdown to
HTML, and opens it in your default browser.

**Customizations**: Binds `<leader>mp` to this plugin.

## Other goodies

* `:OpenHtml` - view the current file (or selected lines) in a browser
  (for copying & pasting with syntax highlighting)
* `:Tidy` - tidy an HTML/XML file inline
* `:AlignColons` - align all colon-separated content (CSS rules) in a file

## Additional Syntaxes / Language Support

Ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)
* Coffee Script
* Erlang
* Jade
* Go
* Elixir
* Rust
* Elm
* TypeScript

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

## Searching with VIM

We have a shortcut to search the entire current working directory for a given query.

`g/` will result in `:Ack! ` and you type in your query
`g*` will result in `:Ack! <word>` depending on the location of your cursor.

For example, if I place my cursor on the word "foo" then type `g*` it will return `:Ack! -w foo`

This search functionality might not work until you install Ack or Ag. You can install these easily with brew.

## Powerline Fonts

If you would like to use powerline fonts for vim and you use iTerm, make sure to set your Non ASCII Font in the iTerm settings.

## Contributing

If you are going to contribute to our config, please make sure you are not overriding any common defaults.
Also remember that we have a custom_config directory if you want to make a change for just yourself.

All PRs **must** be reviewed by at least one other person before being merged.

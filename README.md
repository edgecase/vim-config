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

## Basic key mappings

TODO: forthcoming...

## FuzzyFinder

Provides convenient ways to quickly reach the
buffer/file/command/bookmark/tag you want. FuzzyFinder searches with the
fuzzy/partial pattern to which it converted an entered pattern.

* `<Leader>t` - fuzzy find files
* `<Leader>b` - fuzzy find open buffers

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

* `<Leader>h` - Toggle gundo

## Search Complete

Allows you to use tab-completion of words in the current buffer when searching.

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


## ShowMarks

ShowMarks provides a visual representation of the location marks.
Marks are useful for jumping back and forth between interesting points in a buffer, but can be hard to keep track of without any way to see where you have placed them.  ShowMarks hopefully makes life easier by placing a sign in the leftmost column of the buffer.  The sign indicates the label of the mark and its location.
It can be toggled on and off and individual marks can be hidden(effectively removing them).

By default the following keymappings are defined:

* `<Leader>mt` - Toggles ShowMarks on and off.
* `<Leader>mh` - Hides an individual mark.
* `<Leader>ma` - Hides all marks in the current buffer.
* `<Leader>mm` - Places the next available mark.

ShowMarks requires that Vim is compiled with the +signs feature.

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

`
    Some short phrase,some other phrase
    A much longer phrase here,and another long phrase
`

Let's say we want to line these lines up at the commas.  We can tell
Tabularize to do this by passing a pattern matching , to the Tabularize
command:

`:Tabularize /,`

`
    Some short phrase         , some other phrase
    A much longer phrase here , and another long phrase
`

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
out again using `Ctrl-W o`

**Customizations**: Binds `<Leader>z` to `:ZoomWin`

## Markdown Preview

Markdown preview takes the current buffer, converts the Markdown to
HTML, and opens it in your default browser.

**Customizations**: Binds `<Leader>mp` to this plugin.

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


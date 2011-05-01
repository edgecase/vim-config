" use gui tabs
  set guioptions+=e

" kill the menubar
  set guioptions-=T

" kill the scrollbars
  set guioptions-=r
  set guioptions-=L

" go full screen like you mean it
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen

" use a big, pretty font
  set guifont=Monaco:h15

" initial window size
  set lines=45 columns=120

" pretty but not terminal-compatible color scheme
  set background=dark
  colors twilight2

runtime! custom_config/*.gvim

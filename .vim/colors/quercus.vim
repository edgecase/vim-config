" Based on
runtime colors/sorcerer.vim

let g:colors_name = "quercus"

" 256 colors
" dark grey background, lighter grey line number gutter
" hi Normal  ctermbg=234
" hi LineNr  ctermbg=235

" bernhardt
hi Normal  guibg=#000000 ctermbg=16
hi LineNr  guibg=#000000 guifg=#3d3d3d ctermbg=16
hi NonText guibg=#000000 guifg=#000000 ctermbg=16 ctermfg=0
hi CursorLine ctermbg=234 ctermfg=NONE guibg=#121212 guifg=NONE
" /bernhardt

hi ModeMsg guibg=#afafaf ctermbg=145
hi Visual guibg=#afafaf guifg=#121212 ctermbg=145 ctermfg=233

" bernhardt
hi VertSplit guibg=#1c1c1c guifg=#000000 ctermbg=234 ctermfg=0
hi StatusLine guibg=#1c1c1c guifg=#8a8a8a ctermbg=234 ctermfg=245
hi StatusLineNC guibg=#1c1c1c guifg=#000000 ctermbg=234 ctermfg=0
" /bernhardt

" had all ctermbg set to bg, couldn't figure out how to modify bg var
" ctermfg added when trying to get closer to bernhardt's vim
hi Comment     guibg=NONE guifg=#6c6c6c ctermbg=NONE ctermfg=242
hi Boolean     guibg=NONE ctermbg=NONE
hi String      guibg=NONE guifg=#008700 ctermbg=NONE ctermfg=28
hi Identifier  guibg=NONE ctermbg=NONE ctermfg=110
hi Function    guibg=NONE ctermbg=NONE
hi Type        guibg=NONE ctermbg=NONE
hi Statement   guibg=NONE ctermbg=NONE
hi Keyword     guibg=NONE ctermbg=NONE
hi Constant    guibg=NONE ctermbg=NONE
hi Number      guibg=NONE ctermbg=NONE
hi Special     guibg=NONE guifg=#008700 ctermbg=NONE ctermfg=28
hi PreProc     guibg=NONE ctermbg=NONE

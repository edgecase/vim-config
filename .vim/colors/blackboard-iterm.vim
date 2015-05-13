" blackboard color scheme


" ********************************************************************************
" The following are the preferred 16 colors for your terminal
"           Colors      Bright Colors
" Black     #0C1021     #14192A
" Red       #9D1E15     #AB2A1D
" Green     #61CE3C     #6DEB42
" Yellow    #FBDE2D     #D8FA3C
" Blue      #8DA6CE     #253B76
" Magenta   #FF6400     #FF9332
" Cyan      #B9B4FD     #AEAEAE
" White     #F2F2F2     #FFFFFF
" ********************************************************************************
"
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "blackboard-iterm"

" General colors
hi Normal               ctermfg=7           ctermbg=NONE        cterm=NONE
hi NonText              ctermfg=0           ctermbg=NONE        cterm=NONE

hi Cursor               ctermfg=0           ctermbg=7           cterm=reverse
hi LineNr               ctermfg=12          ctermbg=8           cterm=NONE
hi VertSplit            ctermfg=4           ctermbg=NONE        cterm=NONE
hi StatusLine           ctermfg=4           ctermbg=8           cterm=NONE
hi StatusLineNC         ctermfg=12          ctermbg=8           cterm=NONE

hi Folded               ctermfg=4           ctermbg=NONE        cterm=NONE
hi Title                ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual               ctermfg=NONE        ctermbg=12          cterm=NONE
hi VisualNOS            ctermfg=16          ctermbg=8           cterm=NONE

hi SpecialKey           ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi WildMenu             ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar            ctermfg=black       ctermbg=white       cterm=NONE
"hi Ignore              ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Error                ctermfg=NONE        ctermbg=1           cterm=NONE
hi ErrorMsg             ctermfg=NONE        ctermbg=1           cterm=NONE
hi WarningMsg           ctermfg=NONE        ctermbg=5           cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg              ctermfg=4           ctermbg=NONE        cterm=NONE

if version >= 700 " Vim 7.x specific colors
  hi CursorLine         ctermfg=NONE        ctermbg=8           cterm=NONE
  hi CursorColumn       ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi ColorColumn        ctermfg=NONE        ctermbg=8           cterm=NONE
  hi TabLine            ctermfg=12          ctermbg=NONE        cterm=NONE
  hi TabLineFill        ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi TabLineSel         ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi MatchParen         ctermfg=61          ctermbg=255         cterm=NONE
  hi Pmenu              ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi PmenuSel           ctermfg=black       ctermbg=yellow      cterm=NONE
  hi Search             ctermfg=NONE        ctermbg=NONE        cterm=underline
endif

" Syntax highlighting
hi Comment              ctermfg=14          ctermbg=NONE        cterm=NONE
hi String               ctermfg=2           ctermbg=NONE        cterm=NONE
hi Number               ctermfg=11          ctermbg=NONE        cterm=NONE

hi Keyword              ctermfg=4           ctermbg=NONE        cterm=NONE
hi PreProc              ctermfg=4           ctermbg=NONE        cterm=NONE

hi Todo                 ctermfg=5           ctermbg=NONE        cterm=bold
hi Constant             ctermfg=11          ctermbg=NONE        cterm=NONE

hi Identifier           ctermfg=4           ctermbg=NONE        cterm=NONE
hi Function             ctermfg=3           ctermbg=NONE        cterm=NONE
hi Class                ctermfg=5           ctermbg=NONE        cterm=bold
hi Type                 ctermfg=4           ctermbg=NONE        cterm=NONE

hi Special              ctermfg=5         ctermbg=NONE        cterm=NONE
hi Delimiter            ctermfg=7         ctermbg=NONE        cterm=NONE
"hi Operator                              ctermfg=black       ctermbg=NONE        cterm=NONE

hi Blue    ctermfg=4  cterm=none
hi Green   ctermfg=2  cterm=none
hi Grey    ctermfg=14 cterm=none
hi Orange  ctermfg=5  cterm=none
hi Red     ctermfg=1  cterm=none
hi BRed    ctermfg=9  cterm=none
hi White   ctermfg=7  cterm=none
hi Yellow  ctermfg=11 cterm=none
hi Gold    ctermfg=3  cterm=none
hi Purple  ctermfg=6  cterm=none

hi link Character       Constant
hi link Conditional     Keyword
hi link Statement       Keyword
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
"hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special


" Special for Ruby
"hi link rubyControl                Keyword    " when
"hi link rubyDefine                 Keyword
"hi link rubyAttribute              Keyword
"hi link rubyModule                 Keyword    " module
hi link rubyClass                   Gold       " class
hi link rubyDefine                  Gold       " def
hi link rubyFunction                Orange     " function_name
hi link rubyInstanceVariable        Purple     " @var
hi link rubyConditional             Gold       " if
hi link rubyInclude                 Gold       " include
hi link rubyKeyword                 Gold       " super, return
hi link rubyRailsUserClass          Blue       " SomethingsController
hi link rubyRailsFilterMethod       Blue       " before_filter
hi link rubyRailsRenderMethod       Blue       " respond_to
hi link rubyRailsARClassMethod      Blue       " attr_accessible
hi link rubyRailsARValidationMethod Blue       " attr_accessible
"hi link rubyKeyword           Keyword    " yield, super
"hi link rubyAccess            Keyword    " private
"hi link rubyEval              Special    " eval
"hi link rubyMethod            Keyword    " def
"hi link rubyIdentifier        Identifier " |var|
"hi link rubyInstanceVariable  Identifier " @var
"hi link rubyGlobalVariable    Identifier " $var
"hi link rubyClassVariable     Identifier " @@var
"hi link rubyPseudoVariable    Identifier " self, nil

hi link lessVariable          Keyword

" Special for XML
hi link xmlTagName      Keyword
hi link xmlTag          Identifier
hi link xmlEndTag       Identifier

"" Special for HTML
hi link htmlTagName        Keyword
hi link htmlSpecialTagName Special
hi link htmlTag            Identifier
hi link htmlEndTag         Identifier
hi link htmlArg            Keyword
hi link htmlLink           Normal
hi link javaScript         Normal

"" Special for Javascript
hi link javaScriptNumber         Number
hi link javaScriptPrototype      Identifier " prototype
hi link javaScriptSource         Keyword " import export
hi link javaScriptType           Identifier " const this undefined var void yield 
hi link javaScriptOperator       Keyword " delete new in instanceof let typeof
hi link javaScriptBoolean        Keyword " true false
hi link javaScriptNull           Keyword " null
hi link javaScriptConditional    Keyword " if else
hi link javaScriptRepeat         Keyword " do while for
hi link javaScriptBranch         Keyword " break continue switch case default return
hi link javaScriptStatement      Keyword " try catch throw with finally
hi link javaScriptGlobalObjects  Keyword " Array Boolean Date Function Infinity JavaArray JavaClass JavaObject JavaPackage Math Number NaN Object Packages RegExp String Undefined java netscape sun
hi shCommandSub		ctermfg=white

"" Sepcial for CSS
hi link cssProp            Keyword
hi link cssIdentifier      Special
hi link cssClassName       Special
hi link cssTagName         Special
hi link cssBraces          Normal

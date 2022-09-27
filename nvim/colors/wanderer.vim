" reset all old highlighting
set background=dark
highlight clear
syntax reset

" set color name
let g:colors_name="mycyan"
let colors_name="mycyan"

" check if termguicolors can be enabled and enable if possible
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" set misc colors
let s:comment		= { "gui": "#3d4d4d", "cterm": "66" }
let s:linenr		= { "gui": "#263333", "cterm": "235" }
let s:non_text		= { "gui": "#e6f2f2", "cterm": "255" }

let s:cursor		= { "gui": "#e6f2f2", "cterm": "255" }

let s:selection		= { "gui": "#202626", "cterm": "236" }
let s:vertsplit		= { "gui": "#202626", "cterm": "236" }

let s:status		= { "gui": "#426666", "cterm": "73" }

" set default term colors
let s:black			= { "gui": "#070808", "cterm": "233" }
let s:white			= { "gui": "#c2cccc", "cterm": "252" }
let s:purple		= { "gui": "#8f60bf", "cterm": "140" }
let s:blue			= { "gui": "#608fbf", "cterm": "110" }
let s:cyan			= { "gui": "#60bfbf", "cterm": "116" }
let s:green			= { "gui": "#8fbf60", "cterm": "113" }
let s:yellow		= { "gui": "#bfbf60", "cterm": "179" }
let s:orange		= { "gui": "#bf8f60", "cterm": "173" }
let s:red			= { "gui": "#bf6060", "cterm": "174" }

let s:fg			= { "gui": "#ced9d9", "cterm": "252" }
let s:bg			= { "gui": "#161a1a", "cterm": "235" }

" make highlighting easier (code from: https://github.com/sonph/onehalf)
function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  else
    exec "hi " . a:group . " guifg=NONE cterm=NONE"
  endif
  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  else
    exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE cterm=NONE"
  endif
endfun

" interface colors
call s:h("Normal", s:fg, s:bg, "")
call s:h("EndOfBuffer", s:bg, "", "")

call s:h("Cursor", "", s:cursor, "")
call s:h("CursorColumn", "", s:cursor, "")
call s:h("CursorLine", "", s:selection, "")
call s:h("LineNr", s:linenr, "", "")
call s:h("CursorLineNr", s:white, s:selection, "")

call s:h("ColorColumn", "", s:cursor, "")
call s:h("Directory", s:blue, "", "")
call s:h("VertSplit", s:vertsplit, s:vertsplit, "")
call s:h("Folded", s:white, "", "")
call s:h("FoldColumn", s:cyan, "", "")
call s:h("SignColumn", s:white, "", "")

call s:h("StatusLine", s:fg, s:status, "")
call s:h("StatusLineNC", s:comment, s:fg, "")

call s:h("TabLine", s:comment, s:cursor, "")
call s:h("TabLineFill", s:comment, s:cursor, "")
call s:h("TabLineSel", s:fg, s:bg, "")

call s:h("Pmenu", s:bg, s:fg, "")
call s:h("PmenuSel", s:fg, s:blue, "")
call s:h("PmenuSbar", "", s:selection, "")
call s:h("PmenuThumb", "", s:fg, "")

call s:h("DiffAdd", s:green, "", "")
call s:h("DiffChange", s:yellow, "", "")
call s:h("DiffDelete", s:red, "", "")
call s:h("DiffText", s:blue, "", "")

call s:h("Search", s:bg, s:yellow, "")

call s:h("ErrorMsg", s:red, "", "")
call s:h("ModeMsg", s:status, "", "")
call s:h("MoreMsg", s:status, "", "")
call s:h("WarningMsg", s:red, "", "")
call s:h("Question", s:green, "", "")

call s:h("SpellBad", s:red, "", "")
call s:h("SpellCap", s:blue, "", "")

call s:h("Visual", "", s:selection, "")

call s:h("MatchParen", s:cyan, "", "bold")
call s:h("SpecialKey", s:fg, "", "")
call s:h("Title", s:green, "", "")
call s:h("WildMenu", s:fg, "", "")

" syntax highlighting
call s:h("WhiteSpace", s:non_text, "", "")
call s:h("NonText", s:non_text, "", "")
call s:h("Comment", s:comment, "", "italic")
call s:h("Constant", s:red, "", "")
call s:h("String", s:green, "", "")
call s:h("Character", s:green, "", "")
call s:h("Number", s:red, "", "")
call s:h("Boolean", s:yellow, "", "")
call s:h("Float", s:yellow, "", "")
call s:h("Label", s:purple, "", "")
call s:h("Operator", s:cyan, "", "")
call s:h("Keyword", s:purple, "", "")
call s:h("Exception", s:red, "", "")

call s:h("Identifier", s:purple, "", "")
call s:h("Function", s:yellow, "", "")
call s:h("Statement", s:blue, "", "")
call s:h("Define", s:blue, "", "")

call s:h("Conditional", s:blue, "", "")
call s:h("Repeat", s:blue, "", "")

call s:h("PreProc", s:cyan, "", "")
call s:h("Include", s:cyan, "", "")
call s:h("Macro", s:blue, "", "")
call s:h("PreCondit", s:yellow, "", "")

call s:h("Type", s:orange, "", "")
call s:h("StorageClass", s:yellow, "", "")
call s:h("Structure", s:yellow, "", "")
call s:h("Typedef", s:yellow, "", "")

call s:h("Special", s:cyan, "", "")
call s:h("SpecialChar", s:white, "", "")
call s:h("Tag", s:white, "", "")
call s:h("Delimiter", s:white, "", "")
call s:h("SpecialComment", s:white, "", "")
call s:h("Debug", s:white, "", "")
call s:h("Underlined", s:white, "", "")
call s:h("Ignore", s:white, "", "")
call s:h("Error", s:red, s:black, "")
call s:h("Todo", s:purple, "", "")

" Dashboard
call s:h("DashboardHeader", s:status, "", "")
call s:h("DashboardCenter", s:cyan, "", "")
call s:h("DashboardShortCut", s:yellow, "", "")
call s:h("DashboardFooter", s:comment, "", "")


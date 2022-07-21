" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>
" Copyright (C) 2022 sirfredrick <sirfredrick@vivaldi.net>

" Project: Lifehold Vim
" Based off of nord-vim (https://github.com/arcticicestudio/nord-vim)
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "lifehold"
let s:lifehold_vim_version="1.0.0"
set background=dark

let s:lifehold0_gui = "#162935"
let s:lifehold1_gui = "#0D232E"
let s:lifehold2_gui = "#0D232E"
let s:lifehold3_gui = "#3D6D8F"
let s:lifehold3_gui_bright = "#4E8AB3"
let s:lifehold4_gui = "#B2D5DE"
let s:lifehold5_gui = "#D4E6E9"
let s:lifehold6_gui = "#D9ECF4"
let s:lifehold7_gui = "#27DBBB"
let s:lifehold8_gui = "#128CA1"
let s:lifehold9_gui = "#476BBB"
let s:lifehold10_gui = "#5182AE"
let s:lifehold11_gui = "#C47871"
let s:lifehold12_gui = "#595821"
let s:lifehold13_gui = "#A0A348"
let s:lifehold14_gui = "#1D9574"
let s:lifehold15_gui = "#D16FBE"

let s:lifehold1_term = "0"
let s:lifehold3_term = "8"
let s:lifehold5_term = "7"
let s:lifehold6_term = "15"
let s:lifehold7_term = "14"
let s:lifehold8_term = "6"
let s:lifehold9_term = "4"
let s:lifehold10_term = "12"
let s:lifehold11_term = "1"
let s:lifehold12_term = "3"
let s:lifehold13_term = "3"
let s:lifehold14_term = "2"
let s:lifehold15_term = "5"

let g:lifehold_bold = get(g:, "lifehold_bold", 1)
let s:bold = (g:lifehold_bold == 0) ? "" : "bold,"

let g:lifehold_underline = get(g:, "lifehold_underline", 1)
let s:underline = (g:lifehold_underline == 0) ? "NONE," : "underline,"

let g:lifehold_italic = get(g:, "lifehold_italic", (has("gui_running") || $TERM_ITALICS == "true"))
let s:italic = (g:lifehold_italic == 0) ? "" : "italic,"

let g:lifehold_italic_comments = get(g:, "lifehold_italic_comments", 0)
let s:italicize_comments = (g:lifehold_italic_comments == 0) ? "" : get(s:, "italic")

let g:lifehold_uniform_status_lines = get(g:, "lifehold_uniform_status_lines", 0)

let g:lifehold_bold_vertical_split_line = get(g:, "lifehold_bold_vertical_split_line", 0)
let g:lifehold_cursor_line_number_background = get(g:, "lifehold_cursor_line_number_background", 0)
let g:lifehold_uniform_diff_background = get(g:, "lifehold_uniform_diff_background", 0)

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  let cmd = ""
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    let cmd = cmd . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    let cmd = cmd . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    let cmd = cmd . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:lifehold1_gui, "NONE", s:lifehold1_term, "", "")
call s:hi("Cursor", s:lifehold0_gui, s:lifehold4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:lifehold1_gui, "NONE", s:lifehold1_term, "NONE", "")
call s:hi("Error", s:lifehold4_gui, s:lifehold11_gui, "", s:lifehold11_term, "", "")
call s:hi("iCursor", s:lifehold0_gui, s:lifehold4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:lifehold3_gui, "NONE", s:lifehold3_term, "NONE", "", "")
call s:hi("MatchParen", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, "", "")
call s:hi("NonText", s:lifehold2_gui, "", s:lifehold3_term, "", "", "")
call s:hi("Normal", s:lifehold4_gui, s:lifehold0_gui, "NONE", "NONE", "", "")
call s:hi("Pmenu", s:lifehold4_gui, s:lifehold2_gui, "NONE", s:lifehold1_term, "NONE", "")
call s:hi("PmenuSbar", s:lifehold4_gui, s:lifehold2_gui, "NONE", s:lifehold1_term, "", "")
call s:hi("PmenuSel", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, "", "")
call s:hi("PmenuThumb", s:lifehold8_gui, s:lifehold3_gui, "NONE", s:lifehold3_term, "", "")
call s:hi("SpecialKey", s:lifehold3_gui, "", s:lifehold3_term, "", "", "")
call s:hi("SpellBad", s:lifehold11_gui, s:lifehold0_gui, s:lifehold11_term, "NONE", "undercurl", s:lifehold11_gui)
call s:hi("SpellCap", s:lifehold13_gui, s:lifehold0_gui, s:lifehold13_term, "NONE", "undercurl", s:lifehold13_gui)
call s:hi("SpellLocal", s:lifehold5_gui, s:lifehold0_gui, s:lifehold5_term, "NONE", "undercurl", s:lifehold5_gui)
call s:hi("SpellRare", s:lifehold6_gui, s:lifehold0_gui, s:lifehold6_term, "NONE", "undercurl", s:lifehold6_gui)
call s:hi("Visual", "", s:lifehold2_gui, "", s:lifehold1_term, "", "")
call s:hi("VisualNOS", "", s:lifehold2_gui, "", s:lifehold1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:lifehold1_gui, s:lifehold11_gui, s:lifehold14_gui, s:lifehold13_gui, s:lifehold9_gui, s:lifehold15_gui, s:lifehold8_gui, s:lifehold5_gui, s:lifehold3_gui, s:lifehold11_gui, s:lifehold14_gui, s:lifehold13_gui, s:lifehold9_gui, s:lifehold15_gui, s:lifehold7_gui, s:lifehold6_gui]
endif

if has('nvim')
  "+- Neovim Terminal Colors -+
  let g:terminal_color_0 = s:lifehold1_gui
  let g:terminal_color_1 = s:lifehold11_gui
  let g:terminal_color_2 = s:lifehold14_gui
  let g:terminal_color_3 = s:lifehold13_gui
  let g:terminal_color_4 = s:lifehold9_gui
  let g:terminal_color_5 = s:lifehold15_gui
  let g:terminal_color_6 = s:lifehold8_gui
  let g:terminal_color_7 = s:lifehold5_gui
  let g:terminal_color_8 = s:lifehold3_gui
  let g:terminal_color_9 = s:lifehold11_gui
  let g:terminal_color_10 = s:lifehold14_gui
  let g:terminal_color_11 = s:lifehold13_gui
  let g:terminal_color_12 = s:lifehold9_gui
  let g:terminal_color_13 = s:lifehold15_gui
  let g:terminal_color_14 = s:lifehold7_gui
  let g:terminal_color_15 = s:lifehold6_gui

  "+- Neovim Support -+
  call s:hi("healthError", s:lifehold11_gui, s:lifehold1_gui, s:lifehold11_term, s:lifehold1_term, "", "")
  call s:hi("healthSuccess", s:lifehold14_gui, s:lifehold1_gui, s:lifehold14_term, s:lifehold1_term, "", "")
  call s:hi("healthWarning", s:lifehold13_gui, s:lifehold1_gui, s:lifehold13_term, s:lifehold1_term, "", "")
  call s:hi("TermCursorNC", "", s:lifehold1_gui, "", s:lifehold1_term, "", "")

  "+- Neovim Diagnostics API -+
  call s:hi("DiagnosticWarn", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
  call s:hi("DiagnosticError" , s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
  call s:hi("DiagnosticInfo" , s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
  call s:hi("DiagnosticHint" , s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
  call s:hi("DiagnosticUnderlineWarn" , s:lifehold13_gui, "", s:lifehold13_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineError" , s:lifehold11_gui, "", s:lifehold11_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineInfo" , s:lifehold8_gui, "", s:lifehold8_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineHint" , s:lifehold10_gui, "", s:lifehold10_term, "", "undercurl", "")

  "+- Neovim DocumentHighlight -+
  call s:hi("LspReferenceText", "", s:lifehold3_gui, "", s:lifehold3_term, "", "")
  call s:hi("LspReferenceRead", "", s:lifehold3_gui, "", s:lifehold3_term, "", "")
  call s:hi("LspReferenceWrite", "", s:lifehold3_gui, "", s:lifehold3_term, "", "")

  "+- Neovim LspSignatureHelp -+
  call s:hi("LspSignatureActiveParameter", s:lifehold8_gui, "", s:lifehold8_term, "", s:underline, "")
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:lifehold1_gui, "NONE", s:lifehold1_term, "", "")
if g:lifehold_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:lifehold4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:lifehold4_gui, s:lifehold1_gui, "NONE", s:lifehold1_term, "NONE", "")
endif
call s:hi("Folded", s:lifehold3_gui, s:lifehold1_gui, s:lifehold3_term, s:lifehold1_term, s:bold, "")
call s:hi("FoldColumn", s:lifehold3_gui, s:lifehold0_gui, s:lifehold3_term, "NONE", "", "")
call s:hi("SignColumn", s:lifehold1_gui, s:lifehold0_gui, s:lifehold1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:lifehold8_gui, "", s:lifehold8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:lifehold1_gui, "", s:lifehold1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:lifehold4_gui, s:lifehold11_gui, "NONE", s:lifehold11_term, "", "")
call s:hi("ModeMsg", s:lifehold4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("Question", s:lifehold4_gui, "", "NONE", "", "", "")
if g:lifehold_uniform_status_lines == 0
  call s:hi("StatusLine", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, "NONE", "")
  call s:hi("StatusLineNC", s:lifehold4_gui, s:lifehold1_gui, "NONE", s:lifehold1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:lifehold4_gui, s:lifehold1_gui, "NONE", s:lifehold1_term, "NONE", "")
else
  call s:hi("StatusLine", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, "NONE", "")
  call s:hi("StatusLineNC", s:lifehold4_gui, s:lifehold3_gui, "NONE", s:lifehold3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:lifehold4_gui, s:lifehold3_gui, "NONE", s:lifehold3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:lifehold0_gui, s:lifehold13_gui, s:lifehold1_term, s:lifehold13_term, "", "")
call s:hi("WildMenu", s:lifehold8_gui, s:lifehold1_gui, s:lifehold8_term, s:lifehold1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:lifehold6_gui, s:lifehold10_gui, s:lifehold6_term, s:lifehold10_term, s:underline, "")
call s:hi("Search", s:lifehold1_gui, s:lifehold8_gui, s:lifehold1_term, s:lifehold8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:lifehold4_gui, s:lifehold1_gui, "NONE", s:lifehold1_term, "NONE", "")
call s:hi("TabLineFill", s:lifehold4_gui, s:lifehold1_gui, "NONE", s:lifehold1_term, "NONE", "")
call s:hi("TabLineSel", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:lifehold4_gui, "", "NONE", "", "NONE", "")

if g:lifehold_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:lifehold2_gui, s:lifehold0_gui, s:lifehold3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:lifehold2_gui, s:lifehold1_gui, s:lifehold3_term, s:lifehold1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Character", s:lifehold14_gui, "", s:lifehold14_term, "", "", "")
call s:hi("Comment", s:lifehold3_gui_bright, "", s:lifehold3_term, "", s:italicize_comments, "")
call s:hi("Conceal", "", "NONE", "", "NONE", "", "")
call s:hi("Conditional", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Constant", s:lifehold4_gui, "", "NONE", "", "", "")
call s:hi("Decorator", s:lifehold12_gui, "", s:lifehold12_term, "", "", "")
call s:hi("Define", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Delimiter", s:lifehold6_gui, "", s:lifehold6_term, "", "", "")
call s:hi("Exception", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Float", s:lifehold15_gui, "", s:lifehold15_term, "", "", "")
call s:hi("Function", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("Identifier", s:lifehold4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Keyword", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Label", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Number", s:lifehold15_gui, "", s:lifehold15_term, "", "", "")
call s:hi("Operator", s:lifehold9_gui, "", s:lifehold9_term, "", "NONE", "")
call s:hi("PreProc", s:lifehold9_gui, "", s:lifehold9_term, "", "NONE", "")
call s:hi("Repeat", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Special", s:lifehold4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
call s:hi("SpecialComment", s:lifehold8_gui, "", s:lifehold8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("StorageClass", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("String", s:lifehold14_gui, "", s:lifehold14_term, "", "", "")
call s:hi("Structure", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("Tag", s:lifehold4_gui, "", "", "", "", "")
call s:hi("Todo", s:lifehold13_gui, "NONE", s:lifehold13_term, "NONE", "", "")
call s:hi("Type", s:lifehold9_gui, "", s:lifehold9_term, "", "NONE", "")
call s:hi("Typedef", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
hi! link Annotation Decorator
hi! link Macro Define
hi! link PreCondit PreProc
hi! link Variable Identifier

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
call s:hi("asciidocAttributeList", s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
call s:hi("asciidocHLabel", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("asciidocListingBlock", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("awkPatterns", s:lifehold9_gui, "", s:lifehold9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit
hi! link cConstant Type

call s:hi("cmakeGeneratorExpression", s:lifehold10_gui, "", s:lifehold10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("cssDefinition", s:lifehold7_gui, "", s:lifehold7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:lifehold7_gui, "", s:lifehold7_term, "", s:underline, "")
call s:hi("cssStringQ", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("dtExecKey", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("dtLocaleKey", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("dtNumericKey", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("dtTypeKey", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:lifehold_uniform_diff_background == 0
  call s:hi("DiffAdd", s:lifehold14_gui, s:lifehold0_gui, s:lifehold14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:lifehold13_gui, s:lifehold0_gui, s:lifehold13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:lifehold11_gui, s:lifehold0_gui, s:lifehold11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:lifehold9_gui, s:lifehold0_gui, s:lifehold9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:lifehold14_gui, s:lifehold1_gui, s:lifehold14_term, s:lifehold1_term, "", "")
  call s:hi("DiffChange", s:lifehold13_gui, s:lifehold1_gui, s:lifehold13_term, s:lifehold1_term, "", "")
  call s:hi("DiffDelete", s:lifehold11_gui, s:lifehold1_gui, s:lifehold11_term, s:lifehold1_term, "", "")
  call s:hi("DiffText", s:lifehold9_gui, s:lifehold1_gui, s:lifehold9_term, s:lifehold1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")

call s:hi("goBuiltins", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:lifehold3_gui, "", s:lifehold3_term, "", "", "")
call s:hi("helpHyperTextJump", s:lifehold8_gui, "", s:lifehold8_term, "", s:underline, "")

call s:hi("htmlArg", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("htmlLink", s:lifehold4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")

call s:hi("lessClass", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("markdownCode", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("markdownFootnote", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("markdownId", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("markdownH1", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("markdownLinkText", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("markdownUrl", s:lifehold4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")

call s:hi("phpClasses", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("phpDocTags", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("podVerbatimLine", s:lifehold4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("rubySymbol", s:lifehold6_gui, "", s:lifehold6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
call s:hi("rustEnum", s:lifehold7_gui, "", s:lifehold7_term, "", s:bold, "")
call s:hi("rustMacro", s:lifehold8_gui, "", s:lifehold8_term, "", s:bold, "")
call s:hi("rustModPath", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("rustPanic", s:lifehold9_gui, "", s:lifehold9_term, "", s:bold, "")
call s:hi("rustTrait", s:lifehold7_gui, "", s:lifehold7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("sassId", s:lifehold7_gui, "", s:lifehold7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("vimMapRhs", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("vimNotation", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("xmlCdataStart", s:lifehold3_gui_bright, "", s:lifehold3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
call s:hi("ALEErrorSign" , s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
call s:hi("ALEWarning" , s:lifehold13_gui, "", s:lifehold13_term, "", "undercurl", "")
call s:hi("ALEError" , s:lifehold11_gui, "", s:lifehold11_term, "", "undercurl", "")

" Coc
" > neoclide/coc.vim
call s:hi("CocWarningHighlight" , s:lifehold13_gui, "", s:lifehold13_term, "", "undercurl", "")
call s:hi("CocErrorHighlight" , s:lifehold11_gui, "", s:lifehold11_term, "", "undercurl", "")
call s:hi("CocWarningSign", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
call s:hi("CocErrorSign" , s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
call s:hi("CocInfoSign" , s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("CocHintSign" , s:lifehold10_gui, "", s:lifehold10_term, "", "", "")

if has('nvim')
  " Neovim LSP
  " > neovim/nvim-lspconfig
  call s:hi("LspCodeLens", s:lifehold3_gui_bright, "", s:lifehold3_term, "", "", "")
  if has("nvim-0.5")
    call s:hi("LspDiagnosticsDefaultWarning", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultError" , s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultInformation" , s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultHint" , s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
    call s:hi("LspDiagnosticsUnderlineWarning" , s:lifehold13_gui, "", s:lifehold13_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineError" , s:lifehold11_gui, "", s:lifehold11_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineInformation" , s:lifehold8_gui, "", s:lifehold8_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineHint" , s:lifehold10_gui, "", s:lifehold10_term, "", "undercurl", "")
  endif
  
  " Gitsigns
  " > lewis6991/gitsigns.nvim
  hi! link GitSignsCurrentLineBlame Comment
endif

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:lifehold14_gui, "", s:lifehold14_term, "", "", "")
call s:hi("GitGutterChange", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
call s:hi("GitGutterDelete", s:lifehold11_gui, "", s:lifehold11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:lifehold14_gui, "", s:lifehold14_term, "", "", "")
call s:hi("SignifySignChange", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
call s:hi("SignifySignDelete", s:lifehold11_gui, "", s:lifehold11_term, "", "", "")

" Sneak
" > justinmk/vim-sneak
hi! link Sneak Search

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:lifehold11_gui, "", s:lifehold11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:lifehold14_gui, "", s:lifehold14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:lifehold4_gui, s:lifehold3_gui, "", s:lifehold3_term, "", "")
call s:hi("jediFat", s:lifehold8_gui, s:lifehold3_gui, s:lifehold8_term, s:lifehold3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:lifehold4_gui, "", "", "", "", "")
call s:hi("ClapDisplay", s:lifehold4_gui, s:lifehold1_gui, "", s:lifehold1_term, "", "")
call s:hi("ClapFile", s:lifehold4_gui, "", "", "NONE", "", "")
call s:hi("ClapMatches", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("ClapNoMatchesFound", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
call s:hi("ClapSelected", s:lifehold7_gui, "", s:lifehold7_term, "", s:bold, "")
call s:hi("ClapSelectedSign", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
let s:clap_matches = [
        \ [s:lifehold8_gui,  s:lifehold8_term] ,
        \ [s:lifehold9_gui,  s:lifehold9_term] ,
        \ [s:lifehold10_gui, s:lifehold10_term] ,
        \ ]
for s:lifehold_clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:lifehold_clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:lifehold_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
  call s:hi("ClapFuzzyMatches" . s:lifehold_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
endfor
unlet s:lifehold_clap_match_i
hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon Type
hi! link ClapProviderId Type

" vim-indent-guides
" > nathanaelkane/vim-indent-guides
call s:hi("IndentGuidesEven", "", s:lifehold1_gui, "", s:lifehold1_term, "", "")
call s:hi("IndentGuidesOdd", "", s:lifehold2_gui, "", s:lifehold3_term, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:lifehold11_gui, "", "", s:lifehold11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:lifehold6_gui, "", s:lifehold6_term, "", "", "")
call s:hi("StartifyFooter", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("StartifyHeader", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("StartifyNumber", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("StartifyPath", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
call s:hi("haskellType", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:lifehold8_gui, "", s:lifehold8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Pandoc
" > vim-pandoc/vim-pandoc-syntax
call s:hi("pandocDefinitionBlockTerm", s:lifehold7_gui, "", s:lifehold7_term, "", s:italic, "")
call s:hi("pandocTableDelims", s:lifehold3_gui, "", s:lifehold3_term, "", "", "")
hi! link pandocAtxHeader markdownH1
hi! link pandocBlockQuote markdownBlockquote
hi! link pandocCiteAnchor Operator
hi! link pandocCiteKey pandocReferenceLabel
hi! link pandocDefinitionBlockMark Operator
hi! link pandocEmphasis markdownItalic
hi! link pandocFootnoteID pandocReferenceLabel
hi! link pandocFootnoteIDHead markdownLinkDelimiter
hi! link pandocFootnoteIDTail pandocFootnoteIDHead
hi! link pandocGridTableDelims pandocTableDelims
hi! link pandocGridTableHeader pandocTableDelims
hi! link pandocOperator Operator
hi! link pandocPipeTableDelims pandocTableDelims
hi! link pandocReferenceDefinition pandocReferenceLabel
hi! link pandocReferenceLabel markdownLinkText
hi! link pandocReferenceURL markdownUrl
hi! link pandocSimpleTableHeader pandocAtxHeader
hi! link pandocStrong markdownBold
hi! link pandocTableHeaderWord pandocAtxHeader
hi! link pandocUListItemBullet Operator
  
if has('nvim')
  " tree-sitter
  " > nvim-treesitter/nvim-treesitter
  hi! link TSAnnotation Annotation
  hi! link TSConstBuiltin Constant
  hi! link TSConstructor Function
  hi! link TSEmphasis Italic
  hi! link TSFuncBuiltin Function
  hi! link TSFuncMacro Function
  hi! link TSStringRegex SpecialChar
  hi! link TSStrong Bold
  hi! link TSStructure Structure
  hi! link TSTagDelimiter TSTag
  hi! link TSUnderline Underline
  hi! link TSVariable Variable
  hi! link TSVariableBuiltin Keyword
endif

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:lifehold8_gui, "", s:lifehold8_term, "", s:italic, "")
call s:hi("typescriptClassName", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("typescriptDecorator", s:lifehold12_gui, "", s:lifehold12_term, "", "", "")
call s:hi("typescriptInterfaceName", s:lifehold7_gui, "", s:lifehold7_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:lifehold13_gui, "", s:lifehold13_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
hi! link typescriptOperator Operator
hi! link typescriptBinaryOp Operator
hi! link typescriptAssign Operator
hi! link typescriptMember Identifier
hi! link typescriptDOMStorageMethod Identifier
hi! link typescriptArrowFuncArg Identifier
hi! link typescriptGlobal typescriptClassName
hi! link typescriptBOMWindowProp Function
hi! link typescriptArrowFuncDef Function
hi! link typescriptAliasDeclaration Function
hi! link typescriptPredefinedType Type
hi! link typescriptTypeReference typescriptClassName
hi! link typescriptTypeAnnotation Structure
hi! link typescriptDocNamedParamType SpecialComment
hi! link typescriptDocNotation Keyword
hi! link typescriptDocTags Keyword
hi! link typescriptImport Keyword
hi! link typescriptExport Keyword
hi! link typescriptTry Keyword
hi! link typescriptVariable Keyword
hi! link typescriptBraces Normal
hi! link typescriptObjectLabel Normal
hi! link typescriptCall Normal
hi! link typescriptClassHeritage typescriptClassName
hi! link typescriptFuncTypeArrow Structure
hi! link typescriptMemberOptionality Structure
hi! link typescriptNodeGlobal typescriptGlobal
hi! link typescriptTypeBrackets Structure
hi! link tsxEqual Operator
hi! link tsxIntrinsicTagName htmlTag
hi! link tsxTagName tsxIntrinsicTagName

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("mkdFootnote", s:lifehold8_gui, "", s:lifehold8_term, "", "", "")
call s:hi("mkdRule", s:lifehold10_gui, "", s:lifehold10_term, "", "", "")
call s:hi("mkdLineBreak", s:lifehold9_gui, "", s:lifehold9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" PHP
" > StanAngeloff/php.vim
call s:hi("phpClass", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")
call s:hi("phpClassImplements", s:lifehold7_gui, "", s:lifehold7_term, "", s:bold, "")
hi! link phpClassExtends phpClass
hi! link phpFunction Function
hi! link phpMethod Function
hi! link phpUseClass phpClass

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:lifehold8_gui, "", s:lifehold8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:lifehold7_gui, s:lifehold8_gui, s:lifehold9_gui, s:lifehold10_gui, s:lifehold14_gui, s:lifehold15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:lifehold7_term, s:lifehold8_term, s:lifehold9_term, s:lifehold10_term, s:lifehold14_term, s:lifehold15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif
call s:hi("VimwikiLink", s:lifehold8_gui, "", s:lifehold8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:lifehold7_gui, "", s:lifehold7_term, "", "", "")

" Higlight trailing whitespace
call s:hi("ExtraWhitespace", s:lifehold4_gui, s:lifehold11_gui, s:lifehold11_term, "", "", "")
hi! link ExtraWhiteSpace Error
match ExtraWhiteSpace /\s\+$/

"+------------+
"+ Public API +
"+------------+
"+--- Functions ---+

function! LifeholdPalette() abort
  let ret = {}
  for color in range(16)
    execute 'let ret["lifehold'.color.'"] = s:lifehold'.color.'_gui'
  endfor
  let ret["lifehold3_bright"] = s:lifehold3_gui_bright
  return ret
endfunction

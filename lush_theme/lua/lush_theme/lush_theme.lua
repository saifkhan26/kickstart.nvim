local lush = require 'lush'
local hsl = lush.hsl

local accent_color = hsl(200, 60, 30)
local primary_color = hsl(0, 0, 90)
local text_color = accent_color.li(60).de(90)
local highlight_color = accent_color.da(80)
local error_color = hsl(0, 100, 25)
local success_color = hsl(110, 100, 25)
local warning_color = hsl(60, 100, 25)
local black_color = hsl(0, 0, 0)

---@diagnostic disable
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Text { fg = text_color },
    TextDark { fg = text_color.da(50) },
    Accent { fg = accent_color },
    AccentDark { fg = accent_color.da(50) },
    Error { fg = error_color },
    Success { fg = success_color },
    Warn { fg = warning_color },
    Highlight { bg = highlight_color, fg = text_color },
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    CurSearch { Highlight }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { Highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { Highlight }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { Text }, -- Directory names (and other special names in listings)
    DiffAdd { Success }, -- Diff mode: Added line |diff.txt|
    DiffChange { Warn }, -- Diff mode: Changed line |diff.txt|
    DiffDelete { Error }, -- Diff mode: Deleted line |diff.txt|
    DiffText { Text }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { Accent }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg { Error }, -- Error messages on the command line
    VertSplit { Accent }, -- Column separating vertically split windows
    Folded { Text }, -- Line used for closed folds
    FoldColumn { Text }, -- 'foldcolumn'
    SignColumn { bg = '' }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute { Highlight }, -- |:substitute| replacement text highlighting
    LineNr { fg = primary_color }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove { TextDark }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow { TextDark }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen { gui = 'underline' }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- Normal         { }, -- Normal text
    NormalFloat { bg = '' }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu { bg = '' }, -- Popup menu: Normal item.
    PmenuSel { bg = AccentDark.fg }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg = Text.fg, bg = AccentDark.fg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { fg = TextDark.fg, bg = Highlight.bg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { Highlight, fg = TextDark.fg }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { Error }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { TextDark }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment { TextDark }, -- Any comment

    Constant { fg = Text.fg.da(20) }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier { fg = primary_color }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    Statement { Text }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc { Text }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type { fg = primary_color }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special { TextDark }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { Error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { Warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { TextDark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { TextDark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk { Success }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
    -- sym '@tag.builtin' {  }, -- builtin tag names (e.g. HTML5 tags)
    -- sym '@tag.attribute' {  }, -- XML tag attributes
    -- sym '@tag.delimiter' {  }, -- XML tag delimiters

    -- Language specific
    -- Lua
    -- sym '@variable.member.lua' {  },

    --
    -- LSP semantic tokens
    --
    -- The help page :h lsp-semantic-highlight
    -- A short guide: https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
    -- Token types and modifiers are described here: https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
    -- sym '@lsp.type.namespace' {  },
    -- sym '@lsp.type.type' {  },
    -- sym '@lsp.type.class' {  },
    -- sym '@lsp.type.enum' {  },
    -- sym '@lsp.type.interface' {  },
    -- sym '@lsp.type.struct' {  },
    -- sym '@lsp.type.typeParameter' {  },
    -- sym '@lsp.type.parameter' {  },
    -- sym '@lsp.type.variable' {  },
    -- sym '@lsp.type.property' {  },
    -- sym '@lsp.type.enumMember' {  },
    -- sym '@lsp.type.event' {  },
    -- sym '@lsp.type.function' {  },
    -- sym '@lsp.type.method' {  },
    -- sym '@lsp.type.macro' {  },
    -- sym '@lsp.type.keyword' {  },
    -- sym '@lsp.type.comment' {  },
    -- sym '@lsp.type.string' {  },
    -- sym '@lsp.type.number' {  },
    -- sym '@lsp.type.regexp' {  },
    -- sym '@lsp.type.operator' {  },
    -- sym '@lsp.type.decorator' {  },
    -- sym '@lsp.type.escapeSequence' {  },
    -- sym '@lsp.type.formatSpecifier' {  },
    -- sym '@lsp.type.builtinType' {  },
    -- sym '@lsp.type.typeAlias' {  },
    -- sym '@lsp.type.unresolvedReference' {  },
    -- sym '@lsp.type.lifetime' {  },
    -- sym '@lsp.type.generic' {  },
    -- sym '@lsp.type.selfKeyword' {  },
    -- sym '@lsp.type.selfTypeKeyword' {  },
    -- sym '@lsp.type.deriveHelper' {  },
    -- sym '@lsp.type.modifier' {  },
    -- sym '@lsp.typemod.type.defaultLibrary' {  },
    -- sym '@lsp.typemod.typeAlias.defaultLibrary' {  },
    -- sym '@lsp.typemod.class.defaultLibrary' {  },
    -- sym '@lsp.typemod.variable.defaultLibrary' {  },
    -- sym '@lsp.typemod.function.defaultLibrary' {  },
    -- sym '@lsp.typemod.method.defaultLibrary' {  },
    -- sym '@lsp.typemod.macro.defaultLibrary' {  },
    -- sym '@lsp.typemod.struct.defaultLibrary' {  },
    -- sym '@lsp.typemod.enum.defaultLibrary' {  },
    -- sym '@lsp.typemod.enumMember.defaultLibrary' {  },
    -- sym '@lsp.typemod.variable.readonly' {  },
    -- sym '@lsp.typemod.variable.callable' {  },
    -- sym '@lsp.typemod.variable.static' {  },
    -- sym '@lsp.typemod.property.readonly' {  },
    -- sym '@lsp.typemod.keyword.async' {  },
    -- sym '@lsp.typemod.keyword.injected' {  },
    -- Set injected highlights. Mainly for Rust doc comments and also works for
    -- other lsps that inject tokens in comments.
    -- Ref: https://github.com/folke/tokyonight.nvim/pull/340
    -- sym '@lsp.typemod.operator.injected' {  },
    -- sym '@lsp.typemod.string.injected' {  },
    -- sym '@lsp.typemod.variable.injected' {  },

    -- Language specific
    -- Lua
    -- sym '@lsp.type.property.lua' {  },

    --
    -- nvim-lspconfig
    --
    -- LspInfoTitle { },
    -- LspInfoList { },
    -- LspInfoFiletype { },
    -- LspInfoTip { },
    -- LspInfoBorder { },

    --
    -- nvim-cmp
    --
    -- CmpItemAbbrDeprecated {  },
    -- CmpItemAbbrMatch {  },
    -- CmpItemAbbrMatchFuzzy {  },
    -- CmpItemMenu {  },
    -- CmpItemKindText {  },
    -- CmpItemKindMethod {  },
    -- CmpItemKindFunction {  },
    -- CmpItemKindConstructor {  },
    -- CmpItemKindField {  },
    -- CmpItemKindVariable {  },
    -- CmpItemKindClass {  },
    -- CmpItemKindInterface {  },
    -- CmpItemKindModule {  },
    -- CmpItemKindProperty {  },
    -- CmpItemKindUnit {  },
    -- CmpItemKindValue {  },
    -- CmpItemKindEnum {  },
    -- CmpItemKindKeyword {  },
    -- CmpItemKindSnippet {  },
    -- CmpItemKindColor {  },
    -- CmpItemKindFile {  },
    -- CmpItemKindReference {  },
    -- CmpItemKindFolder {  },
    -- CmpItemKindEnumMember {  },
    -- CmpItemKindConstant {  },
    -- CmpItemKindStruct {  },
    -- CmpItemKindEvent {  },
    -- CmpItemKindOperator {  },
    -- CmpItemKindTypeParameter {  },
    -- Predefined for the winhighlight config of cmp float window
    -- SuggestWidgetBorder {  },
    -- SuggestWidgetSelect {  },

    --
    -- Aerial
    --
    -- AerialTextIcon {  },
    -- AerialMethodIcon {  },
    -- AerialFunctionIcon {  },
    -- AerialConstructorIcon {  },
    -- AerialFieldIcon {  },
    -- AerialVariableIcon {  },
    -- AerialClassIcon {  },
    -- AerialInterfaceIcon {  },
    -- AerialModuleIcon {  },
    -- AerialPropertyIcon {  },
    -- AerialUnitIcon {  },
    -- AerialValueIcon {  },
    -- AerialEnumIcon {  },
    -- AerialKeywordIcon {  },
    -- AerialSnippetIcon {  },
    -- AerialColorIcon {  },
    -- AerialFileIcon {  },
    -- AerialReferenceIcon {  },
    -- AerialFolderIcon {  },
    -- AerialEnumMemberIcon {  },
    -- AerialConstantIcon {  },
    -- AerialStructIcon {  },
    -- AerialEventIcon {  },
    -- AerialOperatorIcon {  },
    -- AerialTypeParameterIcon {  },

    --
    -- nvim-navic
    --
    -- NavicText {  },
    -- NavicIconsFile {  },
    -- NavicIconsModule {  },
    -- NavicIconsNamespace {  },
    -- NavicIconsPackage {  },
    -- NavicIconsClass {  },
    -- NavicIconsMethod {  },
    -- NavicIconsProperty {  },
    -- NavicIconsField {  },
    -- NavicIconsConstructor {  },
    -- NavicIconsEnum {  },
    -- NavicIconsInterface {  },
    -- NavicIconsFunction {  },
    -- NavicIconsVariable {  },
    -- NavicIconsConstant {  },
    -- NavicIconsString {  },
    -- NavicIconsNumber {  },
    -- NavicIconsBoolean {  },
    -- NavicIconsArray {  },
    -- NavicIconsObject {  },
    -- NavicIconsKey {  },
    -- NavicIconsNull {  },
    -- NavicIconsEnumMember {  },
    -- NavicIconsStruct {  },
    -- NavicIconsEvent {  },
    -- NavicIconsOperator {  },
    -- NavicIconsTypeParameter {  },
    -- NavicSeparator {  },

    --
    -- Gitsigns
    --
    -- GitSignsAdd {  },
    -- GitSignsChange {  },
    -- GitSignsDelete {  },
    -- GitSignsAddNr {  },
    -- GitSignsChangeNr {  },
    -- GitSignsDeleteNr {  },
    -- GitSignsAddLn {  },
    -- GitSignsChangeLn {  },
    -- GitSignsDeleteLn {  },
    -- GitSignsAddInline {  },
    -- GitSignsChangeInline {  },
    -- GitSignsDeleteInline {  },

    --
    -- vim-illuminate
    --
    -- IlluminatedWordText {  },
    -- IlluminatedWordRead {  },
    -- IlluminatedWordWrite {  },

    --
    -- Telescope
    --
    -- TelescopeBorder {  },
    -- TelescopePromptBorder {  },
    -- TelescopeResultsBorder {  },
    -- TelescopePreviewBorder {  },
    TelescopeSelection { Highlight },
    -- TelescopeSelectionCaret {  },
    -- TelescopeMultiIcon {  },
    -- TelescopeMatching {  },
    -- TelescopeNormal {  },
    -- TelescopePromptPrefix {  },

    --
    -- Harpoon
    --
    HarpoonBorder { Text },
    HarpoonWindow { Text },

    --
    -- fFHighlight
    --
    -- fFHintWords {  },
    -- fFHintCurrentWord {  },

    --
    -- indent-blankline
    --
    -- IblIndent {  },
    -- IblScope {  },

    --
    -- hlslens
    --
    -- HlSearchNear {  },
    -- HlSearchLens {  },
    -- HlSearchLensNear {  },

    --
    -- nvim-ufo
    --
    -- UfoPreviewBorder {  },
    -- UfoPreviewNormal {  },
    -- UfoPreviewCursorLine {  },
    -- UfoFoldedFg {  },
    -- UfoFoldedBg {  },
    -- UfoCursorFoldedLine {  },
    -- UfoPreviewSbar {  },
    -- UfoPreviewThumb {  },
    -- UfoFoldedEllipsis {  },

    --
    -- nvim-bqf
    --
    -- BqfPreviewFloat {  },
    -- BqfPreviewBorder {  },
    -- BqfPreviewTitle {  },
    -- BqfPreviewSbar {  },
    -- BqfPreviewThumb {  },
    -- BqfPreviewCursor {  },
    -- BqfPreviewCursorLine {  },
    -- BqfPreviewRange {  },
    -- BqfPreviewBufLabel {  },
    -- BqfSign {  },

    --
    -- mg979/tabline.nvim
    --
    -- TSelect {  },
    -- TVisible {  },
    -- THidden {  },
    -- TExtra {  },
    -- TSpecial {  },
    -- TFill {  },
    -- TCorner {  },
    -- TNumSel {  },
    -- TNum {  },
    -- TSelectMod {  },
    -- TVisibleMod {  },
    -- THiddenMod {  },
    -- TExtraMod {  },
    -- TSpecialMod {  },
    -- TSelectDim {  },
    -- TVisibleDim {  },
    -- THiddenDim {  },
    -- TExtraDim {  },
    -- TSpecialDim {  },
    -- TSelectSep {  },
    -- TVisibleSep {  },
    -- THiddenSep {  },
    -- TExtraSep {  },
    -- TSpecialSep {  },

    --
    -- git-messenger.vim
    --
    -- gitmessengerHeader {  }, -- textLink.activeForeground
    -- gitmessengerPopupNormal {  },
    -- gitmessengerHash {  },
    -- gitmessengerHistory {  },
    -- gitmessengerEmail {  },

    --
    -- nvim-treesitter-context
    --
    -- TreesitterContext { bg = "" },
    -- TreesitterContextLineNumber {  }, -- 30% darker based on LineNr
    -- TreesitterContextBottom {  },

    --
    -- nvim-scrollview
    --
    -- ScrollView {  },
    -- ScrollViewRestricted {  },
    -- ScrollViewConflictsTop {  },
    -- ScrollViewConflictsMiddle {  },
    -- ScrollViewConflictsBottom {  },
    -- ScrollViewCursor {  },
    -- ScrollViewDiagnosticsError {  },
    -- ScrollViewDiagnosticsWarn {  },
    -- ScrollViewDiagnosticsHint {  },
    -- ScrollViewDiagnosticsInfo {  },
    -- ScrollViewSearch {  },

    --
    -- vim-floaterm
    --
    -- Floaterm {  },
    -- FloatermBorder {  },

    --
    -- quick-scope
    --
    -- QuickScopePrimary {  },
    -- QuickScopeSecondary {  },
  }
end)
---@diagnostic enable

return theme

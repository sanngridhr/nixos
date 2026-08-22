# Flexoki VS Code theme template.
# Takes a palette attrset `p` (see palette.nix) and produces the full
# theme-file attrset (matching the "colors"/"tokenColors" schema VS Code
# expects). Rendered to JSON separately for both light and dark palettes
# by default.nix, so this file is the single source of truth for *which*
# semantic color each UI element uses -- edit here, not in the JSON.
themeType: p:
{
  name = "Flexoki";
  type = themeType; # "light" or "dark"

  colors = {
    "editor.background" = p.bg;
    "editor.foreground" = p.tx;
    "editor.hoverHighlightBackground" = p.ui_2;
    "editor.lineHighlightBackground" = p.bg_2;
    "editor.selectionBackground" = p.tx + p.selectionAlpha;
    "editor.selectionHighlightBackground" = p.tx + p.selectionAlpha;
    "editor.wordHighlightBackground" = p.ui_3 + p.wordHighlightAlpha;
    "editor.wordHighlightBorder" = p.tx_2;
    "editor.wordHighlightStrongBackground" = p.ui_3 + p.wordHighlightStrongAlpha;
    "editor.wordHighlightStrongBorder" = p.tx_2;
    "editor.wordHighlightTextBackground" = p.ui_3 + p.wordHighlightAlpha;
    "editor.wordHighlightTextBorder" = p.tx_2;
    "editor.findMatchBackground" = p.ye_2;
    "editor.findMatchHighlightBackground" = p.ye_2 + "cc";
    "editor.findRangeHighlightBackground" = p.bg_2;
    "editor.inactiveSelectionBackground" = p.ui;
    "editor.lineHighlightBorder" = p.ui;
    "editor.rangeHighlightBackground" = p.ui_3;
    "notifications.background" = p.ui;
    "notifications.foreground" = p.tx;
    "notifications.border" = p.ui_3;
    "notificationCenterHeader.background" = p.ui_2;
    "notificationCenterHeader.foreground" = p.tx;
    "notificationToast.border" = p.ui_3;
    "notificationLink.foreground" = p.bl;
    "notificationsErrorIcon.foreground" = p.re;
    "notificationsWarningIcon.foreground" = p.or;
    "notificationsInfoIcon.foreground" = p.bl;
    "editorInlayHint.typeBackground" = p.ui_2;
    "editorInlayHint.typeForeground" = p.tx;
    "editorWhitespace.foreground" = p.ui_3;
    "editorWatermark.foreground" = p.tx_3;
    "icon.foreground" = p.tx_2;
    "breadcrumb.background" = p.bg;
    "breadcrumb.foreground" = p.tx_2;
    "breadcrumb.focusForeground" = p.tx;
    "breadcrumb.activeSelectionForeground" = p.tx;
    "breadcrumbPicker.background" = p.bg;
    "editorIndentGuide.background1" = p.ui_2;
    "editorHoverWidget.background" = p.ui;
    "editorHoverWidget.foreground" = p.tx;
    "editorHoverWidget.border" = p.ui_3;
    "editorHoverWidget.statusBarBackground" = p.ui_2;
    "editorLineNumber.activeForeground" = p.tx;
    "editorLineNumber.foreground" = p.ui_3;
    "editorGutter.background" = p.bg;
    "editorGutter.modifiedBackground" = p.cy;
    "editorGutter.addedBackground" = p.gr;
    "editorGutter.deletedBackground" = p.re;
    "gitDecoration.addedResourceForeground" = p.gr;
    "gitDecoration.modifiedResourceForeground" = p.ye;
    "gitDecoration.deletedResourceForeground" = p.re;
    "gitDecoration.untrackedResourceForeground" = p.gr;
    "gitDecoration.ignoredResourceForeground" = p.tx_3;
    "gitDecoration.conflictingResourceForeground" = p.or;
    "gitDecoration.stageModifiedResourceForeground" = p.ye;
    "gitDecoration.stageDeletedResourceForeground" = p.re;
    "gitDecoration.submoduleResourceForeground" = p.tx_2;
    "editorBracketMatch.background" = p.ui;
    "editorBracketMatch.border" = p.ui_2;
    "editorError.foreground" = p.re;
    "editorWarning.foreground" = p.or;
    "editorInfo.foreground" = p.bl;
    "diffEditor.insertedTextBackground" = p.gr_2 + "99";
    "diffEditor.removedTextBackground" = p.re_2 + "99";
    "editorGroupHeader.tabsBackground" = p.bg;
    "editorGroup.border" = p.ui_2;
    "tab.activeBackground" = p.bg;
    "tab.inactiveBackground" = p.bg_2;
    "tab.inactiveForeground" = p.tx_2;
    "tab.activeForeground" = p.tx;
    "tab.hoverBackground" = p.ui_2;
    "tab.unfocusedHoverBackground" = p.ui_2;
    "tab.border" = p.ui_2;
    "tab.activeModifiedBorder" = p.ye;
    "tab.inactiveModifiedBorder" = p.bl;
    "tab.unfocusedActiveModifiedBorder" = p.ye_2;
    "tab.unfocusedInactiveModifiedBorder" = p.bl_2;
    "editorWidget.background" = p.bg_2;
    "editorWidget.border" = p.ui_2;
    "editorSuggestWidget.background" = p.bg;
    "editorSuggestWidget.border" = p.ui_2;
    "editorSuggestWidget.foreground" = p.tx;
    "editorSuggestWidget.highlightForeground" = p.tx_2;
    "editorSuggestWidget.selectedBackground" = p.ui_2;
    "peekView.border" = p.ui_2;
    "peekViewEditor.background" = p.bg;
    "peekViewEditor.matchHighlightBackground" = p.ui_3;
    "peekViewResult.background" = p.bg_2;
    "peekViewResult.fileForeground" = p.tx;
    "peekViewResult.lineForeground" = p.tx_2;
    "peekViewResult.matchHighlightBackground" = p.ui_3;
    "peekViewResult.selectionBackground" = p.ui;
    "peekViewResult.selectionForeground" = p.tx_3;
    "peekViewTitle.background" = p.ui_2;
    "peekViewTitleDescription.foreground" = p.tx_2;
    "peekViewTitleLabel.foreground" = p.tx;
    "merge.currentHeaderBackground" = p.gr;
    "merge.currentContentBackground" = p.gr_2;
    "merge.incomingHeaderBackground" = p.cy;
    "merge.incomingContentBackground" = p.cy_2;
    "merge.border" = p.ui_2;
    "merge.commonContentBackground" = p.ui_3;
    "merge.commonHeaderBackground" = p.ui_2;
    "panel.background" = p.bg;
    "panel.border" = p.ui_2;
    "panelTitle.activeBorder" = p.ui_3;
    "panelTitle.activeForeground" = p.tx;
    "panelTitle.inactiveForeground" = p.tx_2;
    "statusBar.background" = p.bg;
    "statusBar.foreground" = p.tx;
    "statusBar.border" = p.ui_2;
    "statusBar.debuggingBackground" = p.re;
    "statusBar.debuggingForeground" = p.tx;
    "statusBar.noFolderBackground" = p.ui_3;
    "statusBar.noFolderForeground" = p.tx_3;
    "titleBar.activeBackground" = p.bg;
    "titleBar.activeForeground" = p.tx;
    "titleBar.inactiveBackground" = p.bg_2;
    "titleBar.inactiveForeground" = p.tx_2;
    "titleBar.border" = p.ui_2;
    "menu.foreground" = p.tx;
    "menu.background" = p.bg;
    "menu.selectionForeground" = p.tx;
    "menu.selectionBackground" = p.ui_2;
    "menu.border" = p.ui_2;
    "editorInlayHint.foreground" = p.tx_2;
    "editorInlayHint.background" = p.ui_2;
    "terminal.foreground" = p.tx;
    "terminal.background" = p.bg;
    "terminalCursor.foreground" = p.tx;
    "terminalCursor.background" = p.bg;
    "terminal.ansiRed" = p.re;
    "terminal.ansiGreen" = p.gr;
    "terminal.ansiYellow" = p.ye;
    "terminal.ansiBlue" = p.bl;
    "terminal.ansiMagenta" = p.cy;
    "terminal.ansiCyan" = p.cy;
    "activityBar.background" = p.bg;
    "activityBar.foreground" = p.tx;
    "activityBar.inactiveForeground" = p.tx_2;
    "activityBar.activeBorder" = p.tx;
    "activityBar.border" = p.ui_2;
    "sideBar.background" = p.bg;
    "sideBar.foreground" = p.tx;
    "sideBar.border" = p.ui_2;
    "sideBarTitle.foreground" = p.tx;
    "sideBarSectionHeader.background" = p.bg_2;
    "sideBarSectionHeader.foreground" = p.tx;
    "sideBarSectionHeader.border" = p.ui_2;
    "sideBar.activeBackground" = p.ui_3;
    "sideBar.activeForeground" = p.tx;
    "sideBar.hoverBackground" = p.ui_2;
    "sideBar.hoverForeground" = p.tx_2;
    "sideBar.folderIcon.foreground" = p.gr;
    "sideBar.fileIcon.foreground" = p.bl;
    "list.warningForeground" = p.or;
    "list.errorForeground" = p.re;
    "list.inactiveSelectionBackground" = p.ui_2;
    "list.activeSelectionBackground" = p.ui_3;
    "list.inactiveSelectionForeground" = p.tx;
    "list.activeSelectionForeground" = p.tx;
    "list.hoverForeground" = p.tx;
    "list.hoverBackground" = p.ui_2;
    "input.background" = p.bg_2;
    "input.foreground" = p.tx;
    "input.border" = p.ui_2;
    "input.placeholderForeground" = p.tx_2;
    "inputOption.activeBorder" = p.ui_2;
    "inputOption.activeBackground" = p.ui;
    "inputOption.activeForeground" = p.tx;
    "inputValidation.infoBackground" = p.cy;
    "inputValidation.infoBorder" = p.cy_2;
    "inputValidation.warningBackground" = p.or;
    "inputValidation.warningBorder" = p.or_2;
    "inputValidation.errorBackground" = p.re;
    "inputValidation.errorBorder" = p.re_2;
    "dropdown.background" = p.bg_2;
    "dropdown.foreground" = p.tx;
    "dropdown.border" = p.ui_2;
    "dropdown.listBackground" = p.bg;
    "badge.background" = p.cy;
    "activityBarBadge.background" = p.cy;
    "button.background" = p.cy;
    "button.foreground" = p.bg;
    "badge.foreground" = p.bg;
    "activityBarBadge.foreground" = p.bg;
  };

  tokenColors = [
    { name = "plain"; scope = [ "source" "support.type.property-name.css" ]; settings = { foreground = p.tx; }; }
    { name = "classes"; scope = [ "entity.name.type.class" ]; settings = { foreground = p.or_2; }; }
    { name = "interfaces"; scope = [ "entity.name.type.interface" "entity.name.type" ]; settings = { foreground = p.ye; }; }
    { name = "structs"; scope = [ "entity.name.type.struct" ]; settings = { foreground = p.or; }; }
    { name = "enums"; scope = [ "entity.name.type.enum" ]; settings = { foreground = p.or; }; }
    { name = "keys"; scope = [ "meta.object-literal.key" "support.type.property-name" ]; settings = { foreground = p.or; }; }
    { name = "methods"; scope = [ "entity.name.function.method" "meta.function.method" ]; settings = { foreground = p.gr; }; }
    { name = "functions"; scope = [ "entity.name.function" "support.function" "meta.function-call.generic" ]; settings = { foreground = p.or; fontStyle = "bold"; }; }
    { name = "variables"; scope = [ "variable" "meta.variable" "variable.other.object.property" ]; settings = { foreground = p.tx; }; }
    { name = "variablesOther"; scope = [ "variable.other.object" "variable.other.readwrite.alias" ]; settings = { foreground = p.gr_2; }; }
    { name = "globalVariables"; scope = [ "variable.other.global" "variable.language.this" ]; settings = { foreground = p.ma_2; }; }
    { name = "localVariables"; scope = [ "variable.other.local" ]; settings = { foreground = p.ui; }; }
    { name = "parameters"; scope = [ "variable.parameter" "meta.parameter" ]; settings = { foreground = p.tx; }; }
    { name = "properties"; scope = [ "variable.other.property" "meta.property" ]; settings = { foreground = p.bl_2; }; }
    { name = "strings"; scope = [ "string" "string.other.link" "markup.inline.raw.string.markdown" ]; settings = { foreground = p.cy; }; }
    { name = "stringEscapeSequences"; scope = [ "constant.character.escape" "constant.other.placeholder" ]; settings = { foreground = p.tx; }; }
    { name = "keywords"; scope = [ "keyword" ]; settings = { foreground = p.gr; }; }
    { name = "keywordsControl"; scope = [ "keyword.control.import" "keyword.control.from" "keyword.import" ]; settings = { foreground = p.re; }; }
    { name = "storageModifiers"; scope = [ "storage.modifier" "keyword.modifier" "storage.type" ]; settings = { foreground = p.bl; }; }
    { name = "comments"; scope = [ "comment" "punctuation.definition.comment" ]; settings = { foreground = p.tx_2; }; }
    { name = "docComments"; scope = [ "comment.documentation" "comment.line.documentation" ]; settings = { foreground = p.tx_3; }; }
    { name = "numbers"; scope = [ "constant.numeric" ]; settings = { foreground = p.pu; }; }
    { name = "booleans"; scope = [ "constant.language.boolean" "constant.language.json" ]; settings = { foreground = p.ye; }; }
    { name = "operators"; scope = [ "keyword.operator" ]; settings = { foreground = p.re; }; }
    { name = "macros"; scope = [ "entity.name.function.preprocessor" "meta.preprocessor" ]; settings = { foreground = p.bl; }; }
    { name = "preprocessor"; scope = [ "meta.preprocessor" ]; settings = { foreground = p.ma; }; }
    { name = "urls"; scope = [ "markup.underline.link" ]; settings = { foreground = p.bl; }; }
    { name = "tags"; scope = [ "entity.name.tag" ]; settings = { foreground = p.bl; }; }
    { name = "jsxTags"; scope = [ "support.class.component" ]; settings = { foreground = p.ma; }; }
    { name = "attributes"; scope = [ "entity.other.attribute-name" "meta.attribute" ]; settings = { foreground = p.ye; }; }
    { name = "types"; scope = [ "support.type" ]; settings = { foreground = p.ye; }; }
    { name = "constants"; scope = [ "variable.other.constant" "variable.readonly" ]; settings = { foreground = p.tx; }; }
    { name = "labels"; scope = [ "entity.name.label" "punctuation.definition.label" ]; settings = { foreground = p.ma; }; }
    { name = "namespaces"; scope = [ "entity.name.namespace" "storage.modifier.namespace" "markup.bold.markdown" ]; settings = { foreground = p.ye; }; }
    { name = "modules"; scope = [ "entity.name.module" "storage.modifier.module" ]; settings = { foreground = p.re; }; }
    { name = "typeParameters"; scope = [ "variable.type.parameter" "variable.parameter.type" ]; settings = { foreground = p.or; }; }
    { name = "exceptions"; scope = [ "keyword.control.exception" "keyword.control.trycatch" ]; settings = { foreground = p.ma; }; }
    { name = "decorators"; scope = [ "meta.decorator" "punctuation.decorator" "entity.name.function.decorator" ]; settings = { foreground = p.ye; }; }
    { name = "calls"; scope = [ "variable.function" ]; settings = { foreground = p.tx; }; }
    { name = "punctuation"; scope = [ "punctuation" "punctuation.terminator" "punctuation.definition.tag" "punctuation.separator" "punctuation.definition.string" "punctuation.section.block" ]; settings = { foreground = p.tx_2; }; }
    { name = "yellow"; scope = [ "storage.type.numeric.go" "storage.type.byte.go" "storage.type.boolean.go" "storage.type.string.go" "storage.type.uintptr.go" "storage.type.error.go" "storage.type.rune.go" "constant.language.go" "support.class.dart" "keyword.other.documentation" "storage.modifier.import.java" "punctuation.definition.list.begin.markdown" "punctuation.definition.quote.begin.markdown" "meta.separator.markdown" "entity.name.section.markdown" ]; settings = { foreground = p.ye; }; }
    { name = "green"; scope = [  ]; settings = { foreground = p.gr; }; }
    { name = "cyan"; scope = [ "markup.italic.markdown" "support.type.python" "variable.legacy.builtin.python" "support.constant.property-value.css" "storage.modifier.attribute.swift" ]; settings = { foreground = p.cy; }; }
    { name = "blue"; scope = [  ]; settings = { foreground = p.bl; }; }
    { name = "purple"; scope = [ "keyword.channel.go" "keyword.other.platform.os.swift" ]; settings = { foreground = p.pu; }; }
    { name = "magenta"; scope = [ "punctuation.definition.heading.markdown" ]; settings = { foreground = p.ma; }; }
    { name = "red"; scope = [  ]; settings = { foreground = p.re; }; }
    { name = "orange"; scope = [  ]; settings = { foreground = p.or; }; }
  ];
}

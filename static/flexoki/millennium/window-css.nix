## window-css.nix
##
## Renders one of Millennium's per-window CSS files (webkit / libraryroot /
## friends / bigpicture). Every file gets the same :root custom-property
## block so the palette is available no matter which injection context
## Steam scopes each stylesheet to, plus a shared foundation block.
##
## Library selectors below come from a live libraryroot DOM dump (2026-09,
## Ukrainian locale, game 356190 selected). Steam hashes class names
## (e.g. _3Z3ohQ8-...), so these are intentionally brittle — expect to
## re-verify with `steam -dev` + Ctrl+Shift+I after Steam updates.
## friends / bigpicture stay foundation-only until we get DOM dumps.

{ rootVars, window, variant ? "dark", palette ? null }:
let
  foundation = ''
    /* ---- Flexoki foundation (all windows, ${variant}) ---- */
    body.SteamUIPopupWindowBody,
    .ModalPosition,
    .MillenniumSettings {
      background: var(--flexoki-bg) !important;
      color: var(--flexoki-tx) !important;
    }

    a,
    .Link,
    .Anchor,
    .Association a,
    ._2j8Xh4pPOOgF4MF6FVUI28.Name {
      color: var(--flexoki-link) !important;
    }

    .DialogButton.Primary {
      background: var(--flexoki-accent) !important;
      color: var(--flexoki-play-text) !important;
    }

    .DialogButton.Secondary {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }

    .DialogInput,
    .DialogDropDown,
    textarea.DialogInput,
    textarea.PostTextEntryArea {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }

    .DialogInput::placeholder,
    textarea::placeholder {
      color: var(--flexoki-tx-3) !important;
    }

    :focus-visible,
    .Focusable:focus {
      outline: 1px solid var(--flexoki-accent-2) !important;
      outline-offset: 1px;
    }

    ::-webkit-scrollbar {
      background: var(--flexoki-bg) !important;
    }
    ::-webkit-scrollbar-thumb {
      background: var(--flexoki-ui-3) !important;
    }

    /* Millennium's own UI must not keep Steam defaults. */
    .MillenniumDesktopSidebar {
      background: var(--flexoki-bg-2) !important;
    }
    .MillenniumDesktopSidebar_Title,
    .MillenniumDesktopSidebar_Content,
    .MillenniumSettings .DialogContent_InnerWidth {
      color: var(--flexoki-tx) !important;
    }
    .MillenniumButton.DialogButton.Secondary {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }

    /* Context / popup menus (Ігри/Саундтреки, right-click, dropdowns).
     * These render in the popup/menu layer outside libraryroot, so they
     * must live in foundation (webkit.css sees them too). Steam-styled:
     * same shape, Flexoki bg/border/text only. */
    .ContextMenu,
    .ContextMenuContainer,
    [role="menu"],
    .Menu,
    .PopupMenu,
    .DialogMenu,
    .DropDownMenu {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx-2) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }
    .ContextMenu *,
    .ContextMenuContainer *,
    [role="menu"] *,
    .Menu *,
    .PopupMenu * {
      border-color: var(--flexoki-ui-2) !important;
    }
    .MenuItem,
    [role="menuitem"],
    .MenuItemLabel,
    .ContextMenuItem,
    .DropDownMenuItem {
      background: transparent !important;
      color: var(--flexoki-tx-2) !important;
    }
    .MenuItem:hover,
    [role="menuitem"]:hover,
    .MenuItem.Focusable:hover,
    .ContextMenuItem:hover,
    .DropDownMenuItem:hover {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }
    .MenuItem.Selected,
    [role="menuitem"][aria-checked="true"],
    .MenuItem[aria-selected="true"] {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }
    .MenuSeparator,
    .ContextMenuSeparator,
    hr.Separator {
      background: var(--flexoki-ui-2) !important;
    }
    .MenuItem svg,
    [role="menuitem"] svg {
      fill: currentColor !important;
    }
  '';

  library = ''
    /* ---- libraryroot (from live DOM dump) ---- */

    /* Top chrome: menu bar + nav. Selected tab gets accent underline. */
    .RootMenuBar,
    .TitleBarControls,
    ._3Z7VQ1IMk4E3HsHvrkLNgo.TopBar,
    ._3Z3ohQ8-1NKnCZkbS6fvy.SuperNavBar {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx-2) !important;
    }
    .SuperNavMenu.Selected,
    ._1gqEjB5QsKT_NftD1dEsdZ.Selected .MenuButton,
    .RootMenuButton:hover .SteamButton {
      color: var(--flexoki-tx) !important;
      border-bottom: 2px solid var(--flexoki-accent-2) !important;
    }

    /* Left game list. */
    .LeftListSizableContainer,
    .GameListHomeAndSearch,
    .Container.LibraryDisplaySizeLarge {
      background: var(--flexoki-bg) !important;
    }
    .GameListEntryContainer {
      color: var(--flexoki-tx-2) !important;
    }
    .GameListEntryContainer.Installed,
    .Container.Installed {
      color: var(--flexoki-tx) !important;
    }
    .GameListEntryContainer.Uninstalled,
    .Container.Uninstalled {
      color: var(--flexoki-tx-2) !important;
      opacity: 0.85;
    }
    .GameListEntryContainer:hover,
    .Container.Focusable:hover {
      background: var(--flexoki-ui) !important;
      color: var(--flexoki-tx) !important;
    }
    .Selected .GameListEntryContainer,
    .Container.Selected,
    ._1UBpAXP408Ez_L_mXhW5Q9.Selected {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
      border-left: 2px solid var(--flexoki-accent-2) !important;
    }
    .SectionName,
    .SectionCount {
      color: var(--flexoki-tx-3) !important;
    }
    .DownloadProgress {
      color: var(--flexoki-link) !important;
    }

    /* Search + filters. */
    .SearchBar,
    .SearchInput input,
    .AdvancedSearchPane {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx) !important;
      border-color: var(--flexoki-ui-3) !important;
    }
    .FilterBucketLabel,
    .ViewName {
      color: var(--flexoki-tx-2) !important;
    }

    /* Play bar: keep green semantic for Play. */
    .PlayBar {
      background: var(--flexoki-bg-2) !important;
    }
    .PlayButtonContainer.Green,
    .PlayButtonContainer._3cI5TXsFX3bvpR-7EBOtxq.Green {
      background: var(--flexoki-accent) !important;
    }
    .PlayButtonContainer.Green .ButtonText,
    .PlayButtonContainer.Green svg {
      color: var(--flexoki-play-text) !important;
      fill: var(--flexoki-play-text) !important;
    }
    .PlayBarLabel {
      color: var(--flexoki-tx-2) !important;
    }
    .PlayBarDetailLabel,
    .LastPlayedInfo {
      color: var(--flexoki-tx-3) !important;
    }
    .MenuButtonContainer .MenuButton {
      color: var(--flexoki-tx-2) !important;
    }
    .MenuButtonContainer .MenuButton:hover {
      color: var(--flexoki-tx) !important;
      background: var(--flexoki-ui-2) !important;
    }

    /* Details header: don't recolor art, add legibility scrim. */
    .TopCapsule .TopGradient {
      background: linear-gradient(transparent, var(--flexoki-bg)) !important;
    }
    .HeaderFeatures .InCollection {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }
    .GameDescription {
      color: var(--flexoki-tx) !important;
    }
    .AssociationList .Label,
    .Release .Label {
      color: var(--flexoki-tx-2) !important;
    }
    .CompatToolContainer {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx-2) !important;
      border: 1px solid var(--flexoki-accent-2) !important;
    }

    /* Cards in both columns. */
    .AppDetailsSectionContainer,
    .AppGameInfoContainer,
    .InnerContainer.Panel {
      background: var(--flexoki-bg) !important;
      color: var(--flexoki-tx) !important;
    }
    .SectionHeader .LabelText {
      color: var(--flexoki-tx) !important;
    }
    .AchievementProgressContainer {
      background: var(--flexoki-ui-2) !important;
    }
    .AchievementProgress,
    .DetailsProgressBar {
      background: var(--flexoki-accent) !important;
    }

    /* Bottom bar. */
    .BottomBarContainer,
    .BottomBar {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx-2) !important;
    }
    .AddGameButton:hover,
    .FriendsButton:hover,
    .DownloadStatus:hover {
      color: var(--flexoki-tx) !important;
      background: var(--flexoki-ui-2) !important;
    }
  '';

  sidebar = ''
    /* ---- library sidebar (live DOM 2026-09, Steam-styled, recolor only) ---- */

    /* Containers + virtualized list: keep Steam layout, just Flexoki bg. */
    ._9sPoVBFyE_vE87mnZJ5aB.LeftListSizableContainer,
    ._3x1HklzyDs4TEjACrRO2tB.Container,
    ._2TKEazUUS3TlniZfpc8OOe.GameListHomeAndSearch,
    ._1ijTaXJJA5YWl_fW2IxcaT.Container,
    .ReactVirtualized__Grid,
    .ReactVirtualized__Grid__innerScrollContainer,
    div[role="gridcell"].Panel {
      background: var(--flexoki-bg) !important;
    }
    div[role="gridcell"].Panel {
      border: none !important;
    }

    /* Home + Collections rows: same treatment as game rows (filled select). */
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox,
    ._2CEKFex6JMsAse2lqMMjUp.CollectionsButton,
    .xeuK3OqQYpIbPs1mCIS0k.CollectionBar {
      background: transparent !important;
    }
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox a._3pSPluBgf0NeR1kkCLWMhR.Bar,
    .xeuK3OqQYpIbPs1mCIS0k.CollectionBar a._3pSPluBgf0NeR1kkCLWMhR.Bar {
      background: transparent !important;
      color: var(--flexoki-tx-2) !important;
      border-radius: 2px !important;
    }
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox a._3pSPluBgf0NeR1kkCLWMhR.Bar:hover,
    .xeuK3OqQYpIbPs1mCIS0k.CollectionBar a._3pSPluBgf0NeR1kkCLWMhR.Bar:hover {
      background: var(--flexoki-ui) !important;
      color: var(--flexoki-tx) !important;
    }
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox a._3pSPluBgf0NeR1kkCLWMhR.Bar .Icon,
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox a._3pSPluBgf0NeR1kkCLWMhR.Bar .Icon svg,
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox a._3pSPluBgf0NeR1kkCLWMhR.Bar .Icon svg g,
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox a._3pSPluBgf0NeR1kkCLWMhR.Bar .Icon svg path {
      fill: currentColor !important;
      color: inherit !important;
    }
    ._3AhYljPF4e4E8LaBt-FoY0.HomeBox a._3pSPluBgf0NeR1kkCLWMhR.Bar .Label,
    a._3pSPluBgf0NeR1kkCLWMhR.Bar ._3O48LaKWcabKx07xdrt1TH.Label {
      color: inherit !important;
      background: transparent !important;
    }
    .nC-pL16iUnIRcaj1UVnwq.CollectionIcon ._2tyaVs9BpqcW068aaOrO56.CollectionIconBox {
      background: var(--flexoki-ui-2) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }

    /* Search header (Ігри/Саундтреки): the whole SearchBar acts as the
     * menu button in Steam (MenuHeader itself has no tabindex). Prior
     * single-class rules lost to Steam's parent-scoped defaults, so chain
     * the full path for specificity and treat SearchBar hover as the
     * button hover, Steam-styled. */
    ._1ZS_xta5HMXzR8JgxDH6n7.Bar {
      background: var(--flexoki-bg) !important;
    }
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar,
    ._1ZS_xta5HMXzR8JgxDH6n7.Bar ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar[tabindex] {
      background: var(--flexoki-bg) !important;
      color: var(--flexoki-tx-2) !important;
      border-radius: 2px !important;
    }
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar:hover,
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar:focus-within {
      background: var(--flexoki-ui) !important;
      color: var(--flexoki-tx) !important;
    }
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar ._2PF_m-I5yte3WnQhpcz8RC.MenuHeader {
      background: transparent !important;
      color: inherit !important;
      border: none !important;
    }
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar ._2PF_m-I5yte3WnQhpcz8RC.MenuHeader ._3kSh7qVSTDcPDePx9kya8C.ViewName,
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar ._3kSh7qVSTDcPDePx9kya8C.ViewName {
      color: inherit !important;
      background: transparent !important;
    }
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar ._15aGnszAf3gHD-PFdJBoFD.Arrow,
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar ._15aGnszAf3gHD-PFdJBoFD.Arrow svg,
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar ._15aGnszAf3gHD-PFdJBoFD.Arrow svg polygon,
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar svg.SVGIcon_DownArrowContextMenu polygon {
      fill: currentColor !important;
      color: inherit !important;
    }
    /* ScrollToTop nests inside SearchBar in the live DOM — keep its own
     * chip style above the SearchBar hover bg. */
    ._2WgQEFvIzJw_SHNGbjtRFU.SearchBar .uE7Pj4tb2n3_Bx4vjEX0a.ScrollToTop {
      background: var(--flexoki-ui-2) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }
    /* Popup/menu layer is themed in foundation (webkit sees it too). */
    /* (context menu rules live in foundation above) */

    /* ScrollToTop: keep Steam floating minimal, recolor only. */
    .uE7Pj4tb2n3_Bx4vjEX0a.ScrollToTop {
      background: var(--flexoki-ui-2) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }
    .uE7Pj4tb2n3_Bx4vjEX0a.ScrollToTop svg polyline {
      stroke: var(--flexoki-tx-2) !important;
    }
    .uE7Pj4tb2n3_Bx4vjEX0a.ScrollToTop:hover svg polyline {
      stroke: var(--flexoki-tx) !important;
    }

    /* Filter chips: Steam subtle toggle, neutral Flexoki. */
    ._36r2az6roul_Oej7D4BMI6.ViewFiltersBar {
      background: var(--flexoki-bg) !important;
    }
    ._3mzKdQXht__YHo6PX1LmB6.CheckboxWithImage {
      color: var(--flexoki-tx-2) !important;
      border-radius: 2px !important;
    }
    ._3mzKdQXht__YHo6PX1LmB6.CheckboxWithImage:hover {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }
    ._3mzKdQXht__YHo6PX1LmB6.CheckboxWithImage svg {
      fill: currentColor !important;
    }
    ._3mzKdQXht__YHo6PX1LmB6.CheckboxWithImage svg circle,
    ._3mzKdQXht__YHo6PX1LmB6.CheckboxWithImage svg polyline,
    ._3mzKdQXht__YHo6PX1LmB6.CheckboxWithImage svg path {
      stroke: currentColor !important;
    }
    /* ReadyToPlay ships stroke="#000000" inline; inherit chip color. */
    ._3mzKdQXht__YHo6PX1LmB6.CheckboxWithImage svg [stroke="#000000"] {
      stroke: currentColor !important;
    }

    /* Search field + advanced search pane. */
    ._20QAC4WMXm8qFE8waUT5oo.Container {
      background: var(--flexoki-bg) !important;
    }
    ._12vo5L1hsNGdao6_ssuirS.SearchInput .DialogInput_Wrapper,
    .SHc3wTNfO8Te6rT8PtwYW .DialogInput_Wrapper {
      background: var(--flexoki-bg-2) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }
    ._1TxHdzOt3OD9ikR3xIseKe.AdvancedSearchButton {
      color: var(--flexoki-tx-2) !important;
    }
    ._1TxHdzOt3OD9ikR3xIseKe.AdvancedSearchButton:hover {
      color: var(--flexoki-tx) !important;
      background: var(--flexoki-ui-2) !important;
    }
    ._1TxHdzOt3OD9ikR3xIseKe.AdvancedSearchButton svg path {
      fill: currentColor !important;
    }
    .Woh0kBQCmatzC1daBX9i6.AdvancedSearchPane {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }
    .Woh0kBQCmatzC1daBX9i6 .DialogHeader.Header {
      color: var(--flexoki-tx) !important;
    }
    ._1axoiZsC1RBp22JQmxiBIc.FilterBucket .FilterBucketLabel {
      color: var(--flexoki-tx-2) !important;
    }
    ._1J53P1yXTWlwJRyCAzMQei.Row {
      border-radius: 2px !important;
    }
    ._1J53P1yXTWlwJRyCAzMQei.Row:hover {
      background: var(--flexoki-ui) !important;
    }
    .DialogToggle_Label {
      color: var(--flexoki-tx-2) !important;
    }
    .Row:hover .DialogToggle_Label {
      color: var(--flexoki-tx) !important;
    }
    /* Checkboxes: Steam blue-check style, Flexoki link-blue recolor. */
    .DialogCheckbox_Container .DialogCheckbox {
      background: var(--flexoki-bg) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }
    .DialogCheckbox_Container[aria-checked="true"] .DialogCheckbox,
    div[role="checkbox"][aria-checked="true"] .DialogCheckbox {
      background: var(--flexoki-bg) !important;
      border-color: var(--flexoki-link) !important;
    }
    .DialogCheckbox svg path[stroke^="url("] {
      stroke: var(--flexoki-link) !important;
    }
    ._2J170P0ckFcUIlsDU13MLS.CompatDropDown .DialogDropDown {
      background: var(--flexoki-bg) !important;
      color: var(--flexoki-tx-2) !important;
      border: 1px solid var(--flexoki-ui-3) !important;
    }
    ._2GVYKKA0-FikD4ejRjx1Oh.Buttons .SaveButton.DialogButton.Primary.Disabled {
      background: var(--flexoki-ui) !important;
      color: var(--flexoki-tx-3) !important;
      opacity: 0.6 !important;
    }

    /* Game rows: paint the outer Container Steam does, not just inner. */
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable {
      border-radius: 2px !important;
    }
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Installed,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container._2ws8DONH9fxQjPXEmRpujE {
      color: var(--flexoki-tx) !important;
    }
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Uninstalled,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container._5YTBr7WwIfzVU_3nUtAph {
      color: var(--flexoki-tx-2) !important;
    }
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Updating,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container._1LVQp3h_vGOZ8TuDUEge0k {
      color: var(--flexoki-tx) !important;
    }
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover {
      background: var(--flexoki-ui) !important;
      color: var(--flexoki-tx) !important;
    }
    /* Let the outer hover show through: Updating rows (Blasphemous,
     * PICO PARK 2, Liftoff, RUNNING WITH RIFLES, ...) keep Steam bgs on
     * inner layers that cover the outer hover. */
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover ._1vO6BoiVslZgs1kqDGdUs8.GameListEntryContainer,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover .-BsLCHlCHg50lwvxnBWt1.GameListEntryLabels,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover ._2SXJM0PeFEi3gbC7V3S5pE.GameListEntryName,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover ._2kzMb_F7UTOEdecAFftN-l.AppIconDownloading,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover ._2-J2nMJ1zmDok8-jqXlf1e.StatusIcon {
      background: transparent !important;
      color: inherit !important;
    }
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover ._3uk3F1BmAJQR6rl1TPcaif.DownloadProgress {
      color: var(--flexoki-link) !important;
      background: transparent !important;
    }
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Focusable:hover .f6-7-5CWFxNqF2BycKWlb.DownloadProgressSVG circle {
      stroke: var(--flexoki-link) !important;
    }
    ._2-O4ZG0KrnSrzISHBKctFQ.Container.Selected,
    ._2-O4ZG0KrnSrzISHBKctFQ.Container._1UBpAXP408Ez_L_mXhW5Q9.Selected {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }
    ._2SXJM0PeFEi3gbC7V3S5pE.GameListEntryName {
      color: inherit !important;
    }
    ._2RggXvVkWMDvvxFegjtKso.DownloadDash {
      color: var(--flexoki-tx-3) !important;
    }
    ._3uk3F1BmAJQR6rl1TPcaif.DownloadProgress {
      color: var(--flexoki-link) !important;
    }
    ._1R9r2OBCxAmtuUVrgBEUBw.GreyBackground.GameIcon {
      background: var(--flexoki-ui) !important;
    }
    .f6-7-5CWFxNqF2BycKWlb.DownloadProgressSVG circle {
      stroke: var(--flexoki-link) !important;
    }

    /* Section headers (ЗАВАНТАЖЕНЕ / БЕЗ КАТЕГОРІЇ): Steam collapse row.
     * Higher-specificity chain — Steam paints these via parent selectors
     * that beat single-class rules even with !important ordering. */
    ._2sYIghGVXJr6tsQVvcryy8.Container.CollapseIconParent,
    ._2sYIghGVXJr6tsQVvcryy8.Container.ehAsUVkW87U5OHZJohB5N.CollapseIconParent.Focusable {
      background: transparent !important;
      border-radius: 2px !important;
    }
    ._2sYIghGVXJr6tsQVvcryy8.Container.CollapseIconParent:hover,
    ._2sYIghGVXJr6tsQVvcryy8.Container.ehAsUVkW87U5OHZJohB5N.CollapseIconParent.Focusable:hover {
      background: var(--flexoki-ui) !important;
    }
    ._3cV3O8FnPQqpJO5kIMUlLX.SectionHeaderContent ._2mZ8LlvoUiyeEUtIWuTri.SectionName,
    ._2sYIghGVXJr6tsQVvcryy8.Container ._2mZ8LlvoUiyeEUtIWuTri.SectionName {
      color: var(--flexoki-tx) !important;
      background: transparent !important;
      font-weight: 600 !important;
      letter-spacing: 0.04em !important;
    }
    ._3cV3O8FnPQqpJO5kIMUlLX.SectionHeaderContent ._29uten9Yy8q-n7woDEOXVF.SectionCount,
    ._2sYIghGVXJr6tsQVvcryy8.Container ._29uten9Yy8q-n7woDEOXVF.SectionCount {
      color: var(--flexoki-tx-2) !important;
      background: transparent !important;
    }
    ._1PxXcZNpN0cCxbnjEoTdYT.SectionRule {
      background: var(--flexoki-ui-2) !important;
    }
    ._3SFRZYIb9Y2q7YsVtB3YKb.Container svg {
      color: var(--flexoki-tx-3) !important;
    }
    ._3SFRZYIb9Y2q7YsVtB3YKb.Container svg circle,
    ._3SFRZYIb9Y2q7YsVtB3YKb.Container svg line {
      stroke: currentColor !important;
    }
  '';

  gamepage = ''
    /* ---- game page (live DOM 2026-09, Shadow of War 356190, Steam-styled) ---- */

    /* Main shell: keep Steam Glassy translucency, only tint. */
    ._3BFcmjAaMyP6GTPwc0VyWi.MainPanel,
    ._2Dd4T78PcCTUVgOtDGFY5j.AppDetailsTransitionGroup,
    ._2Nq6ov7A1hGcHXVOXNt_OE.AppDetailsMain,
    ._3lDczhulqraStjCitLYJ1K.Body.ScrollContainer.Glassy,
    ._25oBZpa3dUcMw8QAsa2u67.AppGameInfoContainer {
      background: var(--flexoki-bg) !important;
      color: var(--flexoki-tx) !important;
    }
    ._27RcNu8aXKBpYkHcNNrt-X.Container.Glassy .Jbe--NUNw7sxbxGsMSjVa.BackdropGlass,
    ._1Qa-Aq8WFiF9584yU_1xuC.Backdrop {
      background: var(--flexoki-bg-2) !important;
    }
    ._2_86QNCjVvJTL3Qe6Xztx_.StickyHeaderShadow,
    ._1FXWy2UilVZIppT-PetDWw.GameInfoShadow {
      background: linear-gradient(var(--flexoki-bg), transparent) !important;
    }

    /* PlayBar: transparent inner layers so the Glassy bar shows through. */
    ._2L3s2nzh7yCnNESfI5_dN1.PlayBar.Container,
    ._3fLo166MlaNqP8r8tTyRz.PlayBar.Glassy,
    ._3Y87YQY56ZCOqhgcZFaDc5.InnerContainer.Panel,
    ._9EHg918wH6CQCQlD5PWOO.Row,
    ._2zxzStp5qY5M1evOm8keES.ActionSection,
    ._1YbtIWcfkQJOysLXQbwzRf.StatusAndStats,
    .zjtAIAWI6HE0oCtJzw6Qt.StatusNameContainer,
    ._1mDAVT4sTzFRwJtlKCw2Ws.GameStatsSection {
      background: transparent !important;
    }
    ._1FnJ6dPuknQFQ2RTpKTI16.PlayButtonContainer._3cI5TXsFX3bvpR-7EBOtxq.Green.Panel {
      background: var(--flexoki-accent) !important;
    }
    ._3ydigb6zZAjJ0JCDgHwSYA.PlayButton .playTriangle {
      fill: var(--flexoki-play-text) !important;
    }
    ._3ydigb6zZAjJ0JCDgHwSYA.PlayButton ._33cnXIqTRgRr49_FNXIHj6.ButtonText {
      color: var(--flexoki-play-text) !important;
    }

    /* Cloud stats: synced green, transient blue, Steam layout untouched. */
    ._2cRYms-zZc4misk9tj3bt8.PlayBarCloudStatusContainer .tool-tip-source,
    ._1nxYsdQLxAV_i8JIm-f64w.GameStat.Panel,
    ._2YTg3hVVde1EN1A4QVkvAE.GameStatRight {
      background: transparent !important;
    }
    ._3bkqc-SsCg0b3FTEuewlK8.GameStatIconForced svg,
    ._3bkqc-SsCg0b3FTEuewlK8.GameStatIconForced svg path {
      fill: currentColor !important;
    }
    ._1nxYsdQLxAV_i8JIm-f64w.GameStat.Panel {
      color: var(--flexoki-accent) !important;
    }
    ._2YTg3hVVde1EN1A4QVkvAE.GameStatRight ._34lrt5-Fc3usZU6trA1P0-.PlayBarLabel {
      color: var(--flexoki-tx-2) !important;
    }
    ._2TYVGoD27ZMfjRirKQNLfk.PlayBarDetailLabel {
      color: var(--flexoki-tx-3) !important;
    }
    ._3Cdin80d-hVsakHUZboheb.AppDetailsButton.ClickablePlayBarItem.DialogButton.Secondary {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx-2) !important;
    }
    ._3Cdin80d-hVsakHUZboheb.AppDetailsButton.ClickablePlayBarItem.DialogButton.Secondary:hover {
      color: var(--flexoki-tx) !important;
    }

    /* Last played / playtime / achievements / size: Steam layout, Flexoki text. */
    ._1kiZKVbDe-9Ikootk57kpA.GameStat.Panel,
    ._1kiZKVbDe-9Ikootk57kpA.GameStat.Playtime,
    ._1kiZKVbDe-9Ikootk57kpA.GameStat.MiniAchievements,
    ._1kiZKVbDe-9Ikootk57kpA.Panel[data-size-on-disk] {
      background: transparent !important;
      color: var(--flexoki-tx-2) !important;
    }
    ._1tIg-QIrwMNtCm7NcYADyi.GameStatIcon svg polyline,
    ._1tIg-QIrwMNtCm7NcYADyi.GameStatIcon svg path,
    ._1tIg-QIrwMNtCm7NcYADyi.GameStatIcon svg circle {
      stroke: currentColor !important;
    }
    ._1tIg-QIrwMNtCm7NcYADyi.GameStatIcon svg path[fill="currentColor"] {
      fill: currentColor !important;
    }
    ._16quGbk-i_9yE-tFyyOK8G.AchievementProgressRow ._2TYVGoD27ZMfjRirKQNLfk.AchievementCountLabel {
      color: var(--flexoki-tx-2) !important;
    }
    ._25YVDTaClw6Y2COPsU0UaV.DetailsProgressContainer {
      background: var(--flexoki-ui-2) !important;
    }
    ._1FnTqlsi2_-TJf1d5apoS6.DetailsProgressBar {
      background: var(--flexoki-accent) !important;
    }
    ._2MBVRXpsw6DUjs7937DWZW.PlayBarIconAndGame ._1iNIp1p3ZhPoBwZbkmdb8o.PlayBarGameIcon.GreyBackground {
      background: var(--flexoki-ui) !important;
    }
    ._3rpUkswF6xc_ste4Ros_xM.PlayBarGameName {
      color: var(--flexoki-tx-2) !important;
    }

    /* Right-side icon buttons: settings/info/favorite keep Steam shape. */
    .lO1IF132jJ1gc9yz2HYvV.AppButtonsContainer ._3oddBTkj_FjknCgBnPqcmQ.MenuButtonContainer {
      background: transparent !important;
    }
    ._3qDWQGB0rtwM3qpXTb11Q-.MenuButton {
      color: var(--flexoki-tx-2) !important;
    }
    ._3qDWQGB0rtwM3qpXTb11Q-.MenuButton:hover {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }
    ._3qDWQGB0rtwM3qpXTb11Q-.MenuButton svg path {
      fill: currentColor !important;
    }
    ._3qDWQGB0rtwM3qpXTb11Q-.MenuButton svg circle,
    ._3qDWQGB0rtwM3qpXTb11Q-.MenuButton svg polyline,
    .zvLq1GUCH3yLuqv_TXBJ1.DotDotDot svg circle {
      stroke: currentColor !important;
    }

    /* Header art: never recolor art, blur, gloss, or card saturate filters. */
    ._1IX7FPSY9Jb82KhBVBSkZa.HeaderBackgroundImage,
    .QlR9EFwTdUNm_J5vx54_Z.ImgContainer,
    ._2DVdg_N1qLNDdnxJqN-RBX.TitleImageContainer,
    ._2bF7XkQZA1M7jTj6txLFp-.DLCArt,
    .HAvWsE0-ycDj77SdyLXE-.Gloss,
    ._2DUDvAhXoEOSsd8GTIsKLY.CardContainer {
      background: transparent !important;
    }

    /* Info column text: labels muted, values normal, links blue. */
    ._2AMl0koRXkR77BaY7Sa3Ie.Description .GameDescription {
      color: var(--flexoki-tx) !important;
    }
    ._2ZcNQxY8YknnhNa4ZvIoU4.AssociationList ._1vYL2q-91QLy-FBzntE7E5.Label,
    ._1OWQ9x11PhUMMRAfAu4d_4.Release ._1vYL2q-91QLy-FBzntE7E5.Label {
      color: var(--flexoki-tx-2) !important;
    }
    .izVv8jajo7mehdAkZozAK.Date {
      color: var(--flexoki-tx) !important;
    }
    ._-9icu8LqT7inRSJISgnkh.Association a._2j8Xh4pPOOgF4MF6FVUI28.Name:hover {
      text-decoration: underline !important;
    }
    .nkIX48cHLbjc0eaP5CNmM.FeaturesList ._1VoVzLPXjhlaguJLgO8htG.Label {
      color: var(--flexoki-tx-2) !important;
    }
    ._2UN73dmbVcWzIR2ZCr8KID.CompatToolContainer b {
      color: var(--flexoki-tx) !important;
    }

    /* Links row: preserve absolute layout, Steam hover underline. */
    .DgVQapkBmhAW6oPY5rPZo.Links.Panel {
      background: transparent !important;
    }
    .DY4_wSF8h9T5o46hO5I9V.Anchor.Panel {
      background: transparent !important;
    }
    ._1b6LYWVijW-9E4YV0keDWZ.Link ._2sNDjgK9EWiPLdNGkjun-w.Text {
      color: var(--flexoki-link) !important;
    }
    .DY4_wSF8h9T5o46hO5I9V.Anchor.Panel:hover ._2sNDjgK9EWiPLdNGkjun-w.Text {
      text-decoration: underline !important;
    }

    /* Cards: headers, dividers, muted meta, progress. */
    ._2r4TK4BAuU-J4FuF_O7v_5.AppDetailsSection.Panel,
    ._31ptFGGMZrSQc5BCX1e5lm.AppDetailsSectionContainer.Panel,
    ._5uvIN6jXDXzzck59F-nhv.Body {
      background: transparent !important;
    }
    ._3A_c3YHYd4YIjA8Y-olnPl.SectionHeader ._3i0kopAostOz2IDi9HqmeN.LabelText {
      color: var(--flexoki-tx) !important;
    }
    ._39bm0CkBxBjJsnPpAzoZlv.Subsection .nTb1NqsRSnwl0UTOYn_JA.SubsectionHeader,
    .uoFNFZ7Hs5cF1IjP2fvPw.Label,
    ._2H1MiFt6wMYuJDB8kZElFs.CardsLeft,
    ._1LNALpkg3wnKm61YtxBCOb.GlobalStatLabel,
    .BDa6lbTAdR4RwtqgRNUnO.PlayedForTime {
      color: var(--flexoki-tx-3) !important;
    }
    ._3jC8om-5Sci_dkUB-6VYiU.UnlockedLabel,
    ._3ca2d1qaIzPNm79jqRbi0J.BadgeName,
    .AVDXBqSa_LSoeGgEXKml8.Title {
      color: var(--flexoki-tx) !important;
    }
    ._14kZVEyaz7WX57N47z4Yr1.UnlockedLabelPercent,
    ._3QrX3TTEetJIRvEW1x2Af2.BadgeInfo ._2PMlMbFfEmv1xThuy6Vgqv.BadgeLevel {
      color: var(--flexoki-tx-2) !important;
    }
    ._3ns9185LizH61StaAXuAp6.AchievementProgressContainer {
      background: var(--flexoki-ui-2) !important;
    }
    ._3Rm36_oeAhvIg6ZYP9l1Jj.AchievementProgress {
      background: var(--flexoki-accent) !important;
    }
    .RPcyJMJC7chgPFkD4KWtO.Badge.EmptyCircle {
      border: 1px solid var(--flexoki-ui-3) !important;
      background: var(--flexoki-ui) !important;
    }
    ._2gISWIeEzZ9PNuAzVuMaWd.Remainder {
      background: var(--flexoki-ui-2) !important;
    }
    ._1-H7tKj_QcGHLUbx5wVsGg.RemainderText {
      color: var(--flexoki-tx-2) !important;
    }
    ._34I5HgBL6QP2CcuI4emtaM.MoreInfoIcon {
      color: var(--flexoki-tx-3) !important;
    }
    ._2RSxEUPGL8Bj016q0Sp3Hx.LoadContentButton {
      color: var(--flexoki-tx-2) !important;
    }
    ._2RSxEUPGL8Bj016q0Sp3Hx.LoadContentButton:hover {
      background: var(--flexoki-ui-2) !important;
      color: var(--flexoki-tx) !important;
    }

    /* Carousel close + recording badge: recolor hard white strokes. */
    ._2dB1oJFsqNThak1cFya2-q.PageableCloseButton svg line {
      stroke: var(--flexoki-tx-2) !important;
    }
    ._2dB1oJFsqNThak1cFya2-q.PageableCloseButton:hover svg line {
      stroke: var(--flexoki-tx) !important;
    }
    .P_gQ8X-yCsgXeXpP68KS0.GamePlaySummaryHeader,
    ._3ugJ_KPVlOd9oeYm-fYC_w.EventHeaderBlock {
      color: var(--flexoki-tx-2) !important;
    }
    ._2xWDffvlKnKW8aDKyFyg0n.DurationText.BackgroundRecording {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx) !important;
    }

    /* Activity + comments: muted counts, green online, Steam layout. */
    ._19LfMT7PFWg2xHOqNjR99q.AppActivityDate,
    ._3x31AgESSlUqX3D4MTHv2m.PostTextEntry .PostButton .Label {
      color: var(--flexoki-tx-2) !important;
    }
    ._3pcPRPvuGH7hEM33zLknZO.Rule {
      background: var(--flexoki-ui-2) !important;
    }
    ._3KynfhyRTjRbiUVeqUdUBJ.RatingContainer .CommentCount,
    ._3KynfhyRTjRbiUVeqUdUBJ.RatingContainer .LikeCount {
      color: var(--flexoki-tx-3) !important;
    }
    ._3KynfhyRTjRbiUVeqUdUBJ.RatingContainer svg path {
      fill: currentColor !important;
      color: var(--flexoki-tx-3) !important;
    }
    ._1t1iyV4uBG9M9tTM7rCFNu.ActorName.online,
    .nOdcT-MoOaXGePXLyPe0H.playerName {
      color: var(--flexoki-accent) !important;
    }
    .Gy1Y7lb4Y47vK8odzSru2.HeadlineGameName {
      color: var(--flexoki-tx) !important;
    }

    /* Overlays: keep Steam behavior, Flexoki surfaces. */
    ._37MAYpIjl0IDA1xVhhsuX8.AppDetailsOverlayTransitionGroup {
      background: transparent !important;
    }
    ._3IWn-2rn7x98o5fDd0rAxb.Collection.NewCollectionTarget {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx-2) !important;
    }
    ._2iJsgdTIX9Tj23rWnB7Q-c.Alert {
      background: var(--flexoki-bg-2) !important;
      color: var(--flexoki-tx) !important;
    }
    ._3om6pVKUdxdBkypYpSroHM.PatchNotesLink {
      color: var(--flexoki-link) !important;
    }
  '';

  perWindow =
    if window == "libraryroot" then library + "\n" + sidebar + "\n" + gamepage
    else if window == "webkit" then "/* webkit: foundation only. */"
    else "/* ${window}: foundation only until a live DOM dump lands. */";
in
''
  :root {
  ${rootVars}
  }

  ${foundation}

  ${perWindow}
''

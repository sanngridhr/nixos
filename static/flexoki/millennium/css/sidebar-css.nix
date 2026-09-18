## sidebar-css.nix — library left sidebar (live DOM 2026-09).
##
## Covers LeftListSizableContainer subtree: Home/Collections rows, the
## SearchBar MenuHeader button (whole SearchBar acts as the button in Steam),
## filter chips, search field + advanced pane, game rows incl. Updating
## hover, and category section headers. Steam-styled: same shapes, Flexoki
## colors only. Popup/menu layer lives in foundation-css.nix.

''
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
   * menu button in Steam (MenuHeader itself has no tabindex). Chained
   * full-path selectors beat Steam's parent-scoped defaults. */
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

  /* Game rows: paint the outer Container Steam does, not just inner.
   * Updating rows keep Steam bgs on inner layers that cover the outer
   * hover — force them transparent on hover. */
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
  /* Let the outer hover show through on every row state. */
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
''

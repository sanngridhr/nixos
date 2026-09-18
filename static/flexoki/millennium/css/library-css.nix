## library-css.nix — libraryroot shell: top chrome, game list basics,
## search/filters basics, PlayBar shell, details header, generic cards,
## bottom bar.
##
## Selectors come from a live libraryroot DOM dump (2026-09, Ukrainian
## locale, game 356190 selected). Steam hashes class names (e.g.
## _3Z3ohQ8-...), so these are intentionally brittle — re-verify with
## `steam -dev` + Ctrl+Shift+I after Steam updates. Steam-styled: same
## shapes, Flexoki colors only. Deep sidebar/gamepage detail lives in
## sidebar-css.nix / gamepage-css.nix.

''
  /* ---- libraryroot shell (from live DOM dump) ---- */

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

  /* Left game list basics (deep row/section detail in sidebar-css.nix). */
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

  /* Search + filters basics (deep detail in sidebar-css.nix). */
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

  /* Play bar shell: keep green semantic for Play (detail in gamepage). */
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

  /* Cards in both columns (detail in gamepage-css.nix). */
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
''

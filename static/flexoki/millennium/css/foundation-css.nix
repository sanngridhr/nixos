## foundation-css.nix — shared base for every Millennium output file.
##
## Covers body/links/buttons/inputs/scrollbars/Millennium's own UI plus the
## context/popup menu layer. Menus must live here (not in a libraryroot-only
## part) because Steam renders popups outside libraryroot, where only
## webkit.css is applied. Steam-styled: same shapes, Flexoki colors only.

{ variant }: ''
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
''

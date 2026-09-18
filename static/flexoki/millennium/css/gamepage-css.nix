## gamepage-css.nix — game details page (live DOM 2026-09, app 356190).
##
## Covers MainPanel/AppDetailsMain subtree: PlayBar inner layers and cloud
## states, header art (never recolored), info column, links row, right/left
## cards, activity feed, overlays. Steam-styled: same shapes and Glassy
## translucency, Flexoki colors only. Locked choices: transient cloud
## states tinted link, PostButton stays Secondary, remainder neutral.

''
  /* ---- game page (live DOM 2026-09, Steam-styled) ---- */

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
''

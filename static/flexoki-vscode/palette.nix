# Flexoki color palette (https://stephango.com/flexoki), keyed by the
# semantic names used in theme-template.nix. Change a hex here and it
# propagates to every place that name is used in both themes.
#
# Note: Nix attrset keys can't contain "-", so semantic names like
# "tx-2" become "tx_2" here.
{
  light = {
    # base / grayscale
    bg = "#FFFCF0";     # paper
    bg_2 = "#F2F0E5";   # base-50
    ui = "#E6E4D9";     # base-100
    ui_2 = "#DAD8CE";   # base-150
    ui_3 = "#CECDC3";   # base-200
    tx_3 = "#B7B5AC";   # base-300
    tx_2 = "#6F6E69";   # base-600
    tx = "#100F0F";     # black

    # accents -- 600 weight is primary in light mode
    re = "#AF3029"; re_2 = "#D14D41";
    or = "#BC5215"; or_2 = "#DA702C";
    ye = "#AD8301"; ye_2 = "#D0A215";
    gr = "#66800B"; gr_2 = "#879A39";
    cy = "#24837B"; cy_2 = "#3AA99F";
    bl = "#205EA6"; bl_2 = "#4385BE";
    pu = "#5E409D"; pu_2 = "#8B7EC8";
    ma = "#A02F6F"; ma_2 = "#CE5D97";

    # hex alpha suffix for selection highlight (theme-specific opacity)
    selectionAlpha = "44";
  };

  dark = {
    bg = "#100F0F";     # black
    bg_2 = "#1C1B1A";   # base-950
    ui = "#282726";     # base-900
    ui_2 = "#343331";   # base-850
    ui_3 = "#403E3C";   # base-800
    tx_3 = "#575653";   # base-700
    tx_2 = "#878580";   # base-500
    tx = "#CECDC3";     # base-200

    # accents -- 400 weight is primary in dark mode
    re = "#D14D41"; re_2 = "#AF3029";
    or = "#DA702C"; or_2 = "#BC5215";
    ye = "#D0A215"; ye_2 = "#AD8301";
    gr = "#879A39"; gr_2 = "#66800B";
    cy = "#3AA99F"; cy_2 = "#24837B";
    bl = "#4385BE"; bl_2 = "#205EA6";
    pu = "#8B7EC8"; pu_2 = "#5E409D";
    ma = "#CE5D97"; ma_2 = "#A02F6F";

    selectionAlpha = "33";
  };
}

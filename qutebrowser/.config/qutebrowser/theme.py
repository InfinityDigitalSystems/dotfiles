COLORS = {
    "highlight": "#2494BA",
    "urgent": "#E84545",
    "text": "#F1F1E4",
    "grey": "#575C60",
    "dark": "#202122",
    "darker": "#191A1A",
    "magenta": "#C054BC",
    "orange": "#F1A727",
    "green": "#5B9E2E",
}

def infinity_dark(c):
    c.prompt.radius = 0 # Rounding radius (in pixels) for the edges of prompts.

    c.fonts.default_size = "10pt"
    c.fonts.default_family = "JetBrainsMono NFM"

    # Height (in pixels or as percentage of the window) of the completion.
    # Type: PercOrInt
    c.completion.height = "33%"

    # Where to show the downloaded files.
    # Type: VerticalPosition
    # Valid values:
    #   - top
    #   - bottom
    c.downloads.position = "bottom"

    # Shrink the completion to be smaller than the configured size if there are no scrollbars.
    c.completion.shrink = True

    # Tabs
    # Scaling factor for favicons in the tab bar. The tab size is unchanged,
    # so big favicons also require extra `tabs.padding`.
    c.tabs.favicons.scale = 1
    # Padding (in pixels) around text for tabs.
    c.tabs.padding = {"bottom": 1, "left": 4, "right": 4, "top": 1}

    # Completion Background
    c.colors.completion.odd.bg = COLORS["dark"]
    c.colors.completion.even.bg = COLORS["dark"]

    # Completeion Category Headers
    c.colors.completion.category.fg = COLORS["text"]
    c.colors.completion.category.bg = COLORS["highlight"]
    c.colors.completion.category.border.top = COLORS["highlight"]
    c.colors.completion.category.border.bottom = COLORS["highlight"]

    # Selection Colors
    c.colors.completion.item.selected.bg = COLORS["grey"]
    c.colors.completion.item.selected.border.top = COLORS["grey"]
    c.colors.completion.item.selected.border.bottom = COLORS["grey"]
    c.colors.completion.item.selected.fg = COLORS["text"]
    c.colors.completion.match.fg = COLORS["magenta"]

    # Download colors
    c.colors.downloads.bar.bg = COLORS["dark"]

    # Background color for prompts.
    c.colors.prompts.bg = COLORS["highlight"]

    # Status Bar Colors
    c.colors.statusbar.command.fg = COLORS["text"]
    c.colors.statusbar.command.bg = COLORS["darker"]
    c.colors.statusbar.insert.fg = COLORS["darker"]
    c.colors.statusbar.insert.bg = COLORS["highlight"]
    c.colors.statusbar.passthrough.fg = COLORS["darker"]
    c.colors.statusbar.passthrough.bg = COLORS["green"]
    c.colors.statusbar.caret.fg = COLORS["darker"]
    c.colors.statusbar.caret.bg = COLORS["magenta"]

    c.colors.statusbar.url.fg = COLORS["text"]
    c.colors.statusbar.url.hover.fg = COLORS["magenta"]
    c.colors.statusbar.url.success.https.fg = COLORS["text"]
    c.colors.statusbar.url.success.http.fg = COLORS["orange"]
    c.colors.statusbar.url.warn.fg = COLORS["urgent"]

    # Tab Colors
    c.colors.tabs.odd.fg = COLORS["text"]
    c.colors.tabs.even.fg = COLORS["text"]
    c.colors.tabs.odd.bg = COLORS["dark"]
    c.colors.tabs.even.bg = COLORS["dark"]
    c.colors.tabs.selected.odd.bg = COLORS["highlight"]
    c.colors.tabs.selected.even.bg = COLORS["highlight"]
    c.colors.tabs.selected.odd.fg = COLORS["darker"]
    c.colors.tabs.selected.even.fg = COLORS["darker"]

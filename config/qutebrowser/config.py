import theme
import keymaps

# Sets the config variable
config = config
c = c

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(True)

# Set Theme
theme.infinity_dark(c)

# Set Keymaps
keymaps.keymaps(config)

# Make Tabs & Status Bar Hide Automatically
c.tabs.show = "multiple"
c.statusbar.show = "in-mode"
c.scrolling.bar = "when-searching"

# Clipboard
c.content.javascript.clipboard = "access-paste"

# Darkmode
# c.colors.webpage.bg = theme.COLORS["darker"]
# Disabled the chromium engine darkmode
# c.content.user_stylesheets = "./stylesheets/darkmode_fixes.css"
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = False
# c.colors.webpage.darkmode.policy.images = 'never'

# General Settings
c.confirm_quit = [
    "downloads"
]  # Require a confirmation before quitting the application. [always, downloads, multiple-tabs, never]
c.content.autoplay = False  # Automatically start playing `<video>` elements.
c.auto_save.session = (
    True  # Always Restore session. Without this option set, `:wq` needs to be used
)

# Request websites to minimize non-essentials animations and motion. This results in the `prefers-reduced-motion` CSS media query to evaluate to `reduce` (rather than `no-preference`).
c.content.prefers_reduced_motion = True
c.scrolling.smooth = False
c.keyhint.delay = 200

# Mode Switching Settings
c.input.insert_mode.auto_enter = (
    True  # Enter insert mode if an editable element is clicked.
)
c.input.insert_mode.auto_leave = (
    False  # Leave insert mode if a non-editable element is clicked.
)
# Automatically enter insert mode if an editable element is focused after loading the page.
c.input.insert_mode.auto_load = True
# Valid Options are "normal" "restore" "persist"
c.tabs.mode_on_change = "restore"

# Downloads
# Prompt the user for the download location. If set to false, `downloads.location.directory` will be used.
c.downloads.location.prompt = True
# Remember the last used download directory.
c.downloads.location.remember = True
# Where to show the downloaded files. ["top", "bottom"]
c.downloads.position = "bottom"

# Hints
c.hints.chars = "asdfghjkl"  # Characters used for hint strings.

# Start Page
# Page to open if :open -t/-b/-w is used without URL. Use `about:blank` for a blank page.
c.url.default_page = "https://start.duckduckgo.com/"
# Page(s) to open at the start.
c.url.start_pages = ["https://start.duckduckgo.com"]
# Open base URL of the searchengine if a searchengine shortcut is invoked without parameters.
c.url.open_base_url = True

# Tabs
# ignore: Don't do anything, blank: Load a blank page, startpage: Load the start page, default-page: Load the default page, close: Close the window.
c.tabs.last_close = "close"
# Switch between tabs using the mouse wheel.
c.tabs.mousewheel_switching = False
# prev: Select the tab which came before the closed one (left in horizontal, above in vertical), next: Select the tab which came after the closed one (right in horizontal, below in vertical), last-used: Select the previously selected tab.
c.tabs.select_on_remove = "next"
c.tabs.tabs_are_windows = False  # Open a new window for every tab.

# File Dialog
c.fileselect.handler = "external"
c.fileselect.folder.command = [
    "kitty",
    "--class=dialog",
    "-e",
    "lf",
    "--selection-path={}",
]
c.fileselect.multiple_files.command = [
    "kitty",
    "--class=dialog",
    "-e",
    "lf",
    "--selection-path={}",
]
c.fileselect.single_file.command = [
    "kitty",
    "--class=dialog",
    "-e",
    "lf",
    "--selection-path={}",
]

# AdBlock
c.content.blocking.enabled = True
# Adblock lists
c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2023.txt",
    "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt",
    "https://easylist.to/easylist/easylist.txt",
]
# Which method of blocking ads should be used.
#   - auto: Use Brave's ABP-style adblocker if available, host blocking otherwise
#   - adblock: Use Brave's ABP-style adblocker
#   - hosts: Use hosts blocking
#   - both: Use both hosts blocking and Brave's ABP-style adblocker
c.content.blocking.method = "both"

# Zoom
c.zoom.default = "100%"  # Default zoom level.
c.zoom.levels = [
    "25%",
    "33%",
    "50%",
    "67%",
    "75%",
    "90%",
    "100%",
    "110%",
    "120%",
    "130%",
    "150%",
    "175%",
    "200%",
    "250%",
    "300%",
    "400%",
    "500%",
]  # Available zoom levels.

# Search Egnines
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "ddg": "https://duckduckgo.com/?q={}",
    "google": "https://www.google.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "mk": "https://www.miltonandking.com/au/search/?q={}",
    "arch": "https://wiki.archlinux.org/title/{}",
}

# Which categories to show (in which order) in the :open completion., searchengines, quickmarks, bookmarks, history, filesystem
c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
    "filesystem",
]

# Sets default editor for the editor command
c.editor.command = [
    "alacritty",
    "-e",
    "nvim",
    "{file}",
    "-c",
    "normal {line}G{column0}1",
]

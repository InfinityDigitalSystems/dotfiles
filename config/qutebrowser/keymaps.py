def keymaps(config):
    # Default Commands
    # NOTE All default keymaps are enabled except "d" to close a tab ("D" to close a tab is still enabled) & tab navigation with "J"/"K" is disabled in favour of faster scrolling
    config.unbind("J")  # 'tab-next'
    config.unbind("K")  # 'tab-prev'
    config.unbind("d")  # 'tab-close'

    # Darkmode
    config.bind(
        "d",
        'config-cycle content.user_stylesheets ./stylesheets/apprentice-all-sites.css "./stylesheets/darkmode_fixes.css"',
    )

    # Scroll
    config.bind("J", "scroll-px 0 500")  # Increased scoll speed
    config.bind("K", "scroll-px 0 -500")  # Increased scoll speed

    # Zoom
    config.bind("<Ctrl-=>", "zoom-in")  # Zoom In
    config.bind("<Ctrl-->", "zoom-out")  # Zoom Out

    # Tab Navigation
    config.bind("<Alt-p>", "tab-next")  # Next Tab
    config.bind("<Alt-o>", "tab-prev")  # Previous Tab
    config.bind("<Ctrl-Tab>", "tab-next")  # Next Tab
    config.bind("<Ctrl-Shift-Tab>", "tab-prev")  # Previous Tab
    config.bind("<Alt-c>", "tab-close")  # Close tab
    config.bind("<Alt-n>", ":open -t")  # Close tab

    # Enter Passthrough mode
    config.bind("<Alt-v>", "mode-enter passthrough")

    # For synergy between qutebrowser and other browsers
    config.bind("<Alt-d>", "set-cmd-text -s :open")  # open open prompt

    # Open hints in rapid mode
    # open hints in rapid mode
    config.bind("<Alt-f>", "hint --rapid links tab-bg")

    # Open videos using mpv script
    config.bind(
        "xV", "spawn mpv {url}"
    )  # Open rapid hint to open video in custom mpv script

    # Open Current Pages in other browsers
    config.bind("xb", "spawn brave -d {url}")  # Open current tab in Brave
    config.bind("xf", "spawn -d firefox {url}")  # Open current tab in Firefox

    # Downloads
    config.bind("xdi", "hint images download")  # Open hint to download images
    config.bind(
        "xdv", "hint links spawn alacritty --class dialog -e yt-dlp {hint-url}"
    )  # Open hint to download video
    config.bind("xdp", "download")  # Open hint to download page

    # Bitwarden Keybinds
    config.bind("<Alt-b>", "spawn --userscript qute-bitwarden", mode="insert")
    config.bind("<Alt-b>", "spawn --userscript qute-bitwarden")

    # Bindings for insert mode
    config.bind(
        "<Alt-e>", "edit-text", mode="insert"
    )  # Open Text editor with contents of your current text box
    # Tab Navigation in Insert Mode
    config.bind("<Alt-p>", "tab-next", mode="insert")  # Next Tab
    config.bind("<Alt-o>", "tab-prev", mode="insert")  # Previous Tab
    config.bind("<Ctrl-Tab>", "tab-next", mode="insert")  # Next Tab
    config.bind("<Ctrl-Shift-Tab>", "tab-prev", mode="insert")  # Previous Tab
    config.bind("<Alt-c>", "tab-close", mode="insert")  # Close tab

    config.bind("<Alt-1>", "tab-focus 1", mode="insert")  # Focus tab 1
    config.bind("<Alt-2>", "tab-focus 2", mode="insert")  # Focus tab 2
    config.bind("<Alt-3>", "tab-focus 3", mode="insert")  # Focus tab 3
    config.bind("<Alt-4>", "tab-focus 4", mode="insert")  # Focus tab 4
    config.bind("<Alt-5>", "tab-focus 5", mode="insert")  # Focus tab 5
    config.bind("<Alt-6>", "tab-focus 6", mode="insert")  # Focus tab 6
    config.bind("<Alt-7>", "tab-focus 7", mode="insert")  # Focus tab 7
    config.bind("<Alt-8>", "tab-focus 8", mode="insert")  # Focus tab 8
    config.bind("<Alt-9>", "tab-focus -1", mode="insert")  # Focus tab last

    # Enter Passthrough in Insert Mode
    config.bind("<Alt-v>", "mode-enter passthrough", mode="insert")

    # Bindings for hint mode
    config.bind(
        "<Shift-F>", "hint all tab-bg", mode="hint"
    )  # Switch hint mode to open in new tab
    config.bind(
        "<Shift-r>", "hint --rapid links tab-bg", mode="hint"
    )  # Switch hint mode to rapid mode
    config.bind(
        "<Alt-r>", "hint --rapid links tab-bg", mode="hint"
    )  # Switch hint mode to rapid mode

    # Bindings for Passthrough
    config.bind("<Alt-Escape>", "mode-leave", mode="passthrough")
    config.bind("<Alt-v>", "mode-leave", mode="passthrough")
    config.bind("<Alt-p>", "tab-next", mode="passthrough")  # Next Tab
    config.bind("<Alt-o>", "tab-prev", mode="passthrough")  # Previous Tab
    config.bind("<Alt-c>", "tab-close", mode="passthrough")  # Close tab
    config.bind(
        "<Alt-d>", "set-cmd-text -s :open", mode="passthrough"
    )  # open open prompt
    config.bind("<Alt-1>", "tab-focus 1", mode="passthrough")  # Focus tab 1
    config.bind("<Alt-2>", "tab-focus 2", mode="passthrough")  # Focus tab 2
    config.bind("<Alt-3>", "tab-focus 3", mode="passthrough")  # Focus tab 3
    config.bind("<Alt-4>", "tab-focus 4", mode="passthrough")  # Focus tab 4
    config.bind("<Alt-5>", "tab-focus 5", mode="passthrough")  # Focus tab 5
    config.bind("<Alt-6>", "tab-focus 6", mode="passthrough")  # Focus tab 6
    config.bind("<Alt-7>", "tab-focus 7", mode="passthrough")  # Focus tab 7
    config.bind("<Alt-8>", "tab-focus 8", mode="passthrough")  # Focus tab 8
    config.bind("<Alt-9>", "tab-focus -1", mode="passthrough")  # Focus tab last

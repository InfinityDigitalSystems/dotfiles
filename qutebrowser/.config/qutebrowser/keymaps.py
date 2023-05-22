def keymaps(config):
    # Default Commands
    # NOTE All default keymaps are enabled except "d" to close a tab ("D" to close a tab is still enabled) & tab navigation with "J"/"K" is disabled in favour of faster scrolling
    config.unbind('J') # 'tab-next'
    config.unbind('K') # 'tab-prev'
    config.unbind('d') # 'tab-close'

    # Scroll
    config.bind('J', 'scroll-px 0 500') # Increased scoll speed
    config.bind('K', 'scroll-px 0 -500') # Increased scoll speed

    # Zoom
    config.bind('<Ctrl-=>', 'zoom-in') # Zoom In
    config.bind('<Ctrl-->', 'zoom-out') # Zoom Out

    # Tab Navigation
    config.bind('<Alt-p>', 'tab-next') # Next Tab
    config.bind('<Alt-o>', 'tab-prev') # Previous Tab
    config.bind('<Ctrl-Tab>', 'tab-next') # Next Tab
    config.bind('<Ctrl-Shift-Tab>', 'tab-prev') # Previous Tab
    config.bind('<Alt-c>', 'tab-close') # Close tab
    config.bind('<Alt-n>', ':open -t') # Close tab

    # Enter Passthrough mode
    config.bind('<Alt-v>', 'mode-enter passthrough')

    # For synergy between qutebrowser and other browsers 
    config.bind('<Alt-d>', 'set-cmd-text -s :open') # open open prompt
    
    # Open hints in rapid mode
    config.bind("<Alt-f>", 'hint --rapid links tab-bg') # open hints in rapid mode

    # Open videos using mpv script
    config.bind('xv', "hint links spawn mpv {hint-url} --ytdl-format=best") # Open hint to open video in custom mpv script
    config.bind('xc', "spawn mpv {url} --ytdl-format=best") # Open hint to open video in custom mpv script
    config.bind('xV', "hint --rapid links spawn mpv {hint-url} --ytdl-format=best") # Open rapid hint to open video in custom mpv script

    # Open Current Pages in other browsers
    config.bind('xb', "spawn brave {url}") # Open current tab in Brave
    config.bind('xf', "spawn firefox {url}") # Open current tab in Firefox
   
    # Downloads
    config.bind('xdi', "hint images download") # Open hint to download images
    config.bind('xdv', 'hint links spawn alacritty --class dialog -e yt-dlp {hint-url}') # Open hint to download video
    config.bind('xdp', 'download') # Open hint to download page
    
    # Bitwarden Keybinds
    config.bind('<Alt-b>', "spawn --userscript qute-bitwarden", mode="insert")
    config.bind('<Alt-b>', "spawn --userscript qute-bitwarden")
    
    # Bindings for insert mode
    config.bind('<Alt-e>', 'edit-text', mode='insert') # Open Text editor with contents of your current text box
    # Tab Navigation in Insert Mode
    config.bind('<Alt-p>', 'tab-next',mode="insert") # Next Tab
    config.bind('<Alt-o>', 'tab-prev', mode="insert") # Previous Tab
    config.bind('<Ctrl-Tab>', 'tab-next', mode="insert") # Next Tab
    config.bind('<Ctrl-Shift-Tab>', 'tab-prev', mode="insert") # Previous Tab
    config.bind('<Alt-c>', 'tab-close', mode="insert") # Close tab
    # Enter Passthrough in Insert Mode
    config.bind('<Alt-v>', 'mode-enter passthrough', mode="insert")

    # Bindings for hint mode
    config.bind('<Shift-F>', 'hint all tab-bg', mode='hint') # Switch hint mode to open in new tab
    config.bind('<Shift-r>', 'hint --rapid links tab-bg', mode='hint') # Switch hint mode to rapid mode
    config.bind('<Alt-r>', 'hint --rapid links tab-bg', mode='hint') # Switch hint mode to rapid mode

    # Bindings for Passthrough
    config.bind('<Alt-Escape>', 'mode-leave', mode='passthrough')
    config.bind('<Alt-v>', 'mode-leave', mode='passthrough')
    config.bind('<Alt-p>', 'tab-next', mode="passthrough") # Next Tab
    config.bind('<Alt-o>', 'tab-prev', mode="passthrough") # Previous Tab
    config.bind('<Alt-c>', 'tab-close', mode="passthrough") # Close tab
    config.bind('<Alt-d>', 'set-cmd-text -s :open', mode="passthrough") # open open prompt


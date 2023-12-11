from libqtile import hook
import os
import subprocess
import screens
import keymaps
import layouts_and_groups

# APP

search_script = os.path.expanduser("~/.config/qtile/scripts/find_file")
file_man = os.path.expanduser("~/.config/lf/lfrun")
apps = {
    "web_browser": "brave",
    "terminal": "alacritty",
    # Launches in a dropdown
    "file_manager": f"alacritty -T File\ Manager -e {file_man}",
    "calculator": "qalculate-gtk",  # launches in a dropdown
    "email": "thunderbird",
    "screenshot_software": "flameshot gui",
    "emoji_keyboard": "rofi -monitor -1 -show emoji -theme infinity-icon",
    "application_launcher": "rofi -show drun -monitor -1 -theme infinity-list",
    "task_switcher": "rofi -show window -monitor -1 -theme infinity-icon",
    "clipboard": "clipmenu",
    "find_file": f"alacritty -T File\ Finder -e {search_script}",
    "music_player": "spotify",  # Launches in a dropdown
    "password_manager": "bitwarden-desktop",  # Launches in a dropdown
    "editor": "alacritty -e nvim",
    "notes": "alacritty -T Notes --working-directory notes -e nvim",
}

colors = {
    "white": "#F8F8F2",
    "dark": "#202122",
    "darker": "#191A1A",
    "darkgrey": "#2E3032",
    "grey": "#5E6368",
    "blue": "#2494BA",
    "red": "#E84545",
    "magenta": "#C054BC",
    "green": "#5B9E2E",
}

bar_thickness = 23
font = "JetBrainsMono Nerd Font"
layout_margins = 9


widget_defaults = {
    "font": font,
    "fontsize": 12,
    "padding": 6,
    "background": f'{colors["darker"]}',
    "foreground": colors["white"],
}

# Boolean Variables
auto_fullscreen = True
bring_front_click = True
cursor_warp = False
focus_on_window_activation = "smart"
follow_mouse_focus = False
reconfigure_screens = True
# If you have issues with steam games not minimizing set this to true
auto_minimize = False
dgroups_key_binder = None
dgroups_app_rules = []
wmname = "Qtile"  # This is false this is just to help with java UI tookits

# Screens
screens = screens.generate_screens(bar_thickness, layout_margins, colors, font)

# Layouts & Groups
qtile_groups = layouts_and_groups.Groups()
groups = qtile_groups.get_groups(apps)
qtile_layouts = layouts_and_groups.Layouts(colors, layout_margins, font)
layouts = qtile_layouts.get_layouts()
floating_layout = qtile_layouts.get_floating_layout()

# Keymaps (edit under keymaps.py)
keybinds = keymaps.Keybinds()
keys = keybinds.generate_keybinds(apps, qtile_groups.groups)
mouse = keybinds.generate_mouse_keybinds()

# Autostart
# Runs the auto start script on system startup


@hook.subscribe.startup_once
def autostart():
    autostart = os.path.expanduser("~/.config/qtile/scripts/autostart")
    subprocess.call([autostart])

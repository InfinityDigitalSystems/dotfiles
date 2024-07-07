import os
import random
import subprocess

import keymaps
import layouts_and_groups
import widgets
from libqtile import bar, hook, qtile
from libqtile.config import Screen


def get_wallpaper(folder):
    all_files = os.listdir(folder)
    random_image = random.choice(all_files)
    random_image_path = os.path.join(folder, random_image)
    return random_image_path


search_script = os.path.expanduser("~/.config/qtile/scripts/find_file")
file_man = os.path.expanduser("~/.config/lf/lfrun")
desktopwallpapers = os.path.expanduser("~/.config/desktopwallpapers/")
apps = {
    "web_browser": "qutebrowser",
    "terminal": "alacritty -e tmux new-session -A -s tty",
    # Launches in a dropdown
    "file_manager": f"alacritty -T 'File Manager' -e tmux new-session -A -s files '{file_man}'",
    "calculator": "qalculate-gtk",  # launches in a dropdown "email": "thunderbird",
    "screenshot_software": "flameshot gui",
    "emoji_keyboard": "rofi -monitor -1 -show emoji -theme infinity-list",
    "application_launcher": "rofi -show drun -monitor -1 -theme infinity-list",
    "task_switcher": "rofi -show window -monitor -1 -theme infinity-list",
    "clipboard": "env CM_LAUNCHER='rofi' clipmenu",
    "find_file": f"alacritty -T File\ Finder -e {search_script}",
    "music_player": "spotify",  # Launches in a dropdown
    "password_manager": "bitwarden-desktop",  # Launches in a dropdown
    "notes": "alacritty -T Notes --working-directory notes -e nvim",
}

colors = {
    "black": "#101012",
    "dark4": "#1b1c1e",
    "dark3": "#232326",
    "dark2": "#2c2d31",
    "dark1": "#37383d",
    "grey2": "#5a5b5e",
    "grey1": "#818387",
    "grey0": "#a7aab0",
    "white": "#F8F8F2",
    "blue": "#57a5e5",
    "light_blue": "#68aee8",
    "light_yellow": "#DDC96F",
    "yellow": "#dbb671",
    "dark_yellow": "#7c5c20",
    "light_magenta": "#D185E0",
    "magenta": "#bb70d2",
    "dark_magenta": "#79428a",
    "green": "#8fb573",
    "dark_green": "#658e59",
    "orange": "#c49060",
    "cyan": "#48C5D6",
    "dark_cyan": "#37A8B7",
    "light_red": "#ED5A66",
    "red": "#de5d68",
    "dark_red": "#833b3b",
}

font = "JetBrainsMono Nerd Font Mono"


widget_defaults = {
    "font": font,
    "fontsize": 12,
    "padding": 6,
    "background": f'{colors["dark3"]}',
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
try:
    screen_count = int(os.environ["SCREENS"])
except KeyError:
    screen_count = 3
screens = []
screens.append(
    Screen(
        top=bar.Bar(widgets.Widgets(colors).get_widgets(), 23),
        wallpaper=get_wallpaper(desktopwallpapers),
        wallpaper_mode="fill",
    )
)
if screen_count > 1:
    for _ in range(screen_count - 1):
        screens.append(
            Screen(
                top=bar.Bar(widgets.Widgets(colors).get_secondary_widgets(), 23),
                wallpaper=get_wallpaper(desktopwallpapers),
                wallpaper_mode="fill",
            )
        )


# Layouts & Groups
qtile_groups = layouts_and_groups.Groups()
groups = qtile_groups.get_groups(apps)
qtile_layouts = layouts_and_groups.Layouts(colors, font)
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
    if qtile.core.name == "x11":
        autostart = os.path.expanduser("~/.config/qtile/scripts/autostart-x11")
    elif qtile.core.name == "wayland":
        autostart = os.path.expanduser("~/.config/qtile/scripts/autostart-wayland")
    subprocess.call([autostart])

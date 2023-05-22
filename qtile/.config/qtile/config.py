from libqtile import hook
import os
import subprocess
import screens
import keymaps
import layouts_and_groups


keys = keymaps.create_keybinds()
widget_defaults = screens.WIDGET_DEFAULTS
screens = screens.ScreenManager().screens()
layouts = layouts_and_groups.get_layouts()
groups = layouts_and_groups.get_groups()
floating_layout = layouts_and_groups.get_foating_layout()

# Boolean Variables
auto_fullscreen = True
bring_front_click = True
cursor_warp = True
focus_on_window_activation = "smart"
follow_mouse_focus = False
reconfigure_screens = True
# If you have issues with steam games not minimizing set this to true
auto_minimize = False
dgroups_key_binder = None
dgroups_app_rules = []
wmname = "LG3D"  # This is false this is just to help with java UI tookits


# Autostart
# Runs the auto start script on system startup
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


# Refresh system on screen change
@hook.subscribe.screen_change
def reload_screens(qtile):
    qtile.cmd_reload_config()
    home = os.path.expanduser("~/.config/qtile/refresh_system.sh")
    subprocess.call([home])

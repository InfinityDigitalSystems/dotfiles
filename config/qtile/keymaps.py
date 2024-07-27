import os

import plugins
from libqtile.config import Click, Drag, Key, KeyChord
from libqtile.lazy import lazy

# Modifer Key
MOD = "MOD4"  # mod4 = Super / Windows / Command

# Screens
screen_key = {0: 0, 1: 1, 2: 2}
# screen_key = {x: x for x in range(int(os.environ["SCREENS"]))}

try:
    screen_key[0] = int(os.environ["SCREEN_1"])
except KeyError:
    pass
try:
    screen_key[1] = int(os.environ["SCREEN_2"])
except KeyError:
    pass
try:
    screen_key[2] = int(os.environ["SCREEN_3"])
except KeyError:
    pass


def focus_screen(qtile, direction):
    current_screen = qtile.screens.index(qtile.current_screen)
    screens = [screen_key[key] for key in screen_key]
    screen_index = screens.index(current_screen)
    if direction == "left":
        screen_index -= 1
    elif direction == "right":
        screen_index += 1

    qtile.cmd_to_screen(screens[screen_index % len(screens)])


class Keybinds:
    def __init__(self):
        self.qtile_keybinds = [
            # Toggle Layouts
            Key([MOD], "c", lazy.next_layout(), desc="Cylces through the layouts"),
            Key([MOD], "b", lazy.function(plugins.relabel_group)),
            Key(
                [MOD],
                "Delete",
                lazy.spawn("light-locker-command -l"),
                desc="locks the system",
            ),
            Key([MOD], "f", lazy.window.toggle_floating(), desc="Toggles floating"),
            Key(
                [MOD],
                "t",
                lazy.function(plugins.float_to_front),
                desc="Brings all floating windows to the top",
            ),
            # Kill window
            Key([MOD, "control"], "c", lazy.window.kill(), desc="Kill focused window"),
            # QTILE options
            Key(
                [MOD, "control"],
                "r",
                lazy.function(plugins.refresh_system),
                desc="Restart Qtile",
            ),
            Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
            Key(
                [MOD],
                "m",
                lazy.function(plugins.toggle_max_layout),
                desc="Toggle Max Layout",
            ),
            Key(
                [MOD],
                "n",
                lazy.window.toggle_minimize(),
                desc="Toggle Minamize on current window",
            ),
        ]
        self.media_keybinds = [
            Key(
                [],
                "XF86AudioRaiseVolume",
                lazy.spawn("pulsemixer --change-volume +10"),
                desc="Increases Volume",
            ),
            Key(
                [],
                "XF86AudioLowerVolume",
                lazy.spawn("pulsemixer --change-volume -10"),
                desc="Decreases Volume",
            ),
            Key(
                [],
                "XF86AudioMute",
                lazy.spawn("pulsemixer --toggle_mute"),
                desc="Mutes Volume",
            ),
            Key(
                [],
                "XF86AudioPlay",
                lazy.spawn("mpris2controller PlayPause"),
                desc="Play/Pause player",
            ),
            Key(
                [],
                "XF86AudioNext",
                lazy.spawn("mpris2controller Next"),
                desc="Skip to next",
            ),
            Key(
                [],
                "XF86AudioPrev",
                lazy.spawn("mpris2controller Previous"),
                desc="Skip to Previous",
            ),
        ]
        self.function_keys = [
            Key(
                [],
                "XF86MonBrightnessUp",
                lazy.spawn("brightnessctl s +10%"),
                desc="Skip to next",
            ),
            Key(
                [],
                "XF86MonBrightnessDown",
                lazy.spawn("brightnessctl s 10%-"),
                desc="Skip to next",
            ),
        ]
        self.focus_switching_keybinds = [
            Key(
                [MOD],
                "up",
                lazy.function(plugins.traverse_up),
                desc="Shifts Focus up (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD],
                "down",
                lazy.function(plugins.traverse_down),
                desc="Shifts Focus down (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD],
                "left",
                lazy.function(plugins.traverse_left),
                desc="Shifts Focus left (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD],
                "right",
                lazy.function(plugins.traverse_right),
                desc="Shifts Focus right (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD, "shift"],
                "left",
                lazy.function(focus_screen, "left"),
                desc="Switches to next Screen",
            ),
            Key(
                [MOD, "shift"],
                "right",
                lazy.function(focus_screen, "right"),
                desc="Switches to previous Screen",
            ),
            Key(
                [MOD],
                "k",
                lazy.function(plugins.traverse_up),
                desc="Shifts Focus up (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD],
                "j",
                lazy.function(plugins.traverse_down),
                desc="Shifts Focus down (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD],
                "h",
                lazy.function(plugins.traverse_left),
                desc="Shifts Focus left (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD],
                "l",
                lazy.function(plugins.traverse_right),
                desc="Shifts Focus right (will shift screens if at end of current screen)",
            ),
            Key(
                [MOD, "shift"],
                "h",
                lazy.function(focus_screen, "left"),
                desc="Switches to next Screen",
            ),
            Key(
                [MOD, "shift"],
                "l",
                lazy.function(focus_screen, "right"),
                desc="Switches to previous Screen",
            ),
            Key(
                [MOD],
                "space",
                lazy.layout.previous(),
                desc="Move window focus to other window",
            ),
            Key(
                [MOD, "shift"],
                "space",
                lazy.layout.next(),
                desc="Move window focus to other window",
            ),
        ]

        self.window_manipulation = [
            Key(
                ["shift"],
                "r",
                lazy.layout.normalize(),
            ),
            # Resize Keys
            Key(
                ["shift"],
                "left",
                lazy.function(plugins.resize, "left"),
                desc="Grow window to the left",
            ),
            Key(
                ["shift"],
                "right",
                lazy.function(plugins.resize, "right"),
                desc="Grow window to the right",
            ),
            Key(
                ["shift"],
                "down",
                lazy.function(plugins.resize, "down"),
                desc="Grow window down",
            ),
            Key(
                ["shift"],
                "up",
                lazy.function(plugins.resize, "up"),
                desc="Grow window up",
            ),
            # Rearrange Windows
            Key(
                ["control"],
                "left",
                lazy.function(plugins.move, "left"),
                desc="Move window to the left",
            ),
            Key(
                ["control"],
                "right",
                lazy.function(plugins.move, "right"),
                desc="Move window to the right",
            ),
            Key(
                ["control"],
                "down",
                lazy.function(plugins.move, "down"),
                desc="Move window down",
            ),
            Key(
                ["control"],
                "up",
                lazy.function(plugins.move, "up"),
                desc="Move window up",
            ),
            Key(
                ["shift"],
                "h",
                lazy.function(plugins.resize, "left"),
                desc="Grow window to the left",
            ),
            Key(
                ["shift"],
                "l",
                lazy.function(plugins.resize, "right"),
                desc="Grow window to the right",
            ),
            Key(
                ["shift"],
                "j",
                lazy.function(plugins.resize, "down"),
                desc="Grow window down",
            ),
            Key(
                ["shift"],
                "k",
                lazy.function(plugins.resize, "up"),
                desc="Grow window up",
            ),
            # Rearrange Windows
            Key(
                ["control"],
                "h",
                lazy.function(plugins.move, "left"),
                desc="Move window to the left",
            ),
            Key(
                ["control"],
                "l",
                lazy.function(plugins.move, "right"),
                desc="Move window to the right",
            ),
            Key(
                ["control"],
                "j",
                lazy.function(plugins.move, "down"),
                desc="Move window down",
            ),
            Key(
                ["control"],
                "k",
                lazy.function(plugins.move, "up"),
                desc="Move window up",
            ),
        ]

    def generate_app_keybinds(self, apps):
        apps_keybinds = [
            KeyChord(
                [MOD],
                "x",
                [
                    Key([], "f", lazy.group["󱇚"].dropdown_toggle("file_manager")),
                    Key([], "c", lazy.group["󱇚"].dropdown_toggle("calculator")),
                    Key([], "m", lazy.group["󱇚"].dropdown_toggle("music_player")),
                    Key([], "p", lazy.group["󱇚"].dropdown_toggle("password_manager")),
                    Key([], "w", lazy.spawn(apps["web_browser"])),
                    Key([], "Return", lazy.spawn(apps["nterminal"])),
                    Key([], "e", lazy.spawn(apps["email"])),
                    Key([], "s", lazy.spawn(apps["screenshot_software"])),
                    Key([], "n", lazy.group["󱇚"].dropdown_toggle("notes")),
                    Key([], "b", lazy.group["󱇚"].dropdown_toggle("bluetooth")),
                    Key([], "v", lazy.group["󱇚"].dropdown_toggle("audio_mixer")),
                    Key(["shift"], "e", lazy.spawn(apps["emoji_keyboard"])),
                ],
                name="APP LAUNCH MODE",
            ),
            Key([MOD], "Return", lazy.group["󱇚"].dropdown_toggle("terminal")),
            # Key([MOD], "Space", lazy.group["󱇚"].hide_all()),
            Key([MOD], "d", lazy.spawn(apps["application_launcher"])),
            Key([MOD], "v", lazy.spawn(apps["clipboard"])),
            Key([MOD], "s", lazy.spawn(apps["find_file"])),
            Key([MOD], "Tab", lazy.spawn(apps["task_switcher"])),
        ]
        return apps_keybinds

    def gen_window_control_mode_keys(self):
        keys = self.window_manipulation + self.focus_switching_keybinds
        return [
            KeyChord(
                [MOD],
                "r",
                keys,
                mode=True,
                name="WINDOW CONTROL MODE",
            )
        ]

    def gen_group_keys(self, groups):
        group_keys = {
            "1": "1",
            "2": "2",
            "3": "3",
            "4": "4",
            "5": "5",
            "6": "6",
            "7": "7",
            "8": "8",
            "9": "9",
            "0": "0",
            "Q": "q",
            "W": "w",
            "E": "e",
        }

        group_keybinds = [
            # Allows switching left to right between groups
            Key(
                [MOD],
                "period",
                lazy.screen.next_group(skip_empty=True, skip_managed=True),
                desc="Go to the next group",
            ),
            Key(
                [MOD],
                "comma",
                lazy.screen.prev_group(skip_empty=True, skip_managed=True),
                desc="Go to the previous group",
            ),
        ]
        for grp in group_keys:
            group_keybinds.extend(
                [
                    Key([MOD], group_keys[grp], lazy.group[grp].toscreen(toggle=True)),
                    Key([MOD, "shift"], group_keys[grp], lazy.window.togroup(grp)),
                ]
            )
        return group_keybinds

    def generate_keybinds(self, apps, groups):
        keys = []
        keys.extend(self.gen_window_control_mode_keys())
        keys.extend(self.focus_switching_keybinds)
        keys.extend(self.media_keybinds)
        keys.extend(self.function_keys)
        keys.extend(self.qtile_keybinds)
        keys.extend(self.generate_app_keybinds(apps))
        keys.extend(self.gen_group_keys(groups))

        return keys

    def generate_mouse_keybinds(self):
        mouse_keybinds = [
            # Drag Floating layout
            Drag(
                [MOD],
                "Button1",
                lazy.window.set_position_floating(),
                start=lazy.window.get_position(),
            ),
            Drag(
                [MOD],
                "Button3",
                lazy.window.set_size_floating(),
                start=lazy.window.get_size(),
            ),
            Click([MOD], "Button2", lazy.window.bring_to_front()),
        ]

        return mouse_keybinds

from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy
import os


def generate_screens(bar_thickness, outside_margins, colors, font):
    try:
        screen_count = int(os.environ["SCREENS"])
    except KeyError:
        screen_count = 3

    screens = []
    primary = True  # Make the first screen have primary bar_layout
    for _ in range(screen_count):
        screens.append(
            WidgetsAndScreen(
                primary, colors, bar_thickness, outside_margins, font
            ).screen
        )
        primary = False  # Make following screens not primary

    return screens


class BarWidgets:
    def __init__(self, colors, font):
        self.colors = colors

        self.group_box_settings = {
            "fontsize": 13,
            # "font": "JetBrainsMono Nerd Font Mono Light",
            "highlight_method": "block",
            "this_current_screen_border": colors["blue"],
            "this_screen_border": colors["magenta"],
            "other_current_screen_border": colors["grey"],
            "other_screen_border": colors["grey"],
            "active": colors["white"],
            "block_highlight_text_color": colors["darker"],
            "disable_drag": False,
            "use_mouse_wheel": False,
            "inactive": colors["grey"],
            "rounded": False,
            "background": colors["darkgrey"],
            "margin_x": 0,
        }
        self.left_widgets = [
            # widget.WindowTabs(),
            # widget.WindowName(),
            widget.CurrentScreen(
                active_text="█",
                active_color=colors["blue"],
                inactive_text="█",
                inactive_color=colors["magenta"],
                fontsize=18,
                padding=0,
                margin=0,
            ),
            widget.TaskList(
                icon_size=17,
                max_title_width=400,
                highlight_method="block",
                borderwidth=0,
                margin=0,
                padding_x=8,
                padding_y=3,
                rounded=False,
                spacing=5,
                border=colors["darkgrey"],
                unfocused_border=colors["dark"],
            ),
            widget.Prompt(
                foreground=colors["darker"],
                cursor_color=colors["darker"],
                background=colors["green"],
                margin=8,
            ),
            widget.Chord(
                foreground=colors["darker"],
                background=colors["magenta"],
            ),
        ]
        self.center_widgets = [
            # widget.Spacer(bar.STRETCH),
            # widget.GroupBox(visible_groups=["1", "2", "3"], **self.group_box_settings),
            # widget.GroupBox(hide_unused = True, visible_groups=["4","5","6","7","8","9","0"],  **self.group_box_settings),
            # widget.GroupBox(visible_groups=["Q","W","E"],  **self.group_box_settings),
            widget.GroupBox(hide_unused=True, **self.group_box_settings),
            widget.Sep(
                foreground=colors["grey"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["darkgrey"],
            ),
        ]
        self.systray = [
            widget.StatusNotifier(
                icon_size=12, padding=8, background=colors["darkgrey"]
            ),
            widget.Spacer(8, background=colors["darkgrey"]),
            widget.Sep(
                foreground=colors["grey"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["darkgrey"],
            ),
        ]
        self.right_widgets = [
            widget.Spacer(5, background=colors["darkgrey"]),
            widget.Clock(
                format="󰃮 %a, %B %d",
                mouse_callbacks={
                    "Button1": lazy.group["󱇚"].dropdown_toggle("calendar")
                },
                background=colors["darkgrey"],
            ),
            widget.Sep(
                foreground=colors["grey"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["darkgrey"],
            ),
            widget.Clock(
                format="%I:%M%p",
                mouse_callbacks={
                    "Button1": lazy.group["󱇚"].dropdown_toggle("calendar")
                },
                background=colors["darkgrey"],
            ),
            widget.Sep(
                foreground=colors["grey"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["darkgrey"],
            ),
            widget.CurrentLayoutIcon(
                scale=0.5,
                foreground=colors["white"],
                padding=0,
                background=colors["darkgrey"],
            ),
            widget.Spacer(5, background=colors["darkgrey"]),
        ]

    def laptop_widgets(self):
        try:
            device_type = os.environ["DEVICE_TYPE"]
            # try:
            #     backlight = os.environ["BACKLIGHT"]
            # except KeyError:
            #     backlight= "acpi_video0"
        except KeyError:
            device_type = "PC"

        if device_type != "LAPTOP":
            return []
        else:
            return [
                # widget.Backlight(
                #     backlight_name=backlight,
                #     change_command="brightnessctl s {0}%",
                #     step=5,
                #     format="󰖨 {percent:2.0%}",
                # ),
                # widget.Sep(
                #     foreground=self.colors["darkgrey"],
                #     linewidth=2,
                #     size_percent=40,
                #     padding=4,
                # ),
                widget.BatteryIcon(
                    scale=1,
                    theme_path="~/.config/qtile/icons/",
                    background=self.colors["darkgrey"],
                ),
                widget.Battery(
                    battery=0,
                    show_short_text=False,
                    low_percentage=0.2,
                    format="{percent:2.0%}",
                    full_char="󰁹",
                    empty_char="󰁺",
                    charge_char="󰂏",
                    discharge_char="󰂌",
                    unknown_char="󰂑",
                    background=self.colors["darkgrey"],
                    mouse_callbacks={
                        "Button1": lazy.group["󱇚"].dropdown_toggle("power_manager")
                    },
                ),
                widget.Sep(
                    foreground=self.colors["grey"],
                    linewidth=2,
                    background=self.colors["darkgrey"],
                    size_percent=40,
                    padding=4,
                ),
            ]


class WidgetsAndScreen(BarWidgets):
    def __init__(self, primary, colors, bar_thickness, outside_margins, font):
        super().__init__(colors, font)
        if primary:
            bar_widgets = (
                self.left_widgets
                + self.center_widgets
                + self.systray
                + self.laptop_widgets()
                + self.right_widgets
            )
        else:
            bar_widgets = self.left_widgets + self.center_widgets + self.right_widgets

        self.screen = Screen(
            top=bar.Bar(
                bar_widgets,
                bar_thickness,
                # background="#00000000",
                margin=[0, 0, outside_margins, 0],
            ),
            bottom=bar.Gap(outside_margins),
            left=bar.Gap(outside_margins),
            right=bar.Gap(outside_margins),
        )

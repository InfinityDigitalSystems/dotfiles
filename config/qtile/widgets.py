from libqtile import widget
from libqtile.lazy import lazy
import os
import plugins


class Widgets:
    def __init__(self, colors):
        self.colors = colors
        self.left_widgets = [
            plugins.CurrentScreen(
                active_text=" ◉ ",
                active_color=colors["blue"],
                inactive_text=" ◉ ",
                foreground=colors["black"],
                inactive_color=colors["magenta"],
                fontsize=17,
                padding=0,
                margin=0,
                mouse_callbacks={
                    "Button1": lazy.spawn(
                        "rofi -show drun -monitor -1 -theme infinity-list"
                    )
                },
            ),
            widget.TaskList(
                icon_size=17,
                max_title_width=500,
                highlight_method="block",
                borderwidth=0,
                margin=0,
                padding_x=8,
                padding_y=4,
                rounded=False,
                spacing=8,
                border=colors["dark1"],
                unfocused_border=colors["dark3"],
                theme_mode="preferred"
                # theme_path
            ),
            widget.Prompt(
                foreground=colors["dark4"],
                cursor_color=colors["dark4"],
                background=colors["green"],
                margin=8,
            ),
            widget.Chord(
                foreground=colors["dark4"],
                background=colors["magenta"],
            ),
        ]
        self.center_widgets = [
            widget.GroupBox(
                fontsize=14,
                highlight_method="block",
                this_current_screen_border=colors["blue"],
                this_screen_border=colors["magenta"],
                other_current_screen_border=colors["grey1"],
                other_screen_border=colors["grey1"],
                active=colors["white"],
                block_highlight_text_color=colors["dark4"],
                disable_drag=False,
                use_mouse_wheel=False,
                inactive=colors["grey1"],
                rounded=False,
                background=colors["dark1"],
                margin_x=0,
                hide_unused=True),
        ]
        self.right_widgets = [
            widget.Spacer(5, background=colors["dark1"]),
            widget.Clock(
                timezone="US/Central",
                format="TX, %a %I:%M%p",
                mouse_callbacks={
                    "Button1": lazy.group["󱇚"].dropdown_toggle("calendar")
                },
                background=colors["dark1"],
            ),
            widget.Sep(
                foreground=colors["grey2"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["dark1"],
            ),
            widget.Clock(
                timezone="Europe/Amsterdam",
                format="NL, %a %I:%M%p",
                mouse_callbacks={
                    "Button1": lazy.group["󱇚"].dropdown_toggle("calendar")
                },
                background=colors["dark1"],
            ),
            widget.Sep(
                foreground=colors["grey2"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["dark1"],
            ),
            widget.Spacer(5, background=colors["dark1"]),
            widget.Clock(
                format="󰃮 %a, %B %d",
                mouse_callbacks={
                    "Button1": lazy.group["󱇚"].dropdown_toggle("calendar")
                },
                background=colors["dark1"],
            ),
            widget.Sep(
                foreground=colors["grey2"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["dark1"],
            ),
            widget.Clock(
                timezone="Australia/Brisbane",
                format="%I:%M%p",
                mouse_callbacks={
                    "Button1": lazy.group["󱇚"].dropdown_toggle("calendar")
                },
                background=colors["dark1"],
            ),
            widget.Sep(
                foreground=colors["grey2"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["dark1"],
            ),
            widget.Spacer(5, background=colors["dark1"]),
            widget.CurrentLayoutIcon(
                scale=0.5,
                foreground=colors["white"],
                padding=0,
                background=colors["dark1"],
            ),
            widget.Spacer(5, background=colors["dark1"]),
        ]

    def laptop_widgets(self):
        try:
            device_type = os.environ["DEVICE_TYPE"]
        except KeyError:
            device_type = "PC"

        if device_type != "LAPTOP":
            return []
        else:
            return [
                widget.Spacer(5, background=self.colors["dark1"]),
                widget.BatteryIcon(
                    scale=1.2,
                    theme_path="~/.config/qtile/icons/",
                    background=self.colors["dark1"],
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
                    background=self.colors["dark1"],
                    mouse_callbacks={
                        "Button1": lazy.group["󱇚"].dropdown_toggle("power_manager")
                    },
                ),
                widget.Sep(
                    foreground=self.colors["grey2"],
                    linewidth=2,
                    background=self.colors["dark1"],
                    size_percent=40,
                    padding=4,
                ),
            ]

    def get_widgets(self):
        return (
            self.left_widgets
            + self.center_widgets
            # + self.systray
            + self.laptop_widgets()
            + self.right_widgets
        )

    def get_secondary_widgets(self):
        return (
            self.left_widgets
            + self.center_widgets
            + self.right_widgets
        )

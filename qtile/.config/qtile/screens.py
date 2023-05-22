from libqtile import bar, widget, qtile
from libqtile.config import Screen
from libqtile.lazy import lazy
import os

BAR_THICKNESS = 28                                  # Thickness of the bar
MONITORS = 3                                       # Number of screens to setup
FONT = "JetBrainsMono Nerd Font Mono"               # QTILE FONT
MARGINS = 3
COLORS = {
    "white": "#F8F8F2",
    "dark": "#202122",
    "darker": "#191A1A",
    "darkgrey": "#3C3F41",
    "grey": "#5E6368",
    "blue": "#2494BA",
    "red": "#E84545",
    "magenta": "#C054BC",
    "green": "#5B9E2E",
}
# Bar Location "top" or "bottom"
BAR_LOCATION = "top"

WIDGET_DEFAULTS = {
    "font": FONT + " SemiBold",
    "fontsize": 12.5,
    "padding": 6,
    "background": COLORS["darker"],
    "foreground": COLORS["white"]
}


class Widgets:
    def __init__(self):
        self.clock_widget = [widget.Clock(format="%A, %B %d - %I:%M%p ")]

    def bar_widgets(self, bar_type):
        """
        :param bar_type: Type of bar needed primary or secondary
        :return: Returns a list of widgets
        """
        popup_widgets = [
            widget.Prompt(
                foreground=COLORS["darker"],
                cursor_color=COLORS["darker"],
                background=COLORS["green"],
                margin=8
            ),
            widget.Chord(
                foreground=COLORS["darker"],
                background=COLORS["magenta"],
            ),
        ]
        window_widgets = [
            widget.Spacer(3),
            widget.Image(filename="~/.config/qtile/sysfavcon.png", margin=6,
                         mouse_callbacks={"Button1": lazy.spawn("rofi -show drun")}),
            widget.Spacer(3),
            widget.CurrentScreen(
                active_color=COLORS["green"],
                inactive_color=COLORS["red"],
                active_text="",
                inactive_text=""
            ),
            widget.WindowName(font=FONT+" Bold", max_chars=48),
        ]

        navbar_widgets = [
            widget.GroupBox(
                font = FONT,
                fontsize=20,
                highlight_method="line",
                disable_drag=True,
                this_current_screen_border=COLORS["blue"],
                this_screen_border=COLORS["darkgrey"],
                other_current_screen_border=COLORS["white"],
                other_screen_border=COLORS["grey"],
                active=COLORS["white"],
                inactive=COLORS["darkgrey"],
                spacing =3,
                margin_y=4,
                padding_y=0,
                padding_x=5,
                hide_unused=False
            ),
            widget.Spacer(bar.STRETCH),
        ]
        laptop_widgets = [
            widget.Backlight(
               font=FONT,
               backlight_name="intel_backlight",
               change_command="light -S {0}",
               step=2.5,
               format="󰖨 {percent:2.0%}"
               ),
               widget.Sep(foreground=COLORS["darkgrey"], linewidth=2, size_percent=40, padding=4),
            widget.Battery(
                battery=0,
                show_short_text=False,
                low_percentage=0.3,
                format="{char} {percent:2.0%}",
                full_char='󰁹',
                empty_char='󰁺',
                charge_char='󰂄',
                discharge_char='󰁼',
                unknown_char='󰂑'
            ),
            widget.Sep(foreground=COLORS["darkgrey"], linewidth=2, size_percent=40, padding=4),
        ]
        infobar_widgets = [
            widget.WidgetBox(
                close_button_location="right",
                text_open="  ",
                text_closed="  ",
                widgets=[
                    widget.Systray(icon_size=18),
                    widget.Spacer(5),
                    widget.Sep(
                        foreground=COLORS["darkgrey"], linewidth=2, size_percent=40, padding=4),
                    widget.CPU(format="CPU: {load_percent}%"),
                    widget.Sep(
                        foreground=COLORS["darkgrey"], linewidth=2, size_percent=40, padding=4),
                    widget.Memory(
                        measure_mem="G",
                        format='MEM: {MemUsed: .0f}{mm} /{MemTotal: .0f}{mm}'
                    ),
                    widget.Sep(
                        foreground=COLORS["darkgrey"], linewidth=2, size_percent=40, padding=4),
                ]
            ),
            widget.Sep(foreground=COLORS["darkgrey"],
                       linewidth=2, size_percent=40, padding=4),
            widget.PulseVolume(
                font="JetBrainsMono Nerd Font",
                fmt="󱄠 {}",
                scroll_step=3,
                mouse_callbacks={
                    "Button1": lazy.group['󱇚'].dropdown_toggle("audio_control")},
            ),
            widget.Sep(foreground=COLORS["darkgrey"],
                       linewidth=2, size_percent=40, padding=4),
        ]
        layout_icon = [
            widget.CurrentLayoutIcon(
                scale=0.5, foreground=COLORS["white"], padding=0),
        ]
        try:
            device_type = os.environ["DEVICE_TYPE"] 
        except KeyError:
            device_type = "PC"

        if device_type == "LAPTOP" and bar_type == "primary":
            new_bar = popup_widgets + window_widgets + navbar_widgets + infobar_widgets + laptop_widgets + self.clock_widget + layout_icon
        elif bar_type == "primary":
            new_bar = popup_widgets + window_widgets + navbar_widgets + infobar_widgets + self.clock_widget + layout_icon
        else:
            new_bar = popup_widgets + window_widgets + navbar_widgets + self.clock_widget + layout_icon
        return new_bar


class ScreenManager(Widgets):
    def __init__(self):
        super().__init__()

    def screens(self):
        screens = []
        for x in range(MONITORS):
            if x == 0:
                bar_widgets = self.bar_widgets("primary")
            else:
                bar_widgets = self.bar_widgets("secondary")
            if BAR_LOCATION == "top":
                screens.append(Screen(
                    top=bar.Bar(bar_widgets, BAR_THICKNESS,
                                margin=[0, 0, MARGINS, 0]),
                    bottom=bar.Gap(MARGINS),
                  left=bar.Gap(MARGINS),
                    right=bar.Gap(MARGINS)
                ))
            else:
                screens.append(Screen(bottom=bar.Bar(bar_widgets, BAR_THICKNESS, margin=[0, MARGINS, 0, 0]),
                                      top=bar.Gap(MARGINS),
                                      left=bar.Gap(MARGINS),
                                      right=bar.Gap(MARGINS)
                                      ))
        return screens

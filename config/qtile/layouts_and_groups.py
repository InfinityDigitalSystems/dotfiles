from libqtile import layout
from libqtile.config import DropDown, Group, Match, ScratchPad


class Layouts:
    def __init__(self, colors, font):
        self.colors = colors
        self.font = font

    def get_layouts(self):
        layouts = [
            layout.Max(),
            layout.Columns(
                margin=0,
                margin_on_single=30,
                border_width=2,
                grow_amount=5,
                border_normal=self.colors["dark1"],
                border_focus=self.colors["blue"],
            ),
            layout.VerticalTile(
                margin=0,
                margin_on_single=30,
                border_width=2,
                grow_amount=5,
                border_normal=self.colors["dark1"],
                border_focus=self.colors["blue"],
            ),
            layout.Bsp(
                margin=0,
                margin_on_single=30,
                border_width=2,
                grow_amount=5,
                border_normal=self.colors["dark1"],
                border_focus=self.colors["blue"],
            ),
        ]
        return layouts

    def get_floating_layout(self):
        floating_layout = layout.Floating(
            border_width=4,
            border_normal=self.colors["dark1"],
            border_focus=self.colors["blue"],
            float_rules=[
                # Run the utility of `xprop` to see the wm class and name of an X client.
                *layout.Floating.default_float_rules,
                Match(wm_class="confirmreset"),  # gitk
                Match(wm_class="makebranch"),  # gitk
                Match(wm_class="maketag"),  # gitk
                Match(wm_class="ssh-askpass"),  # ssh-askpass
                Match(title="branchdialog"),  # gitk
                Match(title="pinentry"),  # GPG key password entry
                # Match(wm_class= "Qalculate-gtk"),
                # Match(title='Bitwarden'),
            ],
        )
        return floating_layout


class Groups:
    def __init__(self):
        self.groups = [
            Group("1", layout="columns"),
            Group("2", layout="columns"),
            Group("3", layout="columns"),
            Group("4", layout="columns"),
            Group("5", layout="columns"),
            Group("6", layout="columns"),
            Group("7", layout="columns"),
            Group("8", layout="columns"),
            Group("9", layout="columns"),
            Group("0", layout="verticalTile"),
            Group("Q", layout="columns"),
            Group("W", layout="columns"),
            Group("E", layout="columns", matches=[Match(wm_class="Mail")]),
        ]

    def get_dropdowns(self, apps):
        default_dropdown_settings = {
            "on_focus_lost_hide": True,
            "warp_pointer": True,
            "height": 0.8,
            "opacity": 0.95,
            "width": 0.8,
            "x": 0.1,
            "y": 0.1,
        }

        dropdowns = [
            # System dropdowns
            DropDown(
                "bluetooth",
                "blueman-manager",
                **default_dropdown_settings,
            ),
            DropDown(
                "audio_mixer",
                "pavucontrol",
                **default_dropdown_settings,
            ),
            DropDown(
                "power_manager",
                "alacritty -e bash -c 'sudo powertop; exec bash'",
                **default_dropdown_settings,
            ),
            DropDown(
                "calendar",
                "alacritty -e bash -c 'clear; cal -3; exec bash'",
                **default_dropdown_settings,
            ),
            # User Apps
            DropDown("terminal", f'{apps["terminal"]}', **default_dropdown_settings),
            DropDown(
                "file_manager",
                apps["file_manager"],
                opacity=1.00,
                height=0.8,
                width=0.8,
                x=0.1,
                y=0.1,
            ),
            DropDown(
                "calculator",
                apps["calculator"],
                opacity=0.6,
                height=0.2,
                width=0.3,
                x=0.35,
                y=0.0,
            ),
            DropDown("music_player", apps["music_player"], **default_dropdown_settings),
            DropDown(
                "notes",
                apps["notes"],
                opacity=1.0,
                height=0.8,
                width=0.7,
                x=0.15,
                y=0.1,
            ),
            DropDown(
                "password_manager",
                apps["password_manager"],
                **default_dropdown_settings,
            ),
        ]
        return dropdowns

    def get_groups(self, apps):
        scratchpad = [ScratchPad("󱇚", self.get_dropdowns(apps), single=False)]
        return self.groups + scratchpad

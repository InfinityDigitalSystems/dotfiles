from libqtile import layout
from libqtile.config import Group, ScratchPad, DropDown, Match
from screens import COLORS, MARGINS

# Edit layout margin setting from the screens.py file


def get_layouts():
    layouts = [
        layout.Max(margin=-MARGINS),
        layout.Columns(
            margin=MARGINS,
            margin_on_single=MARGINS * 5,
            fair=False,
            border_width=3,
            grow_amount=5,
            border_normal=COLORS["darkgrey"],
            border_focus=COLORS["blue"],
        ),
        # layout.Bsp(
        #     margin=MARGINS,
        #     margin_on_single=MARGINS*5,
        #     fair=False,
        #     border_width=3,
        #     grow_amount=5,
        #     border_normal=COLORS["darkgrey"],
        #     border_focus=COLORS["blue"]
        # ),
    ]
    return layouts


def get_foating_layout():
    fl = layout.Floating(
        border_width=3,
        border_normal=COLORS["darkgrey"],
        border_focus=COLORS["blue"],
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
    return fl


SCRATCHPADS = []

default_scratch_pad_settings = {
    "on_focus_last_hide": True,
    "warp_pointer": True,
    "height": 0.7,
    "opacity": 0.85,
    "width": 0.65,
    "x": 0.175,
    "y": 0.15,
}


def generate_scratchpads(apps):
    dropdowns = []
    for app in apps:
        options = dict(default_scratch_pad_settings)
        if "dropdown_options" in apps[app]:
            for option in apps[app]["dropdown_options"]:
                options[option] = apps[app]["dropdown_options"][option]

        dropdowns.append(DropDown(app, apps[app]["name"], **options))

    global SCRATCHPADS
    SCRATCHPADS.append(ScratchPad("󱇚", dropdowns=dropdowns, single=True))


def get_groups():
    groups = [
        Group("󰎦", layout="columns"),
        Group("󰎩", layout="columns"),
        Group("󰎬", layout="columns"),
        Group("󰾔", layout="columns"),
        Group(
            "",
            layout="columns",
            matches=[Match(wm_class="vscodium"), Match(wm_class="emacs")],
        ),
        Group("󰴃", layout="columns", matches=[Match(wm_class="Mail")]),
        # Group(
        #     "",
        #     layout="columns",
        #     matches=[Match(wm_class="signal"), Match(wm_class="discord")],
        # ),
        Group("󰐋", layout="columns"),
    ]
    #
#󰌴󰄸󰌳󰆁󰻩󰡠󰪷󰻧󰾔󰚇
    return groups + SCRATCHPADS

from libqtile.config import Screen
import os
from libqtile.config import Key
from libqtile.lazy import lazy
import subprocess


from libqtile import bar, hook
from libqtile.widget import base


class CurrentScreen(base._TextBox):
    """
    Custom modification of the current screen widget that changes the 
    colour of the background instead of the foreground

    Indicates whether the screen this widget is on is currently active or not
    """

    defaults = [
        ("active_text", "A", "Text displayed when the screen is active"),
        ("inactive_text", "I", "Text displayed when the screen is inactive"),
        ("active_color", "00ff00", "Color when screen is active"),
        ("inactive_color", "ff0000", "Color when screen is inactive"),
    ]

    def __init__(self, width=bar.CALCULATED, **config):
        base._TextBox.__init__(self, "", width, **config)
        self.add_defaults(CurrentScreen.defaults)

    def _configure(self, qtile, bar):
        base._TextBox._configure(self, qtile, bar)
        hook.subscribe.current_screen_change(self.update_text)
        self.update_text()

    def update_text(self):
        if self.qtile.current_screen == self.bar.screen:
            self.background = self.active_color
            self.update(self.active_text)
        else:
            self.background = self.inactive_color
            self.update(self.inactive_text)


def refresh_system(qtile):
    qtile.cmd_reload_config()
    lazy.spawn("autorandr --change")


def float_to_front(qtile):
    """
    Bring all floating windows of the group to front
    """
    for window in qtile.current_group.windows:
        if window.floating:
            window.cmd_bring_to_front()


def relabel_group(qtile):
    cur_group = qtile.current_group

    def callback(text):
        cur_group.cmd_set_label(f"{cur_group.name}:{text.upper()}")

    prompt = qtile.widgets_map["prompt"]
    cur_group.cmd_set_label(cur_group.name)
    prompt.start_input("Group Label", callback)


def toggle_max_layout(qtile, layout="columns"):
    """
    Toggles between the first and second layout configured
    Args:
        layout: (default = "columns") the layout to toggle betwen with max
    """
    current_layout = qtile.current_layout.info()["name"]
    if current_layout == "max":
        qtile.current_group.cmd_setlayout(layout)
    else:
        qtile.current_group.cmd_setlayout("max")


"""
This plugin exports 2 functions - resize and move.

-- resize --
Resize floating windows & changes bsp resize behaiver to act more like columns
(if window is not floating & layout not bsp falls back to standard layout resize)

Floating resize controls
down key grows window vertically
Up key shrinks window verically
right key grows window horizontally
left key shrinks window horizontally

Args:
    direction: "left", "right", "up", "down"
    (optional) floating_grow_amount: amount to grow floating windows by (defaults to 50)

Example usage:

    import resize_move_floating_windows.py

    keys.extend([
        Key([mod, "control"], 'k', lazy.function(resize_move_floating_windows.resize("up")),
        Key([mod, "control"], 'j', lazy.function(resize_move_floating_windows.resize("down")),
        Key([mod, "control"], 'h', lazy.function(resize_move_floating_windows.resize("left")),
        Key([mod, "control"], 'l', lazy.function(resize_move_floating_windows.resize("right")),
    ])

--move--
Move floating windows (if window is not floating falls back to standard layout shuffle)
                                                                                        
Args:
    direction: "left", "right", "up", "down"
    (optional) floating_move_amount: amount to move floating windows by (defaults to 50)

Example usage:

    import resize_move_floating_windows.py

    keys.extend([
        Key([mod, "shift"], 'k', lazy.function(resize_move_floating_windows.move("up")),
        Key([mod, "shift"], 'j', lazy.function(resize_move_floating_windows.move("down")),
        Key([mod, "shift"], 'h', lazy.function(resize_move_floating_windows.move("left")),
        Key([mod, "shift"], 'l', lazy.function(resize_move_floating_windows.move("right")),
    ])
"""


def resize(qtile, direction, floating_grow_amount=50):
    """
    Resize floating windows & changes bsp resize behaiver to act more like columns
    (if window is not floating & layout not bsp falls back to standard layout resize)

    Floating resize controls
    down key grows window vertically
    Up key shrinks window verically
    right key grows window horizontally
    left key shrinks window horizontally

    Args:
        direction: "left", "right", "up", "down"
        (optional) floating_grow_amount: amount to grow floating windows by (defaults to 50)

    Example usage:

        import resize_move_floating_windows.py

        keys.extend([
            Key([mod, "control"], 'k', lazy.function(resize_move_floating_windows.resize("up")),
            Key([mod, "control"], 'j', lazy.function(resize_move_floating_windows.resize("down")),
            Key([mod, "control"], 'h', lazy.function(resize_move_floating_windows.resize("left")),
            Key([mod, "control"], 'l', lazy.function(resize_move_floating_windows.resize("right")),
        ])
    """

    def resize_floating():
        if direction == "down":
            window.cmd_resize_floating(0, int(floating_grow_amount))
        elif direction == "right":
            window.cmd_resize_floating(int(floating_grow_amount), 0)
            window.cmd_move_floating(-int(floating_grow_amount / 2), 0)
        elif direction == "up":
            window.cmd_resize_floating(0, -int(floating_grow_amount))
        elif direction == "left":
            window.cmd_resize_floating(-int(floating_grow_amount), 0)
            window.cmd_move_floating(int(floating_grow_amount / 2), 0)
            window.cmd_is_visible()

    def resize_bsp():
        layout = qtile.current_layout
        child = layout.current
        parent = child.parent
        while parent:
            if child in parent.children:
                layout_all = False

                if (direction == "left" and parent.split_horizontal) or (
                    direction == "up" and not parent.split_horizontal
                ):
                    parent.split_ratio = max(
                        5, parent.split_ratio - layout.grow_amount)
                    layout_all = True
                elif (direction == "right" and parent.split_horizontal) or (
                    direction == "down" and not parent.split_horizontal
                ):
                    parent.split_ratio = min(
                        95, parent.split_ratio + layout.grow_amount
                    )
                    layout_all = True
                if layout_all:
                    layout.group.layout_all()
                    break
            child = parent
            parent = child.parent

    window = qtile.current_window
    current_layout = qtile.current_layout.info()["name"]
    if window.floating:
        resize_floating()

    elif current_layout == "bsp":
        resize_bsp()

    else:  # Standard layout resize
        grow_layout = {
            "up": qtile.current_layout.cmd_grow_up,
            "right": qtile.current_layout.cmd_grow_right,
            "down": qtile.current_layout.cmd_grow_down,
            "left": qtile.current_layout.cmd_grow_left,
        }
        grow_layout[direction]()


def move(qtile, direction, floating_move_amount=50):
    """
    Move floating windows (if window is not floating falls back to standard layout shuffle)

    Args:
        direction: "left", "right", "up", "down"
        (optional) floating_move_amount: amount to move floating windows by (defaults to 50)

    Example usage:

        import resize_move_floating_windows.py

        keys.extend([
            Key([mod, "shift"], 'k', lazy.function(resize_move_floating_windows.move("up")),
            Key([mod, "shift"], 'j', lazy.function(resize_move_floating_windows.move("down")),
            Key([mod, "shift"], 'h', lazy.function(resize_move_floating_windows.move("left")),
            Key([mod, "shift"], 'l', lazy.function(resize_move_floating_windows.move("right")),
        ])
    """
    window = qtile.current_window
    if window.floating:
        # Moves floating windows
        if direction == "down":
            window.cmd_move_floating(0, floating_move_amount)
        elif direction == "right":
            window.cmd_move_floating(floating_move_amount, 0)
        elif direction == "up":
            window.cmd_move_floating(0, -floating_move_amount)
        elif direction == "left":
            window.cmd_move_floating(-floating_move_amount, 0)
    else:
        move_layout = {
            "up": qtile.current_layout.cmd_shuffle_up,
            "right": qtile.current_layout.cmd_shuffle_right,
            "down": qtile.current_layout.cmd_shuffle_down,
            "left": qtile.current_layout.cmd_shuffle_left,
        }
        move_layout[direction]()


"""
This plugin exports four functions - up, down, left and right - that when called will
move window focus to the first window in that general direction. Focussing is based
entirely on position and geometry, so is independent of screens, layouts and whether
windows are floating or tiled. It can also move focus to and from empty screens.

Example usage:

    import plugins

    keys.extend([
        Key([mod], 'k', lazy.function(plugins.traverse_up)),
        Key([mod], 'j', lazy.function(plugins.traverse_down)),
        Key([mod], 'h', lazy.function(plugins.traverse_left)),
        Key([mod], 'l', lazy.function(plugins.traverse_right)),
    ])

Qtile versions known to work: 0.16 - 0.18
"""


def traverse_up(qtile):
    _focus_window(qtile, -1, "y")


def traverse_down(qtile):
    _focus_window(qtile, 1, "y")


def traverse_left(qtile):
    _focus_window(qtile, -1, "x")


def traverse_right(qtile):
    _focus_window(qtile, 1, "x")


def _focus_window(qtile, dir, axis):
    win = None
    win_wide = None
    dist = 10000
    dist_wide = 10000
    cur = qtile.current_window
    if not cur:
        cur = qtile.current_screen

    if axis == "x":
        dim = "width"
        band_axis = "y"
        band_dim = "height"
        cur_pos = cur.x
        band_min = cur.y
        band_max = cur.y + cur.height
    else:
        dim = "height"
        band_axis = "x"
        band_dim = "width"
        band_min = cur.x
        cur_pos = cur.y
        band_max = cur.x + cur.width

    cur_pos += getattr(cur, dim) / 2

    windows = [w for g in qtile.groups if g.screen for w in g.windows]
    windows.extend([s for s in qtile.screens if not s.group.windows])

    if cur in windows:
        windows.remove(cur)

    for w in windows:
        if isinstance(w, Screen) or not w.minimized and w.cmd_is_visible():
            pos = getattr(w, axis) + getattr(w, dim) / 2
            gap = dir * (pos - cur_pos)
            if gap > 5:
                band_pos = getattr(w, band_axis) + getattr(w, band_dim) / 2
                if band_min < band_pos < band_max:
                    if gap < dist:
                        dist = gap
                        win = w
                else:
                    if gap < dist_wide:
                        dist_wide = gap
                        win_wide = w

    if not win:
        win = win_wide
    if win:
        qtile.focus_screen(win.group.screen.index)
        win.group.focus(win, True)
        if not isinstance(win, Screen):
            win.focus(False)

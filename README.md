## Installing

You will need `git` and GNU `stow`

Clone into your `$HOME` directory or `~`

```bash
git clone https://github.com/captainblue01/dotfiles ~
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README)
```

> You will need to `chmod +x` any shells scripts for full functionality
```bash
chmod +x ~/.config/qtile/autostart.sh
chmod +x ~/.config/qtile/refresh_system.sh.sh
chmod +x ~/.config/lf/lf_kitty_clean
chmod +x ~/.config/lf/lf_kitty_preview
```


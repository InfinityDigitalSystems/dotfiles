![lf](https://imgur.com/TxcWlQQ.png)
# Features
- Previews using [lfimg](https://github.com/thimc/lfimg/tree/master) 
- LF CD on exit

# TODO
- add a yank name option for lf
- add a yank path option for lf https://github.com/gokcehan/lf/wiki/Tips#yank-paths-into-your-clipboard
- enhance renaming https://github.com/gokcehan/lf/wiki/Tips#enhancing-the-rename-command
- add searchable bookmarks to lf https://github.com/gokcehan/lf/wiki/Tips#searchable-bookmarks
- add git status indicators

# Dependencies
- glib2 
- findutils
- fzf
- cp-p

## lfimg Dependencies
- glow
- ffmpegthumbnailer
- imagemagick
- epub-thumbnailer
- wkhtmltopdf
- bat (optional - color highlight for text files)
- chafa (optional - for image preview over SSH or inside Wayland session)
- unzip (optional - for .zip and .jar files)
- 7z (optional - for .7z files)
- unrar (optional - for .rar files)
- catdoc (optional - for .doc files)
- docx2txt (optional - for .docx files)
- odt2txt (optional - for .odt and *.ods files)
- gnumeric (optional - for .xls and .xlsx files)
- exiftool (optional - for music files)
- iso-info (optional - for .iso files)
- transmission (optional - for .torrent files)
- mcomix (optional - for .cbz and .cbr files)

# Built in `go-to` locations
- **gd** `cd ~/Downloads`
- **gn** `cd ~/notes`
- **g/** `cd /`
- **gh** `cd ~`
- **gi** `cd ~/nextcloud/`
- **gc** `cd ~/.config`
- **gt** `cd ~/.local/share/Trash/files`
- **gr** `cd ~/repos/`
- **gm** `cd /run/media/`

# Keymaps
- **`<CR>`** open
- **cc** clear
- **uu** unselect
- **yy** copy
- **pp** paste
- **pl** link
- **dd** cut
- **dD** delete
- **dt** trash
- **dT** trash
- **D** trash
- **xg** $lazygit
- **ad** :push %mkdir<space>-p<space>
- **af** :push %touch<space>
- **r** reload
- **f** fzf_jump
- **o** push :open-with-gui<space> ## input application
- **o** push :open-with-cli<space> ## input application
- **H** fzf jump_prev
- **L** fzf jump_next

# Installation
- Install all required packages
- Ensure `cleaner`, `lfcd`, `lfpp`, `preview` have execution permissions
- add the following snipped to your bashrc to enable cd on exit
  ```bash
    # change working directory after leaving lf
    LFCD="$HOME/.config/lf/lfcd"
    if [ -f "$LFCD" ]; then
        source "$LFCD"
    fi
    alias lf='lfcd'
  ```
- If you do not desire CD on exit behaiver simply add the `lfpp` file to your path and excute that instead.


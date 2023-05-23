# IDS QUTEBROWSER CONFIG

![](https://i.imgur.com/wdroZeY.png)  

## Dependencies
> Below install commands are asuming you are running arch and have pip installed
 - **adblock** `pip install adblock`
 - **JetBrainsMono Nerd Font** `sudo pacman -S ttf-jetbrains-mono-nerd`
 - **Neovim/nvim** `sudo pacman -S neovim`
 - **lf** `sudo pacman -S lf`
 - **yt-dlp** `sudo pacman -S yt-dlp`

### Terminals
> I use both Kitty and Alacritty I prefer kitty for file management with lf because of image previews, But prefer alacritty for most other uses.
> Easy to change terminal settings under config.py
 - **Alacritty** `sudo pacman -S alacritty`
 - **Kitty** `sudo pacman -S kitty`
### Bitwarden integration
>WARNING: The login details are viewable as plaintext in qutebrowser's debug log (qute://log) and might be shared if you decide to submit a crash report!
>You need to sign into bitwarden cli before using
This config comes with the "qute-bitwarden" userscript and has the following Dependencies
- **tldextract** `pip install tldextract`
- **pyperclip** `pip install pyperclip`(optional Python module, used for TOTP codes)
- **bitwarden-cli** `sudo pacman -S bitwarden-cli`
### DRM Content
- **chromium-widevine** `yay -S chromium-widevine`

## Keymaps
> Default Keybinds
![](https://raw.githubusercontent.com/qutebrowser/qutebrowser/master/doc/img/cheatsheet-big.png)

### Custom Keymaps
#### Bindings for normal mode
##### Darkmode
- **d** _Toggle Darkmode StyleSheet_
##### Scroll
- **J** _Scroll Up 500 pixels_
- **K** _Scroll Down 500 pixels_
##### Zoom
- **\<Ctrl-+>** _Zoom In_
- **\<Ctrl-->** _Zoom Out_
##### Tab Navigation
- **\<Alt-p>** _Next Tab_
- **\<Alt-o>** _Previous Tab_
- **\<Ctrl-Tab>** _Next Tab_
- **\<Ctrl-Shift-Tab>** _Previous Tab_
- **\<Alt-c>** _Close Tab_
##### For synergy between qutebrowser and other browsers 
- **\<Alt-d>** _Open the open prompt_
##### Open hints in rapid mode
- **\<Alt-f>** _Open Hints in Rapid Mode_
##### Open videos using mpv script
- **xv** _Open hint to open custom mpv script_
- **xV** _Open hint in rapid mode to open custom mpv script_
- **xc** _Open custom mpv script_
##### Open Current Pages in other browsers
- **xb** _Open current tab in Brave_
- **xf** _Open current tab in Firefox_
##### Downloads
- **\xdi** _Open hint to download Images_ 
- **\xdv** _Open hint to download Videos_ 
- **\xdp** _Open hint to download Page_ 
#### Enter Pass through mode
- **\<Alt-v>**  _Switch to Passthrough mode_

#### Bindings for insert mode
- **\<Alt-e>** _Open Text editor with the contetns of current text box_ 
##### Tab Navigation for insert mode
- **\<Alt-p>** _Next Tab_
- **\<Alt-o>** _Previous Tab_
- **\<Ctrl-Tab>** _Next Tab_
- **\<Ctrl-Shift-Tab>** _Previous Tab_

#### Bindings for hint mode
- **\<Shift-F>** _Switch hint mode to open in new tab_
- **\<Shift-r>** _Switch hint mode to rapid mode_
- **\<Alt-r>**  _Switch hint mode to rapid mode_

## Tips & Tricks
### Clipboard
>You can :set content.javascript.clipboard access to allow this globally (not recommended!), or :set -u some.domain content.javascript.clipboard access if you want to limit the setting to some.domain.

## Links
- https://qutebrowser.org/doc/faq.html
- https://qutebrowser.org/doc/help/configuring.html
- https://qutebrowser.org/doc/help/settings.html

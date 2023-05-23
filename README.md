> These are my personal dotfiles that I use across my machines I tried to keep everything simple to customise.

> Some of more notable configs are `Qtile`, `Qutebrowser`, `Neovim`, `lf`

## Installation

> Assumes Arch

- run `./arch_package_sync.sh` to install all dependencies plus core utils
- copy contents from `./config` to `~/.config`
- copy bashrc and xconfigs from `./other` to home directory (`~`)
- move the `./scripts` directory to where ever you keep your scripts (make sure it's in your path) 

  > I normally add to `~/.local/bin/` & I have this snipped in my .bashrc (avalible in this repo under ./home/.bashrc) (avalible in this repo under `./home/.bashrc`)
  >
  > ```bash
  >  # set PATH so it includes user's private ~/.local/bin if it exists
  >  if [ -d "$HOME/.local/bin" ] ; then
  >      PATH="$HOME/.local/bin:$PATH"
  >  fi
  > ```

## Screenshots

![qtile](https://i.imgur.com/CorPYfL.png) 
![lf](https://i.imgur.com/mJbSLGT.png) 
![Qutebrowser](https://i.imgur.com/wdroZeY.png)  
![neovim](https://i.imgur.com/Rd4OgU9.png) 

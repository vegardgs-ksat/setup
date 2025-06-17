# Setup new computer


## Prereq: Ubuntu

- apt install
  * build-essential
  * pkg-config
  * libfontconfig1-dev
  * libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
  
## Software

- Install homebrew
  * Mac only
- Install rustup through rustup.rs
- Install rust programs through cargo install
  * alacritty
    * Must also install desktop-entry manually - see github repo source
  * jless
  * ripgrep
  * xh
  * exa
  * dua
  * erdtree
  * zellij
  * starship
- Install zsh
  * Ubuntu: sudo apt install zsh
    - Remember to change default shell: chsh
- Install helix: https://docs.helix-editor.com/install.html#installing-helix
  * MacOS: brew install helix
  * Ubuntu/Debian:
    ```
    sudo add-apt-repository ppa:maveonair/helix-editor
    sudo apt update
    sudp apt install helix
    ```
- Install markman (helix LSP)
  * MacOs: brew install markman
  * snap: sudo snap install marksman
- Install dprint (helix formatter)
  * MacOs: brew install dprint
  * cargo: cargo install --locked dprint
- Install dbeaver
  * snap: sudo snap install dbeaver-ce

## MacOS

- Install karabiner-elementers
  - install config
- Install Rectangle
  - install config
  (config must be manually imported/exported...)

- Copy the `macos.DefaultKeyBinding.dict` to `$HOME/Library/KeyBindings/DefaultKeyBinding.dict`

# Configure 

- General: install from repository root
```
ln -fs $(pwd)/dot.zshrc ~/.zshrc
ln -fs $(pwd)/dot.starship.toml ~/.starship.toml
ln -fs $(pwd)/dot.alacritty.toml ~/.alacritty.toml
ln -fs $(pwd)/dot.gitconfig ~/.gitconfig
ln -fs $(pwd)/cargo.config.toml ~/.cargo/config.toml
ln -fs $(pwd)/config.zellij.config.kdl ~/.config/zellij/config.kdl
ln -fs $(pwd)/config.karabiner.karabiner.json ~/.config/karabiner/karabiner.json
ln -fs $(pwd)/config.helix.config.toml ~/.config/helix/config.toml
ln -fs $(pwd)/config.helix.languages.toml ~/.config/helix/languages.toml
ln -fs $(pwd)/dot.dprint.json ~/.dprint.json
```

# Setup new computer

- Install homebrew
  * Mac only
- Install rustup through rustup.rs
- Install rust programs through cargo install
  * alacritty
  * jless
  * ripgrep
  * xh
  * exa
  * dua
  * erdtree
  * zellij
- Install helix: https://docs.helix-editor.com/install.html#installing-helix
  * MacOS: brew install helix

## MacOS

- Install karabiner-elementers
  - install config
- Install Rectangle
  - install config
  (config must be manually imported/exported...)

- Copy the `macos.DefaultKeyBinding.dict` to `$HOME/Library/KeyBindings/DefaultKeyBinding.dict`

# Configure 

- General: install from repository root
  * `ln -fs $(pwd)/dot.zshrc ~/.zshrc`  
  * `ln -fs $(pwd)/dot.alacritty.toml ~/.alacritty.toml`  
  * `ln -fs $(pwd)/dot.gitconfig ~/.gitconfig`  
  * `ln -fs $(pwd)/cargo.config.toml ~/.cargo/config.toml`  
  * `ln -fs $(pwd)/config.zellij.config.kdl ~/.config/zellij/config.kdl`  
  * `ln -fs $(pwd)/config.karabiner.karabiner.json ~/.config/karabiner/karabiner.json`  
  * `ln -fs $(pwd)/config.helix.config.json ~/.config/helix/config.json`  
  * `ln -fs $(pwd)/config.helix.languages.toml ~/.config/helix/languages.toml`  

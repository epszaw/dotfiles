# `.dotfiles`

Install dependencies:

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install tree-sitter-cli ripgrep
brew install fzf
```

Copy the repository or single file and create sylinks for each config type you want:

```shell
cd ~
git clone https://github.com/lamartire/dotfiles
cd ~/.config
ln -s ~/dotfiles/.configs/nvim .
```

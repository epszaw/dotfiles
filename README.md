# `.dotfiles`

Install dependencies:

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Copy the repository or single file and create sylinks for each config type you want:

```shell
cd ~
git clone https://github.com/lamartire/dotfiles
cd ~/.config
ln -s ~/dotfiles/.configs/nvim .
```

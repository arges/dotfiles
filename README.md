# dotfiles

Tested on:
- Ubuntu 22.04

To start:
`sudo ./bin/setup.sh`

# setup rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# setup nvim

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir ~/.config/nvim
wget https://github.com/sharksforarms/neovim-rust/blob/master/neovim-init-lsp-cmp-rust-tools.vim

mkdir -p ~/.local/bin
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```

in nvim :PlugInstall


get path correct
https://stackoverflow.com/questions/65889273/how-do-i-add-nvim-to-update-alternatives-when-using-snap-under-ubuntu

##

tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install dropbox
https://www.dropbox.com/install-linux
launch dropbox 
 

## plug install for nvim

```
sudo docker run -v $CONFIG_FILE:$MOUNT_PATH -it vim-rust /bin/bash -c "cd ~/test_app && $EDITOR_BIN -E -s -u NONE ~/.config/nvim/init.vim +so +PlugInstall +qa || /bin/bash"
```

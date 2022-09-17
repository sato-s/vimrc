# vimrc

## Install

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -rfp .config/nvim/init.vim ~/.config/nvim/
cp -rfp vimrc/.tmux.conf ./
cp -rfp vimrc/.gemrc ./
```

Run :PlugInstall in nvim

npm install -g fd-find

# diff-so-fancy
wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -P /usr/local/bin/

# Peco
wget https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz
tar zxf peco_linux_amd64.tar.gz
cp peco_linux_amd64/peco /usr/local/bin

chmod -R 755 /usr/local/bin/


# vimplugin for python
pip3 install pynvim

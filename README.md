neovimのインストールとpip3 install pynvimはしてあるものとする

管理者権限がなく，python3またはpip3がインストールされてない場合はローカルにインストールする

- python3 -> ソースから
- pip3 -> get-pip.pyを使う

opensslがない(またはバージョンが古い)とpip3が動かない場合があるので，opensslも別途インストールする

入れてエラーがなさそうだったら:UpdateRemotePluginsを実行

## python3をソースからビルド
1. https://www.python.org/downloads/source/ らへんからソースをとってくる
2. ./configure --prefix=$HOME/local/ --enable-optimizations  この辺は適宜
3. make -j4 並列数も適宜
4. make altinstall  (--with-opensslを指定するときだけalt？)

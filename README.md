# 環境設定

neovimのインストールとpip3 install pynvimはしてあるものとする
これを`$HOME/.config`以下に入れる

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

## node.js

coc.nvimのためにnode.jsを入れる必要がある
管理者権限があれば普通に入れれば良いけど，ローカルにインストールする場合は不明(必要になったら書く)

##coc.nvim用のsnippetについて

スニペットは $HOME/.config/coc/ultisnips/ にいれるので，シンボリックリンクを張る

##TODO

各lspサーバーの入れ方を書く
現在の環境を自動的に作れるようなスクリプトかなんかを作る

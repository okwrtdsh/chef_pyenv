# chef_pyenv

## pyenvのinstall
```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install chef git
git clone https://github.com/okwrtdsh/chef_pyenv.git /tmp/chef_pyenv
sudo chef-solo -c /tmp/chef_pyenv/config.rb -j /tmp/chef_pyenv/nodes/localhost.json
source ~/.bashrc
```

## Pythonのinstall
```shell
pyenv install -l # インストールできるversion一覧
pyenv install 2.7.11 # 2系の最新をインストール
pyenv install 3.5.0 # 3系の最新をインストール
pyenv global 2.7.11 3.5.0 # globalに適用
```
確認
```shell
$ python --version
Python 2.7.11
$ python3 --version
Python 3.5.0
```
## 仮想環境の構築
```shell
mkdir hoge
cd hoge
pyenv virtualenv 3.5.0 hoge # 仮想環境名:hoge version:3.5.0で作成
pyenv local hoge # hogeディレクトリ以下に適用
```
確認
```shell
$ python --version # 仮想環境外
Python 2.7.11
$ cd hoge
$ python --version # 仮想環境内
Python 3.5.0
```

# chef_pyenv

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install chef git
git clone https://github.com/okwrtdsh/chef_pyenv.git /tmp/chef-repo
sudo chef-solo -c /tmp/chef_pyenv/config.rb -j /tmp/chef_pyenv/nodes/localhost.json
```

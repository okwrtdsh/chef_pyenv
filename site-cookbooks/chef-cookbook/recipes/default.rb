#
# Cookbook Name:: chef-cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


user = node["chef_pyenv"]["username"]
shell = node["chef_pyenv"]["shell"]

%w{wget curl git build-essential cmake python-dev python3-dev python-setuptools libpq-dev aptitude libssl-dev libbz2-dev libreadline-dev libsqlite3-dev}.each do |pkg|
    package pkg do
        action :install
    end
end

git "/home/#{user}/.pyenv" do
    repository "https://github.com/yyuu/pyenv.git"
    reference "master"
    action :sync
    user "#{user}"
end

git "/home/#{user}/.pyenv/plugins/pyenv-virtualenv" do
    repository "https://github.com/yyuu/pyenv-virtualenv.git"
    reference "master"
    action :sync
    user "#{user}"
end

bash "set values for pyenv" do
  cwd "/home/#{user}"
  code <<-EOC
    echo '
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
' >> .#{shell}rc
  EOC
  not_if "grep 'PYENV_ROOT' .#{shell}rc"
end


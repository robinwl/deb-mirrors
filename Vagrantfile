# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "robin/trusty64"
  config.vm.network "forwarded_port", guest: 8870, host: 8870

  config.vm.provision "shell", inline: $shell
  if Vagrant.has_plugin?("vagrant-vbguest") then
  	config.vbguest.auto_update = false
  end
end

$shell = <<-CONTENTS
apt-get update
apt-get install -y docker.io curl
curl --silent -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig
echo "cd /vagrant" >> /home/vagrant/.bashrc
echo "cd /vagrant" >> /root/.bashrc
chmod -x /etc/update-motd.d/*
cd /vagrant && fig up -d
CONTENTS

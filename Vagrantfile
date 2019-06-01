Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.vm.network 'private_network', ip: '192.168.33.77'

  config.vm.synced_folder '.', '/vagrant-nfs', type: 'nfs'
  config.bindfs.bind_folder '/vagrant-nfs', '/home/vagrant/shared'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '4096'
    vb.customize ['modifyvm', :id, '--nictype1', 'virtio']
    vb.customize ['modifyvm', :id, '--nictype2', 'virtio']
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get update && apt-get install -y \
      apt-transport-https ca-certificates curl gnupg-agent \
      software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] \
      https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce docker-compose vim
    apt install -y mysql-client-core-5.7
    gpasswd -a vagrant docker
    echo fs.inotify.max_user_watches=524288 | \
      sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  SHELL
end

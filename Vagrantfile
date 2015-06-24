Vagrant.configure("2") do |config|
  config.vm.box = "vivid32"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.provider "virtualbox" do |v|
    v.customize [
                    "modifyvm", :id,
                    "--name", "Quine Relay",
                    "--memory", "1536"
                ]
  end
  config.vm.provision :shell, :path => "bootstrap.sh"
end

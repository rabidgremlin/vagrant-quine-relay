Vagrant.configure("2") do |config|
  config.vm.box = "utopic32"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/utopic/current/utopic-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.provider "virtualbox" do |v|
    v.customize [
                    "modifyvm", :id,
                    "--name", "Quine Relay",
                    "--memory", "1536"
                ]
  end
  config.vm.provision :shell, :path => "bootstrap.sh"
end





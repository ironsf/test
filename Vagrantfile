# -*- mode: ruby -*-
# vi: set ft=ruby :
new_disk = './tmp/disk.vdi'
Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"

     config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
	unless File.exist?(new_disk)
	   vb.customize ['createhd', '--filename', new_disk, '--size', 2 * 1024]
	   vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', new_disk]
	end

end

config.vm.provision "shell" do |shell|
        shell.inline = "sudo bash /vagrant/bootstrap.sh"
end
 config.vm.provision "ansible" do |ansible|
	ansible.playbook = "playbook.yml"
 end	
end

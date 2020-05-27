Vagrant.configure("2") do |config|

    config.vm.define "goodstream" do |goodstream|
        goodstream.vm.box = "hashicorp/bionic64"
        goodstream.vm.hostname = 'goodstream'
        
        goodstream.vm.network "private_network", ip: '192.168.56.10'
        goodstream.vm.network :forwarded_port, guest:22, host: 2020, host_ip: "0.0.0.0", id: "ssh", auto_correct: true
        
        goodstream.ssh.insert_key = false
        goodstream.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']

        goodstream.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

        goodstream.vm.provision "shell", inline: <<-EOC
            sudo sed -i -e "\\#PasswordAuthentication yes# s#PasswordAuthentication yes#PasswordAuthentication no#g" /etc/ssh/sshd_config
            sudo systemctl restart sshd.service
            echo "finished"
        EOC

        goodstream.vm.provider :virtualbox do |v|
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            v.customize ["modifyvm", :id, "--memory", 1024]
            v.customize ["modifyvm", :id, "--name", "goodstream"]
        end
    end
end

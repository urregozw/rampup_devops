Vagrant.configure(2) do |config|
  # A standard Ubuntu 12.04 LTS 32-bit box
  # For more boxes, you can look at https://atlas.hashicorp.com/boxes/search
  #config.vm.box = "ubuntu/trusty64"
  config.vm.box = "hashicorp/bionic64"
  # Installing all the dependecies
  config.vm.provision "shell", path: "installing_basics/java.sh"
  config.vm.provision "shell", path: "installing_basics/go.sh"
  config.vm.provision "shell", path: "installing_basics/python_and_pip.sh"
  config.vm.provision "shell", path: "installing_basics/redis.sh"
  # Installing and running all the microservices
  config.vm.provision "shell", path: "vag-setup.sh"
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "forwarded_port", guest: 8080, host: 8080,
    auto_correct: true
  
  #config.vm.provision "shell", path: "microservices/frontend.sh"
end


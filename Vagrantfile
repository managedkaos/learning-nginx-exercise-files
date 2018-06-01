guest_ip  = "192.168.0.3"
host_port = "9393"

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.network "private_network", ip: guest_ip
  config.vm.network :forwarded_port, guest: 80, host: host_port
end

puts "-------------------------------------------------"
puts "Homepage (direct)    : http://#{guest_ip}"
puts "Homepage (localhost) : http://localhost:#{host_port}"
puts "-------------------------------------------------"

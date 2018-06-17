guest_ip  = "192.168.0.3"

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.network "private_network", ip: guest_ip
end

puts "-------------------------------------------------"
puts "Demo URL : http://#{guest_ip}"
puts "-------------------------------------------------"

Chef::Platform.set :platform => :arch, :resource => :service, :provider => Chef::Provider::Service::Systemd

%w{
  pacman
  ssh
  users
  developer
  firewall
  docker
  chef
}.each do |recipe|
  include_recipe "base::#{recipe}"
end


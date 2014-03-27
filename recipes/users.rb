include_recipe "sudo"
include_recipe "users::sysadmins"

ssh_keys = []
search(:users, "groups:sysadmin AND NOT action:remove") do |u|
  ssh_keys << u[:ssh_keys]
end
ssh_keys.flatten!.compact!

template "#{home_dir}/.ssh/authorized_keys" do
  source "authorized_keys.erb"
  cookbook "users"
  owner node[:base][:users][:deployer]
  group node[:base][:users][:deployer]
  mode 0600
  variables :ssh_keys => ssh_keys
end

# Disable root password
execute "root password lockout" do
  command "passwd -l root"
end

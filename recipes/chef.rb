# TODO: Switch to a systemd usage of chef rather than cron
#       Follow: https://tickets.opscode.com/browse/COOK-3465

service "cronie" do
  action [:enable, :start]
end

link '/usr/local/sbin/chef-client' do
  to '/root/.gem/ruby/2.1.0/bin/chef-client'
end

directory node[:base][:chef][:log_dir] do
  owner "root"
  group "root"
  mode 0755
end

cron "chef-client" do
  hour "*"
  minute "0,30"
  command "/usr/local/sbin/chef-client -L #{node[:base][:chef][:log_dir]}/chef-client.log"
end

logrotate_app "chef" do
  cookbook "logrotate"
  path "#{node[:base][:chef][:log_dir]}/*.log"
  frequency "daily"
  rotate 7
end

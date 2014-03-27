package "iptables"

service "iptables" do
  action [:enable, :start]
end

cookbook_file "/etc/iptables/iptables.rules" do
  owner "root"
  group "root"
  mode  "0644"
  notifies :reload, "service[iptables]"
end

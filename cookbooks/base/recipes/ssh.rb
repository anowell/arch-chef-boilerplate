service "sshd" do
  action :enable
end

cookbook_file "/etc/ssh/sshd_config" do
  owner "root"
  group "root"
  mode  "0644"
  notifies :reload, "service[sshd]"
end
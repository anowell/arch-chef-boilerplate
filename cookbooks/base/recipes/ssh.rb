# Upgrading openssh requires ed255519 key to be manually created
# ssh-keygen -q -f /etc/ssh/ssh_host_ed25519_key -N "" -t ed25519

service "sshd" do
  action [:enable, :start]
end

cookbook_file "/etc/ssh/sshd_config" do
  owner "root"
  group "root"
  mode  "0644"
  notifies :reload, "service[sshd]"
end

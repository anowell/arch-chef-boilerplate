package 'docker'

service "docker" do
  action [:enable, :start]
end


sysctl = { "net.ipv4.ip_forward" => "1" }

sysctl.each do |k, v|
  execute "sysctl_#{k}" do
    command "sysctl -w \"#{k}=#{v}\""
    not_if "stdout=`sysctl -n #{k}` && test $stdout = #{v}"
  end
end

file "/etc/sysctl.d/docker.conf" do
  content sysctl.map{|k,v| "#{k}=#{v}"}.join("\n")
  mode '0644'
end
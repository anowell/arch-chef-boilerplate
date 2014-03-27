default[:base][:chef][:log_dir] = "/var/log/chef"

default[:authorization][:sudo][:passwordless] = true
default[:authorization][:sudo][:sudoers_defaults] = ["env_reset"]

# Other users are configured via attributes by the users::sysadmins recipe

# Disable root password
execute "root password lockout" do
  command "passwd -l root"
end
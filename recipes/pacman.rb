execute "pacman -Sy" do
  command "pacman -Sy && touch /var/log/pacman-refresh-success"
  ignore_failure true
  not_if do
    ::File.exists?('/var/log/pacman-refresh-success') &&
    ::File.mtime('/var/log/pacman-refresh-success') < Time.now - 86400 # 24 hours
  end
end
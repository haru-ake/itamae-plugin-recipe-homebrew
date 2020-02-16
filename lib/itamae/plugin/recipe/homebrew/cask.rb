if node[:platform] == 'darwin'
  (node['brew']['install_apps'] || []).each do |app|
    execute "Install application: #{app}" do
      command "brew cask install #{app}"
      not_if "brew cask list | grep '^#{app}$'"
    end
  end
else
  Itamae.logger.info("#{node[:platform]} is not support cask")
end

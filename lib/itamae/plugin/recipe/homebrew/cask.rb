if node[:platform] == 'darwin'
  repo = 'homebrew/cask'
  execute 'Enable Homebrew Cask' do
    command "brew tap #{repo}"
    not_if "brew tap | grep '^#{repo}$'"
  end

  (node['brew']['install_apps'] || []).each do |app|
    execute "Install application: #{app}" do
      command "brew cask install #{app}"
      not_if "brew cask list | grep '^#{app}$'"
    end
  end
else
  Itamae.logger.info("#{node[:platform]} is not support cask")
end

include_recipe 'common.rb'

repo = 'caskroom/cask'
execute 'Install Homebrew Cask' do
  command "brew tap #{repo}"
  not_if "brew tap | grep '^#{repo}$'"
end

# Install apps
install_apps = node['brew']['install_apps']
install_apps.each do |app|
  execute "Install application: #{app}" do
    command "brew cask install #{app}"
    not_if "brew cask list | grep '^#{app}$'"
  end
end

# Setup alfred
if install_apps.include?(:alfred)
  execute 'Setup alfred' do
    command 'brew cask alfred link'
  end
end

include_recipe 'common.rb'

repo = 'homebrew/cask'
execute 'Install Homebrew Cask' do
  command "brew tap #{repo}"
  not_if "brew tap | grep '^#{repo}$'"
end

node['brew']['install_apps'].each do |app|
  execute "Install application: #{app}" do
    command "brew cask install #{app}"
    not_if "brew cask list | grep '^#{app}$'"
  end
end

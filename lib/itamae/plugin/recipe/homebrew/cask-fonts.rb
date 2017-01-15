include_recipe 'cask.rb'

repo = 'caskroom/fonts'
execute 'Install Caskroom-fonts' do
  command "brew tap #{repo}"
  not_if "brew tap | grep '^#{repo}$'"
end

node['brew']['install_fonts'].each do |font|
  execute "Install font: #{font}" do
    command "brew cask install #{font}"
    not_if "brew cask list | grep '^#{font}$'"
  end
end

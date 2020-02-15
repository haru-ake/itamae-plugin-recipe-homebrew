if node[:platform] == 'darwin'
  repo = 'homebrew/cask-fonts'
  execute 'Enable homebrew-caskroom-fonts' do
    command "brew tap #{repo}"
    not_if "brew tap | grep '^#{repo}$'"
  end

  (node['brew']['install_fonts'] || []).each do |font|
    execute "Install font: #{font}" do
      command "brew cask install #{font}"
      not_if "brew cask list | grep '^#{font}$'"
    end
  end
else
  Itamae.logger.info("#{node[:platform]} is not support cask-fonts")
end

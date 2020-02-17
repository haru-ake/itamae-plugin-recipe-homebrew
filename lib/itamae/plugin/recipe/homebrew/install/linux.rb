BREW_INSTALL_URL = 'https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh'.freeze
execute "Install Homebrew" do
  command "sh -c \"$(curl -fsSL #{BREW_INSTALL_URL})\""
  not_if "test $(which brew)"
end

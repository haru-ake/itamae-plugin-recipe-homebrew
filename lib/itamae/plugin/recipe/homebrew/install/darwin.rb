BREW_INSTALL_URL = 'https://raw.githubusercontent.com/Homebrew/install/master/install'.freeze
execute "Install Homebrew" do
  command "ruby -e \"$(curl -fsSL #{BREW_INSTALL_URL})\""
  not_if "test $(which brew)"
end

BREW_INSTALL_URL = 'https://raw.githubusercontent.com/Homebrew/install/master/install.sh'.freeze
execute 'Install Homebrew' do
  command "bash -c \"$(curl -fsSL #{BREW_INSTALL_URL})\""
  not_if 'test $(which brew)'
end

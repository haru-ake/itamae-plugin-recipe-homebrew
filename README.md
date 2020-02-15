# itamae-plugin-recipe-homebrew

Plugin to support the Homebrew for [Itamae](https://github.com/itamae-kitchen/itamae)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-homebrew', git: 'https://github.com/haru-ake/itamae-plugin-recipe-homebrew.git',
                                     branch: 'master'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-homebrew

## Usage

### Recipe

Install Homebrew and packages

```ruby
include_recipe 'homebrew'
```

Or `include_recipe` just what you need manually:

```ruby
include_recipe 'homebrew::setup'
include_recipe 'homebrew::install'
include_recipe 'homebrew::package'
include_recipe 'homebrew::cask'
```

### Node

case was an example the yaml

##### your node example
```yaml
brew:
  enable_update: false
  enable_upgrade: false
  add_repositories:
    - homebrew/dupes
    - homebrew/versions
    - homebrew/binary
    - peco/peco
    - motemen/ghq
  install_packages:
    - brew-cask
    - coreutils
    - findutils
    - zsh
    - bash
    - vim
    - tmux
    - git
    - hub
    - tig
    - ghq
    - imagemagick
    - wget
    - rsync
    - curl
    - tree
    - openssl
    - libyaml
    - readline
    - markdown
    - jq
    - peco
    - ctags
    - rbenv
    - ruby-build
    - mysql
    - postgresql
    - node
    - redis
    - rbenv
    - ruby-build
  install_apps:
    - google-chrome
    - iterm2
    - virtualbox
    - vagrant
    - vagrant-manager
    - google-japanese-ime
    - dash
    - github
    - xtrafinder
    - appcleaner
    - bettertouchtool
  install_fonts:
    - font-vlgothic
```

##### Description of Option

* **enable_update** : run the `brew update` If true
* **enable_upgrade** : run the `brew upgrade` If true
* **add_repositories** : run the `brew tap`. To specify the repositories you want to add an array
* **install_packages** : run the `brew install`. To specify the packages you want to add an array
* **install_apps** : run the `brew cask install`. To specify the applications you want to add an array
* **install_fonts** : run the `brew cask install`. To specify the fonts you want to add an array

## Contributing

1. Fork it ( https://github.com/fukuiretu/itamae-plugin-recipe-homebrew/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

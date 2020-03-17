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
  enable_auto_update: false
  enable_update: false
  enable_upgrade: false
  add_repositories:
    - homebrew/versions
    - name: foo/bar
      url: https://example.com/foo/bar.git
  install_packages:
    - name: git
      options: --build-from-source
    - jq
  install_apps:
    - name: firefox
      options: --language=ja
    - vagrant
  services:
    - emacs
```

##### Description of Option

| Property               | Default |                                                                                  |
|:-----------------------|:--------|:---------------------------------------------------------------------------------|
| **enable_auto_update** | `true`  | Run the `brew update` when `brew install`                                        |
| **enable_update**      | `false` | Run the `brew update`                                                            |
| **enable_upgrade**     | `false` | Run the `brew upgrade`                                                           |
| **add_repositories**   | `[]`    | Run the `brew tap` to specify the repositories you want to add an array          |
| **install_packages**   | `[]`    | Run the `brew install` to specify the packages you want to add an array          |
| **install_apps**       | `[]`    | Run the `brew cask install` to specify the applications you want to add an array |
| **services**           | `[]`    | Run the `brew services` to specify the services you want to add an array         |

## Contributing

1. Fork it ( https://github.com/fukuiretu/itamae-plugin-recipe-homebrew/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

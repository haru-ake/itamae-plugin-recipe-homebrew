case node[:platform]
when 'darwin'
  include_recipe 'homebrew::install::darwin'
else
  include_recipe 'homebrew::install::linux'
end

case node[:platform]
when 'darwin'
  # NOP
when 'debian', 'ubuntu'
  include_recipe 'homebrew::deps::debian'
else
  Itamae.logger.warn("#{node[:platform]} is not install dependency system packages")
end

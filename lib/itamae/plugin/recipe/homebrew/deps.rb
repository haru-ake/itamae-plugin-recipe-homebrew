case node[:platform]
when 'darwin'
  # NOP
when 'debian', 'ubuntu'
  include_recipe 'homebrew::deps::debian'
else
  raise NotImplementedError, "#{node[:platform]} is not supported yet"
end

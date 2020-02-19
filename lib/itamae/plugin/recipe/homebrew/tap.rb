(node['brew']['add_repositories'] || []).each do |repo|
  case repo
  when String
    name = repo
    url = ''
  when Hash
    name = repo['name']
    url = repo['url']
  else
    raise("Unknow type: #{repo.class}")
  end

  execute "Add Repository: #{name}" do
    command "brew tap #{name} #{url}".strip
    not_if "brew tap | grep '^#{name}$'"
  end
end

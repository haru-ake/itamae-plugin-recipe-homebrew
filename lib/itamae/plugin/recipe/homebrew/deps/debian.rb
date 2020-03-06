%w[build-essential curl file git].each do |name|
  package name do
    user 'root'
  end
end

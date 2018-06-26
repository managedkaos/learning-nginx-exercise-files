title = 'Homepage should be the default nginx welcome page'

control 'homepage' do
  impact 1.0
  title "#{title}"
  desc "#{title}"

  describe http('http://192.168.0.3', enable_remote_worker: true) do
    its('body') { should match 'Welcome to nginx!' }
  end
end

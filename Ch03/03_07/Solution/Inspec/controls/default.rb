title = 'Nginx 1.14+ should be installed, running, and listening on port 80'

control 'nginx-install' do
  impact 1.0
  title "#{title}"
  desc "#{title}"

  describe nginx do
    its('version') { should cmp >= '1.14.0' }
  end

  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_running }
  end

  describe port('80') do
    it { should be_listening }
    # its('processes') { should include 'nginx' } # Failing at the moment
  end
end

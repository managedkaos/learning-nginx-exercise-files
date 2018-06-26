title = 'Homepage should be Wisdom Pet Medicine homepage'

control 'homepage' do
  impact 1.0
  title "#{title}"
  desc "#{title}"
  describe command('curl -Lks http://localhost | grep -E "<title>Wisdom Pet Medicine</title>"') do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
    its('stdout') { should match '<title>Wisdom Pet Medicine</title>' }
  end
end

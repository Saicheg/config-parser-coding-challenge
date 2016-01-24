require_relative 'spec_helper'

describe ConfigGroupSplitter do

  let(:common) {
["basic_size_limit = 2512132\n",
"student_size_limit= 12312\n",
"\n",
"paid_users_limit=31231\n",
"\n",
"path = /srv/tmp/usr\n",
"path<itscript> = /srv/tmp\n",
"\n"]}

  let(:file_path) { File.expand_path('./../fixtures/config.ini', __FILE__) }
  let(:file) { File.open(file_path, 'r') }
  subject { ConfigGroupSplitter.new }

  it 'should parse config files and return hash of groups and data' do
    groups = subject.split(file)
    expect(groups.keys).to eq(%i(common ftp http))
    expect(groups[:common]).to eq(common)
  end

end

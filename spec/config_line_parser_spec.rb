require_relative 'spec_helper'

describe ConfigLineParser do

  subject { described_class.new }

  it 'should sucessfully parse different types of lines' do
    expect(subject.parse('basic_size_limit = 2512132')).to eq(['basic_size_limit', 2512132])
    expect(subject.parse('student_size_limit= 12312')).to eq(['student_size_limit', 12312])
    expect(subject.parse("stest= '12312;123'")).to eq(['stest', '12312;123'])
    expect(subject.parse("paid_users_limit=31231")).to eq(['paid_users_limit', 31231])
    expect(subject.parse("path = /srv/tmp/usr")).to eq(['path', '/srv/tmp/usr'])
    expect(subject.parse("path<production> = /srv/tmp/usr")).to eq(['path<production>', '/srv/tmp/usr'])
    expect(subject.parse('name = "hello there, ftp uploading"')).to eq(['name', 'hello there, ftp uploading'])
    expect(subject.parse('enabled = no')).to eq(['enabled', false])
    expect(subject.parse('enabled = true')).to eq(['enabled', true])
    expect(subject.parse('params = array,of,values')).to eq(['params', ['array','of','values']])
  end

end

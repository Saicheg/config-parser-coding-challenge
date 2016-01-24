require_relative 'spec_helper'

describe ConfigGroupParser do

  let(:lines) {
["basic_size_limit = 2512132\n",
"student_size_limit= 12312\n",
"\n",
"paid_users_limit=31231\n",
"\n",
"is_true = yes",
"i_am_array = abc,ad,sss",
"path = /srv/tmp/usr\n",
"path<itscript> = /srv/tmp\n",
"path<production> = /srv/tmp\n",
"\n"]}

  subject { ConfigGroupParser.new }

  it 'should parse lines to actual config' do
    config = subject.parse(lines)
  end

end

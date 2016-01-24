require_relative 'spec_helper'

describe ConfigLinesFilter do

  let(:lines) {
    ["basic_size_limit = 2512132\n",
    "student_size_limit= 12312\n",
    "stest= '12312;123'\n",
    "\n",
    "paid_users_limit=31231\n",
    "; Another great comment",
    "path = /srv/tmp/usr\n",
    "path<production> = /srv/tmp/usr ; This is a comment\n",
    "path<itscript> = /srv/tmp\n",
    "\n"]
  }

  subject { described_class.new }

  it 'should filter blank lines and strip comments' do
    expect(subject.filter(lines)).to eq(
      ["basic_size_limit = 2512132",
      "student_size_limit= 12312",
      "stest= '12312;123'",
      "paid_users_limit=31231",
      "path = /srv/tmp/usr",
      "path<production> = /srv/tmp/usr",
      "path<itscript> = /srv/tmp"])

  end

end

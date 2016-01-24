require_relative 'spec_helper'

describe ConfigFileParser do

  let(:group_splitter) { ConfigGroupSplitter.new }
  let(:group_parser) { ConfigGroupParser.new }
  let(:override_picker) { ConfigGroupOverridePicker.new }
  let(:overrides) { ['ubuntu', :production] }
  let(:file_path) { File.expand_path('./../fixtures/config.ini', __FILE__) }

  subject { described_class.new(file_path, overrides, group_splitter: group_splitter, group_parser: group_parser, override_picker: override_picker) }

  it 'should raise an error if file does not exist' do
    config = subject.parse
    expect(config.common.paid_users_limit).to eq(31231)
    expect(config.ftp.name).to eq("hello there, ftp uploading")
    expect(config.http.params).to eq(['array','of','values'])
    expect(config.ftp.enabled).to eq(false)
    expect(config.ftp[:path]).to eq('/etc/var/uploads')
  end

end

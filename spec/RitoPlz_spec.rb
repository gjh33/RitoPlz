require 'spec_helper'

describe RitoPlz do
  it 'has a version number' do
    expect(RitoPlz::VERSION).not_to be nil
  end

  describe '.configure' do
    subject { described_class.configure do |config| config.api_key = new_api_key end }

    let(:new_api_key) { "generic_api_key" }

    it "Changes configuration parameters" do
      subject
      expect(described_class.configuration.api_key).to eq new_api_key
    end
  end

  describe '.reset' do
    subject { described_class.reset }

    let(:changed_api_key) { "changed_api_key" }

    before(:each) do
      described_class.configure do |config|
        config.api_key = changed_api_key
      end
    end

    it "Resets configuration parameters" do
      subject
      expect(described_class).not_to eq changed_api_key
    end
  end
end

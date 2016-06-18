require 'spec_helper'
require 'RitoPlz/configuration'

describe RitoPlz::Configuration do
  context "when additional parameters are passed" do
    subject { described_class.new(api_key: new_api_key) }

    let(:new_api_key) { "new_api_key" }

    it "uses the values passed in the parameters to set configuration" do
      expect(subject.api_key).to eq new_api_key
    end
  end
end

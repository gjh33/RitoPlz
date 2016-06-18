require 'spec_helper'
require 'RitoPlz/API/status'

describe RitoPlz::API::Status do
  let(:status) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#all" do
    subject { status.all }

    it_behaves_like "an api endpoint"
  end

  describe "#by_region_code" do
    subject { status.by_region_code(test_region) }

    it_behaves_like "an api endpoint"
  end
end


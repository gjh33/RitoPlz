require 'spec_helper'
require 'RitoPlz/API/champion'

describe RitoPlz::API::Champion do
  let(:champion) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#all" do
    subject { champion.all }

    it_behaves_like "an api endpoint"
  end

  describe "#by_id" do
    subject { champion.by_id(0) }

    it_behaves_like "an api endpoint"
  end
end

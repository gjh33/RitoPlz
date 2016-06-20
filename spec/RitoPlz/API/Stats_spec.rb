require 'spec_helper'
require 'RitoPlz/API/stats'

describe RitoPlz::API::Stats do
  let(:stats) { described_class.new(test_region, 0) }
  let(:test_region) { :test_region }

  describe "#ranked" do
    subject { stats.ranked }

    it_behaves_like "an api endpoint"
  end

  describe "#summary" do
    subject { stats.summary }

    it_behaves_like "an api endpoint"
  end
end

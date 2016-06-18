require 'spec_helper'
require 'RitoPlz/API/match'

describe RitoPlz::API::Match do
  let(:match) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#by_id" do
    subject { match.by_id(0) }

    it_behaves_like "an api endpoint"
  end
end

require 'spec_helper'
require 'RitoPlz/API/team'

describe RitoPlz::API::Team do
  let(:team) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#by_player_ids" do
    subject { team.by_player_ids(0,1,2) }

    it_behaves_like "an api endpoint"
  end

  describe "#by_ids" do
    subject { team.by_ids("aaaaa","bbbbb","ccccc") }

    it_behaves_like "an api endpoint"
  end
end

require 'spec_helper'
require 'RitoPlz/API/match_list'

describe RitoPlz::API::MatchList do
  let(:match_list) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#by_player_id" do
    subject { match_list.by_player_id(0) }

    it_behaves_like "an api endpoint"
  end
end

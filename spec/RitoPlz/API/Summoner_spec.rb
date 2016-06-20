require 'spec_helper'
require 'RitoPlz/API/summoner'

describe RitoPlz::API::Summoner do
  let(:summoner) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#by_names" do
    subject { summoner.by_names("player1", "player2") }

    it_behaves_like "an api endpoint"
  end

  describe "#by_ids" do
    subject { summoner.by_ids(0,1,2) }

    it_behaves_like "an api endpoint"
  end

  describe "#masteries_by_player_ids" do
    subject { summoner.masteries_by_player_ids(0,1,2) }

    it_behaves_like "an api endpoint"
  end

  describe "#names_by_player_ids" do
    subject { summoner.names_by_player_ids(0,1,2) }

    it_behaves_like "an api endpoint"
  end

  describe "#runes_by_player_ids" do
    subject { summoner.runes_by_player_ids(0,1,2,) }

    it_behaves_like "an api endpoint"
  end
end

require 'spec_helper'
require 'RitoPlz/API/league'

describe RitoPlz::API::League do
  let(:league) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#by_player_ids" do
    subject { league.by_player_ids([0]) }

    it_behaves_like "an api endpoint"
  end

  describe "#entries_by_player_ids" do
    subject { league.entries_by_player_ids([0]) }

    it_behaves_like "an api endpoint"
  end

  describe "#by_team_ids" do
    subject { league.by_team_ids([0]) }

    it_behaves_like "an api endpoint"
  end

  describe "#entries_by_team_ids" do
    subject { league.entries_by_team_ids([0]) }

    it_behaves_like "an api endpoint"
  end

  describe "#challenger" do
    subject { league.challenger }

    it_behaves_like "an api endpoint"
  end

  describe "#master" do
    subject { league.master }

    it_behaves_like "an api endpoint"
  end
end

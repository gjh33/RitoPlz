require 'spec_helper'
require 'RitoPlz/API/champion'

describe RitoPlz::API::ChampionMastery do
  let(:champion_mastery) { described_class.new(test_region, 0) }
  let(:test_region) { :test_region }

  describe "#all_champions" do
    subject { champion_mastery.all_champions }

    it_behaves_like "an api endpoint"
  end

  describe "#by_champion_id" do
    subject { champion_mastery.by_champion_id(0) }

    it_behaves_like "an api endpoint"
  end

  describe "#score" do
    subject { champion_mastery.score }

    it_behaves_like "an api endpoint"
  end

  describe "#top" do
    subject { champion_mastery.top }

    it_behaves_like "an api endpoint"
  end
end

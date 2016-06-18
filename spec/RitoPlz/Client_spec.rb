require 'spec_helper'
require 'RitoPlz/client'

describe RitoPlz::Client do
  before(:each) do
    RitoPlz.configure do |config|
      config.default_region = :na
    end
  end

  let(:client) { described_class.new(region: test_region) }
  let(:test_region) { :test_region }

  describe "#champion" do
    subject { client.champion }

    it { is_expected.to be_a RitoPlz::API::Champion }

    it "creates a champion api with the correct region" do
      expect(RitoPlz::API::Champion).to receive(:new).with(test_region)
      subject
    end
  end

  describe "#champion_mastery" do
    subject { client.champion_mastery(0) }

    it { is_expected.to be_a RitoPlz::API::ChampionMastery }

    it "creats a champion mastery api with the correct region and player id" do
      expect(RitoPlz::API::ChampionMastery).to receive(:new).with(test_region, 0)
      subject
    end
  end

  describe "#current_game" do
    subject { client.current_game }

    it { is_expected.to be_a RitoPlz::API::CurrentGame }

    it "creates a current game api with the correct region" do
      expect(RitoPlz::API::CurrentGame).to receive(:new).with(test_region)
      subject
    end
  end

  describe "#featured_games" do
    subject { client.featured_games }

    it { is_expected.to be_a RitoPlz::API::FeaturedGames }

    it "creates a featured games api with the correct region" do
      expect(RitoPlz::API::FeaturedGames).to receive(:new).with(test_region)
      subject
    end
  end

  describe "#game" do
    subject { client.game }

    it { is_expected.to be_a RitoPlz::API::Game }

    it "creates a game api with the correct region" do
      expect(RitoPlz::API::Game).to receive(:new).with(test_region)
      subject
    end
  end

  describe "#league" do
    subject { client.league }

    it { is_expected.to be_a RitoPlz::API::League }

    it "creates a league api with the correct region" do
      expect(RitoPlz::API::League).to receive(:new).with(test_region)
      subject
    end
  end

  describe "#static_data" do
    subject { client.static_data }

    it { is_expected.to be_a RitoPlz::API::StaticData }

    it "creates a static data api with the correct region" do
      expect(RitoPlz::API::StaticData).to receive(:new).with(test_region)
      subject
    end
  end

  describe "#status" do
    subject { client.status }

    it { is_expected.to be_a RitoPlz::API::Status }

    it "creates a status api with the correct region" do
      expect(RitoPlz::API::Status).to receive(:new).with(test_region)
      subject
    end
  end

  describe "#match" do
    subject { client.match }

    it { is_expected.to be_a RitoPlz::API::Match }

    it "creates a match api with the correct region" do
      expect(RitoPlz::API::Match).to receive(:new).with(test_region)
      subject
    end
  end
end

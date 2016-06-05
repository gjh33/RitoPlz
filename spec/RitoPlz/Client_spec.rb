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
end

require 'spec_helper'
require 'RitoPlz/API/static_data'

describe RitoPlz::API::StaticData do
  let(:static_data) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#champions" do
    subject { static_data.champions }

    it_behaves_like "an api endpoint"
  end

  describe "#champion_by_id" do
    subject { static_data.champion_by_id(0) }

    it_behaves_like "an api endpoint"
  end

  describe "#items" do
    subject { static_data.items }

    it_behaves_like "an api endpoint"
  end

  describe "#item_by_id" do
    subject { static_data.item_by_id(0) }

    it_behaves_like "an api endpoint"
  end

  describe "#language_strings" do
    subject { static_data.language_strings }

    it_behaves_like "an api endpoint"
  end

  describe "#languages" do
    subject { static_data.languages }

    it_behaves_like "an api endpoint"
  end

  describe "#maps" do
    subject { static_data.maps }

    it_behaves_like "an api endpoint"
  end

  describe "#masteries" do
    subject { static_data.masteries }

    it_behaves_like "an api endpoint"
  end

  describe "#mastery_by_id" do
    subject { static_data.mastery_by_id(0) }

    it_behaves_like "an api endpoint"
  end

  describe "#realm" do
    subject { static_data.realm }

    it_behaves_like "an api endpoint"
  end

  describe "#runes" do
    subject { static_data.runes }

    it_behaves_like "an api endpoint"
  end

  describe "#rune_by_id" do
    subject { static_data.rune_by_id(0) }

    it_behaves_like "an api endpoint"
  end

  describe "#summoner_spells" do
    subject { static_data.summoner_spells }

    it_behaves_like "an api endpoint"
  end

  describe "#summoner_spell_by_id" do
    subject { static_data.summoner_spell_by_id(0) }

    it_behaves_like "an api endpoint"
  end

  describe "#versions" do
    subject { static_data.versions }

    it_behaves_like "an api endpoint"
  end
end

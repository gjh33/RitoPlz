require 'spec_helper'
require 'RitoPlz/API/featured_games'

describe RitoPlz::API::FeaturedGames do
  let(:featured_games) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#all" do
    subject { featured_games.all }

    it_behaves_like "an api endpoint"
  end
end

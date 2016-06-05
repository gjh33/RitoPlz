require 'spec_helper'
require 'RitoPlz/API/game'

describe RitoPlz::API::Game do
  let(:game) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#by_player_id" do
    subject { game.by_player_id(0) }

    it_behaves_like "an api endpoint"
  end
end

require 'spec_helper'
require 'RitoPlz/API/current_game'

describe RitoPlz::API::CurrentGame do
  let(:current_game) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#by_player_id" do
    subject { current_game.by_player_id(0) }

    it_behaves_like "an api endpoint"
  end
end

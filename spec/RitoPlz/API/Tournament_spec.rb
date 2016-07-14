require 'spec_helper'
require 'RitoPlz/API/tournament'

describe RitoPlz::API::Tournament do
  let(:tournament) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#generate_code" do
    subject { tournament.generate_code("aaa", {}) }

    it_behaves_like "an api endpoint"
  end

  describe "#get_code_info" do
    subject { tournament.get_code_info("aaa") }

    it_behaves_like "an api endpoint"
  end

  describe "#update_code_info" do
    subject { tournament.update_code_info("aaa", {}) }

    it_behaves_like "an api endpoint"
  end

  describe "#get_lobby_events" do
    subject { tournament.get_lobby_events("aaa") }

    it_behaves_like "an api endpoint"
  end

  describe "#create_provider" do
    subject { tournament.create_provider({}) }

    it_behaves_like "an api endpoint"
  end

  describe "#create_tournament" do
    subject { tournament.create_tournament({}) }

    it_behaves_like "an api endpoint"
  end
end

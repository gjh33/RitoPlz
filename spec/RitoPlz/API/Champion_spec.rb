require 'spec_helper'
require 'RitoPlz/API/champion'
require 'net/http'

describe RitoPlz::API::Champion do
  let(:champion) { described_class.new(test_region) }
  let(:test_region) { :test_region }

  describe "#all" do
    subject { champion.all }

    it "makes a request to Riot's API" do
      expect(Net::HTTP).to receive(:get_response)
      subject
    end
  end

  describe "#by_id" do
    subject { champion.by_id(0) }

    it "makes a request to Riot's API" do
      expect(Net::HTTP).to receive(:get_response)
      subject
    end
  end
end

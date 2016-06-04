require 'spec_helper'
require 'RitoPlz/client'

describe RitoPlz::Client do
  let(:default_api_key) { "default_api_key" }

  before(:each) do
    RitoPlz.configure do |config|
      config.api_key = default_api_key
    end
  end

  context "when no additional parameters are provided" do
    let(:client) { described_class.new }

    it "inherets application configuration" do
      expect(client.config.api_key).to eq default_api_key
    end
  end

  context "when additional parameters are provided" do
    let(:client) { described_class.new(api_key: new_api_key) }
    let(:new_api_key) { "new_api_key" }

    it "creates it's own configuration" do
      expect(client.config.api_key).to eq new_api_key
    end
  end

  describe '#make_request' do
    subject { client.make_request test_api }

    let(:client) { described_class.new }
    let(:test_api) { double("API::Test") }

    before(:each) do
      allow(test_api).to receive(:path) { "" }
    end

    context "when making a get request" do
      before(:each) do
        allow(test_api).to receive(:type) { :get }
      end

      it "sends a GET request" do
        expect(Net::HTTP).to receive(:get_response).with(kind_of(URI))
        subject
      end
    end

    context "when making a post request" do
      let(:post_params) { { test: :params } }

      before(:each) do
        allow(test_api).to receive(:type) { :post }
        allow(test_api).to receive(:params) { post_params }
      end

      it "sends a POST request with params" do
        expect(Net::HTTP).to receive(:post_form).with(kind_of(URI), post_params)
        subject
      end
    end
  end
end

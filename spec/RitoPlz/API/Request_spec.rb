require 'spec_helper'

describe RitoPlz::API::Request do
  let(:request) { described_class.new(region, path) }
  let(:path) { "/test/path" }
  let(:params) { { test: :params } }
  let(:region) { :test }

  describe '#get' do
    subject { request.get(params) }

    it "makes a get request" do
      expect(Net::HTTP).to receive(:get_response).with(kind_of(URI))
      subject
    end
  end

  describe '#post' do
    subject { request.post(params) }

    it "makes a post request" do
      expect(Net::HTTP).to receive(:post_form).with(kind_of(URI), params)
      subject
    end
  end
end

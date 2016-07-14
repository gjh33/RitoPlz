require 'spec_helper'

describe RitoPlz::API::Request do
  let(:request) { described_class.new(region, path) }
  let(:path) { "/test/path" }
  let(:params) { { test: :params } }
  let(:query_params) { { test: :params } }
  let(:region) { :test }
  let(:response) { double("Response") }

  describe '#get' do
    subject { request.get(params) }

    before(:each) do
      allow(Net::HTTP).to receive(:get_response) { response }
    end

    context "when server returns 200" do
      before(:each) do
        allow(response).to receive(:code) { '200' }
      end

      it "makes a get request" do
        expect(Net::HTTP).to receive(:get_response).with(kind_of(URI))
        subject
      end
    end

    context "when the server returns an error" do
      before(:each) do
        allow(response).to receive(:code) { '400' }
      end

      it "raises an exception" do
        expect { subject }.to raise_error RitoPlz::API::BadRequestException
      end
    end
  end

  describe '#post' do
    subject { request.post(params, query_params) }

    before(:each) do
      allow(Net::HTTP).to receive(:start) { response }
    end

    context "when server returns 200" do
      before(:each) do
        allow(response).to receive(:code) { '200' }
      end

      it "makes a post request" do
        expect(Net::HTTP).to receive(:start)
        subject
      end
    end

    context "when the server returns an error" do
      before(:each) do
        allow(response).to receive(:code) { '400' }
      end

      it "raises an exception" do
        expect { subject }.to raise_error RitoPlz::API::BadRequestException
      end
    end
  end


  describe '#put' do
    subject { request.put(params, query_params) }

    before(:each) do
      allow(Net::HTTP).to receive(:start) { response }
    end

    context "when server returns 200" do
      before(:each) do
        allow(response).to receive(:code) { '200' }
      end

      it "makes a put request" do
        expect(Net::HTTP).to receive(:start)
        subject
      end
    end

    context "when the server returns an error" do
      before(:each) do
        allow(response).to receive(:code) { '400' }
      end

      it "raises an exception" do
        expect { subject }.to raise_error RitoPlz::API::BadRequestException
      end
    end
  end
end

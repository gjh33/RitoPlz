$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'RitoPlz'
require 'net/http'

Bundler.require(:all)

RSpec.configure do |config|
  config.before(:each) do
    @request_made = false
    @get_request_made = false
    @post_request_made = false
    @put_request_made = false
    response = double("ResponseDouble")

    allow(Net::HTTP).to receive(:get_response) do
      @request_made = true
      @get_request_made = true
      response
    end

    allow(Net::HTTP).to receive(:start) do
      @request_made = true
      @post_request_made = true
      @put_request_made = true
      response
    end

    allow(response).to receive(:code) { '200' }
  end
end

shared_examples_for "an api endpoint" do
  it "makes a request to Riot's API" do
    subject
    expect(@request_made).to be true
  end
end

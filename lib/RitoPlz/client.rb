require 'net/http'

module RitoPlz
  class Client
    attr_reader :config

    #Use application configuration or use custom configuration
    def initialize(params = {})
      unless params.empty?
        @config = Configuration.new(params)
      else
        @config = RitoPlz.configuration
      end
    end

    #given an api object make a request for that object and return the response
    def make_request api
      uri = URI(request_url(api))
      if api.type == :get
        Net::HTTP.get_response uri
      elsif api.type == :post
        Net::HTTP.post_form(uri, api.params)
      end
    end

    private

    #here we expect the api object to have a path method that will return the api path
    def request_url api
      "https://#{@config.region}.api.pvp.net#{api.path}?api_key=#{@config.api_key}"
    end
  end
end

require 'net/http'

module RitoPlz
  module API
    class Request
      attr_reader :path, :region

      #Use application configuration or use custom configuration
      def initialize(region, path)
        @path = path
        @region = region
      end

      def get(query_params = {})
        uri = URI(request_url(query_params))
        Net::HTTP.get_response(uri)
      end

      def post(params = {})
        uri = URI(request_url)
        Net::HTTP.post_form(uri, params)
      end

      private

      def request_url(query_params = {})
        query_params[:api_key] = RitoPlz.configuration.api_key
        "https://#{region}.api.pvp.net#{path}?#{URI.encode_www_form(query_params)}"
      end
    end
  end
end

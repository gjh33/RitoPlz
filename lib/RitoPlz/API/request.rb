require 'net/http'
require 'RitoPlz/API/exceptions'

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
        response = Net::HTTP.get_response(uri)
        verify_response!(response)
        return response
      end

      def post(params = {})
        uri = URI(request_url)
        response = Net::HTTP.post_form(uri, params)
        verify_response!(response)
        return response
      end

      private

      def request_url(query_params = {})
        query_params[:api_key] = RitoPlz.configuration.api_key
        "https://#{region}.api.pvp.net#{path}?#{URI.encode_www_form(query_params)}"
      end

      def verify_response!(response)
        case response.code
        when '400'
          raise BadRequestException
        when '401'
          raise UnauthorizedException
        when '403'
          raise ForbiddenException
        when '404'
          raise NotFoundException
        when '415'
          raise UnsupportedMediaTypeException
        when '429'
          raise RateLimitExceededException
        when '500'
          raise InternalServerException
        when '503'
          raise ServiceUnavailableException
        end
      end
    end
  end
end

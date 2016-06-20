require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Match < Base
      def initialize(region)
        @region = region
      end

      def by_id(id, query_params = {})
        request = Request.new(@region, api_path("/#{id}"))
        request.get(query_params)
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v2.2/match" + additional_path
      end
    end
  end
end

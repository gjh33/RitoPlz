require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Champion < Base
      def initialize(region)
        @region = region
      end

      def all(query_params = {})
        request = Request.new(@region, api_path)
        request.get(query_params)
      end

      def by_id(id)
        request = Request.new(@region, api_path("/#{id}"))
        request.get
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v1.2/champion" + additional_path
      end
    end
  end
end

require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Status < Base
      def initialize(region)
        @region = region
      end

      def all
        request = Request.new(@region, api_path, type: :status)
        request.get
      end

      def by_region_code(region_code)
        request = Request.new(@region, api_path("/#{region_code}"), type: :status)
        request.get
      end

      protected

      def api_path(additional_path = "")
        "/shards" + additional_path
      end
    end
  end
end

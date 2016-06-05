require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class FeaturedGames < Base
      def initialize(region)
        @region = region
      end

      def all
        request = Request.new(@region, api_path)
        request.get
      end

      protected

      def api_path
        "/observer-mode/rest/featured"
      end
    end
  end
end

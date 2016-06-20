require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Team < Base
      def initialize(region)
        @region = region
      end

      def by_player_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/by-summoner/#{ids_string}"))
        request.get
      end

      def by_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/#{ids_string}"))
        request.get
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v2.4/team" + additional_path
      end
    end
  end
end

require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class MatchList < Base
      def initialize(region)
        @region = region
      end

      def by_player_id(player_id, query_params = {})
        request = Request.new(@region, api_path("/#{player_id}"))
        request.get(query_params)
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v2.2/matchlist/by-summoner" + additional_path
      end
    end
  end
end

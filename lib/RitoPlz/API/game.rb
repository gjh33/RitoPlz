require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Game < Base
      def initialize(region)
        @region = region
      end

      def by_player_id(player_id)
        request = Request.new(@region, api_path("/#{player_id}/recent"))
        request.get
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v1.3/game/by-summoner" + additional_path
      end
    end
  end
end

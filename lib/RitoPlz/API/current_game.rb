require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class CurrentGame < Base
      def initialize(region)
        @region = region
      end

      def by_player_id(player_id)
        request = Request.new(@region, api_path("/#{player_id}"))
        request.get
      end

      protected

      def platform
        RitoPlz.to_platform(@region)
      end

      def api_path(additional_path = "")
        "/observer-mode/rest/consumer/getSpectatorGameInfo/#{platform}" + additional_path
      end
    end
  end
end

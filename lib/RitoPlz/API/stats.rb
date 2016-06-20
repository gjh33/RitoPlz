require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Stats < Base
      def initialize(region, player_id)
        @region = region
        @player_id = player_id
      end

      def ranked(query_params = {})
        request = Request.new(@region, api_path("/ranked"))
        request.get(query_params)
      end

      def summary(query_params = {})
        request = Request.new(@region, api_path("/summary"))
        request.get(query_params)
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v1.3/stats/by-summoner/#{@player_id}" + additional_path
      end
    end
  end
end

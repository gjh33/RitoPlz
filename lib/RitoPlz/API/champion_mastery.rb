require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class ChampionMastery < Base
      def initialize(region, player_id)
        @region = region
        @player_id = player_id
      end

      def all_champions
        request = Request.new(@region, api_path("/champions"))
        request.get
      end

      def by_champion_id(champion_id)
        request = Request.new(@region, api_path("/champion/#{champion_id}"))
        request.get
      end

      def score
        request = Request.new(@region, api_path("/score"))
        request.get
      end

      def top(query_params = {})
        request = Request.new(@region, api_path("/topchampions"))
        request.get(query_params)
      end

      protected

      def platform
        RitoPlz.to_platform(@region)
      end

      def api_path(additional_path = "")
        "/championmastery/location/#{platform}/player/#{@player_id}" + additional_path
      end
    end
  end
end

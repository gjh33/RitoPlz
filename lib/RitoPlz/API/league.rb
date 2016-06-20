require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class League < Base
      def initialize(region)
        @region = region
      end

      def by_player_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/by-summoner/#{ids_string}"))
        request.get
      end

      def entries_by_player_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/by-summoner/#{ids_string}/entry"))
        request.get
      end

      def by_team_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/by-team/#{ids_string}"))
        request.get
      end

      def entries_by_team_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/by-team/#{ids_string}/entry"))
        request.get
      end

      def challenger(type = :RANKED_SOLO_5x5)
        query_params = { type: type }
        request = Request.new(@region, api_path("/challenger"))
        request.get(query_params)
      end

      def master(type = :RANKED_SOLO_5x5)
        query_params = { type: type }
        request = Request.new(@region, api_path("/master"))
        request.get(query_params)
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v2.5/league" + additional_path
      end
    end
  end
end

require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Summoner < Base
      def initialize(region)
        @region = region
      end

      def by_names(*names)
        names_string = names.join(',')
        request = Request.new(@region, api_path("/by-name/#{names_string}"))
        request.get
      end

      def by_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/#{ids_string}"))
        request.get
      end

      def masteries_by_player_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/#{ids_string}/masteries"))
        request.get
      end

      def names_by_player_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/#{ids_string}/name"))
        request.get
      end

      def runes_by_player_ids(*ids)
        ids_string = ids.join(',')
        request = Request.new(@region, api_path("/#{ids_string}/runes"))
        request.get
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/#{@region}/v1.4/summoner" + additional_path
      end
    end
  end
end

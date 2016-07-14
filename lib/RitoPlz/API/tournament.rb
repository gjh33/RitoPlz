require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class Tournament < Base
      def initialize(region)
        @region = region
      end

      def generate_code(tournament_id, params)
        query_params = { tournamentId: tournament_id, count: params[:count] || 1 }
        params.delete(:count)
        request = Request.new(@region, api_path('/code'))
        request.post(params, query_params)
      end

      def get_code_info(tournament_code)
        request = Request.new(@region, api_path("/code/#{tournament_code}"))
        request.get
      end

      def update_code_info(tournament_code, params)
        request = Request.new(@region, api_path("/code/#{tournament_code}"))
        request.put(params)
      end

      def get_lobby_events(tournament_code)
        request = Request.new(@region, api_path("/lobby/events/by-code/#{tournament_code}"))
        request.get
      end

      def create_provider(params)
        params[:region] ||= @region
        request = Request.new(@region, api_path('/provider'))
        request.post(params)
      end

      def create_tournament(params)
        request = Request.new(@region, api_path('/tournament'))
        request.post(params)
      end

      protected

      def api_path(additional_path = "")
        "/tournament/public/v1" + additional_path
      end
    end
  end
end

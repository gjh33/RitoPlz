require 'RitoPlz/API/champion'
require 'RitoPlz/API/champion_mastery'
require 'RitoPlz/API/current_game'

module RitoPlz
  class Client
    def initialize(params = {})
      @region = params[:region] || RitoPlz.configuration.default_region
    end

    def champion
      RitoPlz::API::Champion.new(@region)
    end

    def champion_mastery(player_id)
      RitoPlz::API::ChampionMastery.new(@region, player_id)
    end

    def current_game
      RitoPlz::API::CurrentGame.new(@region)
    end
  end
end

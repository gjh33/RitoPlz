require 'RitoPlz/API/champion'
require 'RitoPlz/API/champion_mastery'

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
  end
end

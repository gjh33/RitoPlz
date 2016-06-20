require 'RitoPlz/API/champion'
require 'RitoPlz/API/champion_mastery'
require 'RitoPlz/API/current_game'
require 'RitoPlz/API/featured_games'
require 'RitoPlz/API/game'
require 'RitoPlz/API/league'
require 'RitoPlz/API/static_data'
require 'RitoPlz/API/status'
require 'RitoPlz/API/match'
require 'RitoPlz/API/match_list'
require 'RitoPlz/API/stats'
require 'RitoPlz/API/summoner'
require 'RitoPlz/API/team'

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

    def featured_games
      RitoPlz::API::FeaturedGames.new(@region)
    end

    def game
      RitoPlz::API::Game.new(@region)
    end

    def league
      RitoPlz::API::League.new(@region)
    end

    def static_data
      RitoPlz::API::StaticData.new(@region)
    end

    def status
      RitoPlz::API::Status.new(@region)
    end

    def match
      RitoPlz::API::Match.new(@region)
    end

    def match_list
      RitoPlz::API::MatchList.new(@region)
    end

    def stats(player_id)
      RitoPlz::API::Stats.new(@region, player_id)
    end

    def summoner
      RitoPlz::API::Summoner.new(@region)
    end

    def team
      RitoPlz::API::Team.new(@region)
    end
  end
end

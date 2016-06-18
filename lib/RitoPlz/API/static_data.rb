require 'RitoPlz/API/base'
require 'RitoPlz/API/request'

module RitoPlz
  module API
    class StaticData < Base
      def initialize(region)
        @region = region
      end

      def champions(query_params = {})
        if query_params[:champData]
          query_params[:champData] = query_params[:champData].join(',')
        end
        request = Request.new(@region, api_path("/champion"))
        request.get(query_params)
      end

      def champion_by_id(champion_id, query_params = {})
        if query_params[:champData]
          query_params[:champData] = query_params[:champData].join(',')
        end
        request = Request.new(@region, api_path("/champion/#{champion_id}"))
        request.get(query_params)
      end

      def items(query_params = {})
        if query_params[:itemListData]
          query_params[:itemListData] = query_params[:itemListData].join(',')
        end
        request = Request.new(@region, api_path("/item"))
        request.get(query_params)
      end

      def item_by_id(item_id, query_params = {})
        if query_params[:itemListData]
          query_params[:itemListData] = query_params[:itemListData].join(',')
        end
        request = Request.new(@region, api_path("/item/#{item_id}"))
        request.get(query_params)
      end

      def language_strings(query_params = {})
        request = Request.new(@region, api_path("/language-strings"))
        request.get(query_params)
      end

      def languages
        request = Request.new(@region, api_path("/languages"))
        request.get
      end

      def maps(query_params = {})
        request = Request.new(@region, api_path("/map"))
        request.get(query_params)
      end

      def masteries(query_params = {})
        if query_params[:masteryListData]
          query_params[:masteryListData] = query_params[:masteryListData].join(',')
        end
        request = Request.new(@region, api_path("/mastery"))
        request.get(query_params)
      end

      def mastery_by_id(mastery_id, query_params = {})
        if query_params[:masteryListData]
          query_params[:masteryListData] = query_params[:masteryListData].join(',')
        end
        request = Request.new(@region, api_path("/mastery/#{mastery_id}"))
        request.get(query_params)
      end

      def realm
        request = Request.new(@region, api_path("/realm"))
        request.get
      end

      def runes(query_params = {})
        if query_params[:runeListData]
          query_params[:runeListData] = query_params[:runeListData].join(',')
        end
        request = Request.new(@region, api_path("/rune"))
        request.get(query_params)
      end

      def rune_by_id(rune_id, query_params = {})
        if query_params[:runeListData]
          query_params[:runeListData] = query_params[:runeListData].join(',')
        end
        request = Request.new(@region, api_path("/rune/#{rune_id}"))
        request.get(query_params)
      end

      def summoner_spells(query_params = {})
        if query_params[:spellData]
          query_params[:spellData] = query_params[:spellData].join(',')
        end
        request = Request.new(@region, api_path("/summoner-spell"))
        request.get(query_params)
      end

      def summoner_spell_by_id(ss_id, query_params = {})
        if query_params[:spellData]
          query_params[:spellData] = query_params[:spellData].join(',')
        end
        request = Request.new(@region, api_path("/summoner-spell/#{ss_id}"))
        request.get(query_params)
      end

      def versions
        request = Request.new(@region, api_path("/versions"))
        request.get
      end

      protected

      def api_path(additional_path = "")
        "/api/lol/static-data/#{@region}/v1.2" + additional_path
      end
    end
  end
end

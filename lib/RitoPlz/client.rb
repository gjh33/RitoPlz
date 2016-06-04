require 'RitoPlz/API/champion'

module RitoPlz
  class Client
    def initialize(params = {})
      @region = params[:region] || RitoPlz.configuration.default_region
    end

    def champion
      RitoPlz::API::Champion.new(@region)
    end
  end
end

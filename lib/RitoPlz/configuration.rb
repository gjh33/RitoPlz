module RitoPlz
  class Configuration
    attr_accessor :api_key, :region

    def initialize(params = {})
      @api_key = params [:api_key] || "No API key provided"
      @region = params [:region] || "na"
    end
  end
end

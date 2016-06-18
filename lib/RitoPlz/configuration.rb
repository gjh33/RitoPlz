module RitoPlz
  class Configuration
    attr_accessor :api_key, :default_region

    def initialize(params = {})
      @api_key = params[:api_key] || "Please configure your API key"
      @default_region = params[:default_region] || "na"
    end
  end
end

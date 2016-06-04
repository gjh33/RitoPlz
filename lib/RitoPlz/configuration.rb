module RitoPlz
  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = "No API key provided"
    end
  end
end

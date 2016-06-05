require "RitoPlz/version"
require "RitoPlz/configuration"
require "RitoPlz/client"

module RitoPlz
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.reset
    @configuration = Configuration.new
  end
end

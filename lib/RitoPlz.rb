require "RitoPlz/version"
require "RitoPlz/configuration"
require "RitoPlz/client"

module RitoPlz
  REGION_TO_PLATFORM = {
    na: :na1,
    euw: :euw1,
    eune: :eun1,
    jp: :jp1,
    kr: :kr,
    oce: :oc1,
    br: :br1,
    lan: :la1,
    las: :la2,
    ru: :ru,
    tr: :tr1,
    pbe: :pbe1
  }

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

  def self.to_platform(region)
    region = region.to_sym
    REGION_TO_PLATFORM[region]
  end
end

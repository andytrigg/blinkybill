require 'blinky/no_supported_devices_found'
require 'blinky/light_factory'

module Blinky

  def self.new
    Blinky.new
  end

  class Blinky

    def initialize(path = File.dirname(__FILE__))
      Dir["#{path}/ci_server_plugins/**/*.rb"].each { |f| require(f) }
      @plugins = []
      instance_eval(File.read("#{path}/plugins.rb"))

      @lights = LightFactory.detect_lights(@plugins)
    end

    def lights
      @lights
    end

    def light
      @lights.first
    end

    def plugin plugin_module
      @plugins << plugin_module
    end

  end

end
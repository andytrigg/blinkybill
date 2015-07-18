require 'blink1'
require 'blinky/light'

module Blinky
  class LightFactory

    def self.detect_lights plugins
      lights = []

      Blink1.list.each do |device|
        # lights << Light.new
        lights << Light.new(device, plugins)
      end
      raise NoSupportedDevicesFound.new if lights.empty?
      lights
    end

  end
end
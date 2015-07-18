
module Blinky
  class NoSupportedDevicesFound < RuntimeError
    def initialize
    end

    def to_s
      "Blinky Bill was unable to find a supported device \n"
    end

  end
end
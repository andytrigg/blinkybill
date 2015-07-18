module Blinky
  class Light

    def initialize device_handle, plugins
      @blinkLight = Blink1.new(device_handle)
      plugins.each do |plugin|
        self.extend(plugin)
      end
      self.init
    end

    def where_are_you?
      5.times do
        failure!
        sleep(0.5)
        success!
        sleep(0.5)
      end
      off!
    end

    def success!
      stop
      set_colour(0, 255, 0)
    end

    def failure!
      stop
      play
    end

    def building!
      stop
      set_colour(0, 0, 255)
    end

    def warning!
      stop
      set_colour(255, 42 , 0)
    end

    def off!
      stop
      set_colour(0, 0 , 0)
    end

    def init
      set_flash_pattern
    end

    private
    def set_colour r, g, b
      @blinkLight.set_rgb(r, g, b)
    end

    def play
      @blinkLight.play 0
    end

    def stop
      @blinkLight.off
    end

    def set_flash_pattern
      @blinkLight.write_pattern_line(50, 255, 0, 0, 0)
      @blinkLight.write_pattern_line(50, 220, 0, 0, 1)
      @blinkLight.write_pattern_line(50, 185, 0, 0, 2)
      @blinkLight.write_pattern_line(50, 150, 0, 0, 3)
      @blinkLight.write_pattern_line(50, 115, 0, 0, 4)
      @blinkLight.write_pattern_line(50, 80, 0, 0, 5)
      @blinkLight.write_pattern_line(50, 45, 0, 0, 6)
      @blinkLight.write_pattern_line(50, 80, 0, 0, 7)
      @blinkLight.write_pattern_line(50, 115, 0, 0, 8)
      @blinkLight.write_pattern_line(50, 150, 0, 0, 9)
      @blinkLight.write_pattern_line(50, 185, 0, 0, 10)
      @blinkLight.write_pattern_line(50, 220, 0, 0, 11)
    end

  end

end
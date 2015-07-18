require 'chicanery/cctray'
require 'chicanery'
module Blinky
  module CCTrayServer
    include Chicanery

    def watch_cctray_server url, options = {}
      server Chicanery::Cctray.new 'blinky build', url, options


      when_run do |current_state|
        if current_state.building?
          building!
        else
          if current_state.site_down?
            warning!
          else
            current_state.has_failure? ? failure! : success!
          end
        end

      end

      begin
        run_every 15
      rescue => e
        warning!
        raise e
      end
    end
  end
end
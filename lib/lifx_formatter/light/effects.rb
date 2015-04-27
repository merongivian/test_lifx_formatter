module Light
  class Effects
    def initialize(light)
      @light = light
    end

    def red
      @light.set_color(LIFX::Color.red)
    end

    def green
      @light.set_color(LIFX::Color.green)
    end

    def red_beam
      red
      sleep(5)
      @light.turn_off!
    end

    def green_beam
      green
      sleep(5)
      @light.turn_off!
    end
  end
end

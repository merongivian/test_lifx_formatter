module Light
  class Effects
    DELAY = 0.4

    def initialize(light)
      @light = light
      dark
    end

    def red_alert
      @light.set_color(LIFX::Color.red)
    end

    def green_alert
      @light.set_color(LIFX::Color.green)
    end

    def red_pulse
      pulse(LIFX::Color.red)
      sleep(DELAY)
    end

    def green_pulse
      pulse(LIFX::Color.green)
      sleep(DELAY)
    end

    def yellow_pulse
      pulse(LIFX::Color.yellow)
      sleep(DELAY)
    end

    private

    def pulse(color)
      @light.pulse(color, duty_cycle: 0.01, period: 0.5)
    end

    def dark
      black_color = LIFX::Color.new(0,0,0,3500)
      @light.set_color(black_color)
    end
  end
end

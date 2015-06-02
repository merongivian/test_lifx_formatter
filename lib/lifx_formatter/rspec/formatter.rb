module RSpec
  class Formatter
    Core::Formatters.register(
      self,
      :start,
      :example_started, :example_passed, :example_pending, :example_failed,
      :dump_summary, :close
    )

    def initialize(_output)
      @light_effects = begin
        light = Light::Client.find
        Light::Effects.new light
      end
    end

    def start
      sleep(2)
    end

    def example_started(_notification); end

    def example_passed(_notification)
      @light_effects.green_pulse
    end

    def example_failed(_notification)
      @light_effects.red_pulse
    end

    def example_pending(_notification)
      @light_effects.yellow_pulse
    end
  end
end

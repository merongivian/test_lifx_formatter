module Light
  class ClientConfiguration
    class << self
      def light(label = nil)
        light_with_label(label) || any_light
      end

      private

      def light_with_label(label)
        all_lights = client.lights
        all_lights.with_label(label)
      end

      def any_light
        all_lights = client.lights
        @any_light ||= all_lights.first
      end

      def client
        LIFX::Client.lan.discover!
      end
    end
  end
end

module Light
  class Client
    class << self
      def find(label = nil)
        light_with_label(label) || any_light
      end

      private

      def light_with_label(label)
        all_lights = client.lights
        all_lights.with_label(label)
      end

      def any_light
        @any_light ||= begin
          all_lights = client.lights
          all_lights.first
        end
      end

      def client
        LIFX::Client.lan.discover!
      end
    end
  end
end

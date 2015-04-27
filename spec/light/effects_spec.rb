require 'spec_helper'

describe Light::Effects do
  let(:light) { instance_double 'LIFX::Light' }
  let(:light_effects) do
    described_class.new(light)
  end

  describe "#red" do
    it "turns the light red" do
      red_color = LIFX::Color.red
      expect(light).to receive(:set_color).with(red_color)
      light_effects.red
    end
  end

  describe "#green" do
    it "turns the light green" do
      green_color = LIFX::Color.green
      expect(light).to receive(:set_color).with(green_color)
      light_effects.green
    end
  end
end

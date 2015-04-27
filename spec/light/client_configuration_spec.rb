require 'spec_helper'

describe Light::ClientConfiguration do
  let(:context) { double('context').as_null_object }

  let(:unknown_light) do
    LIFX::Light.new(context: context, label: 'unknown room')
  end

  let(:groovy_light) do
    LIFX::Light.new(context: context, label: 'groovy room')
  end

  let(:lights_collection) do
    LIFX::LightCollection.new(context: context)
  end

  before do
    allow(lights_collection).to receive(:lights)
      .and_return([unknown_light, groovy_light])
    allow_any_instance_of(LIFX::Client).to receive(:lights)
      .and_return(lights_collection)
  end

  describe ".light" do
    it "returns a light with a label name" do
      expect(described_class.light('groovy room')).to eq groovy_light
    end

    it "returns the first light available if no label is provided" do
      expect(described_class.light).to eq unknown_light
    end
  end
end

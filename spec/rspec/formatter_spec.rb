require 'spec_helper'

module RSpec
  RSpec.describe LifxFormatter do
    let(:light_effects) { instance_double('Light::Effects') }
    let(:formatter) { described_class.new(StringIO.new) }
    let(:notification) { double('notification') }

    before do
      allow(Light::Client).to receive(:find)
        .and_return double('light').as_null_object
      allow(Light::Effects).to receive(:new)
        .and_return(light_effects)
      formatter.example_started(notification)
    end

    describe '#example_passed' do
      it "flashes a green color" do
        expect(light_effects).to receive(:green_pulse).once
        formatter.example_passed(notification)
      end
    end

    describe '#example_failed' do
      it "flashes a red color" do
        expect(light_effects).to receive(:red_pulse).once
        formatter.example_failed(notification)
      end
    end

    describe '#example_pending' do
      it "flashes a yellow color" do
        expect(light_effects).to receive(:yellow_pulse).once
        formatter.example_pending(notification)
      end
    end
  end
end

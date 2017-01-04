require 'spec_helper'

describe Safeword do
  it 'has a version number' do
    expect(Safeword::VERSION).not_to be nil
  end

  describe '.new' do
    it 'instantiates a blocker' do
      instance = described_class.new
      expect(instance).to be_an_instance_of(Safeword::Blocker)
    end

    context 'when no parameters are passed in the constructor' do
      it 'instantiates an enabled Blocker' do
        instance = described_class.new
        expect(instance).to be_enabled
      end
    end

    context 'when initialized with enabled: false' do
      it 'instantiates a disabled Blocker' do
        instance = described_class.new(enabled: false)
        expect(instance).not_to be_enabled
      end
    end
  end
end

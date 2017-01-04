require 'spec_helper'

RSpec.describe Safeword::Blocker do
  subject(:blocker) { described_class.new }

  describe '#enabled?' do
    context 'when the blocker is enabled' do
      before { blocker.instance_variable_set(:@enabled, true) }

      it { is_expected.to be_enabled }
    end

    context 'when the blocker is disabled' do
      before { blocker.instance_variable_set(:@enabled, false) }

      it { is_expected.not_to be_enabled }
    end
  end

  describe '#enable' do
    before { blocker.instance_variable_set(:@enabled, false) }

    it 'enables the blocker' do
      expect { blocker.enable }.to change { blocker.enabled? }.from(false).to(true)
    end

    it 'returns self, allowing method chaining' do
      expect(blocker.enable).to eq(blocker)
    end
  end

  describe '#disable' do
    before { blocker.instance_variable_set(:@enabled, true) }

    it 'disables the blocker' do
      expect { blocker.disable }.to change { blocker.enabled? }.from(true).to(false)
    end

    it 'returns self, allowing method chaining' do
      expect(blocker.disable).to eq(blocker)
    end
  end

  describe '.new' do
    it 'instantiates an enabled blocker' do
      expect(described_class.new).to be_enabled
    end
  end
end

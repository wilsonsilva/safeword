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

  describe '.new' do
    it 'instantiates an enabled blocker' do
      expect(described_class.new).to be_enabled
    end
  end
end

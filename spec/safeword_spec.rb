require 'spec_helper'

describe Safeword do
  it 'has a version number' do
    expect(Safeword::VERSION).not_to be nil
  end

  describe '.new' do
    it 'instantiates a Blocker' do
      expect(described_class.new).to be_an_instance_of(Safeword::Blocker)
    end
  end
end

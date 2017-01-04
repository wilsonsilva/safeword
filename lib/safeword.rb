require 'safeword/version'
require 'safeword/blocker'

# Encapsulates the logic of the gem.
module Safeword
  # Instantiates a +Blocker+.
  def self.new(enabled: true)
    Blocker.new(enabled: enabled)
  end
end

require 'safeword/version'
require 'safeword/blocker'

# Encapsulates the logic of the gem.
module Safeword
  # Instantiates a +Blocker+.
  def self.new
    Blocker.new
  end
end

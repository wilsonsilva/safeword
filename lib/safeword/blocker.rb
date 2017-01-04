module Safeword
  # Decides whether blocks of code are executed or not.
  class Blocker
    # Instantiates an enabled blocker.
    def initialize
      @enabled = true
    end

    # Whether the blocker is enabled or not. Enabled blockers prevent blocks of code from being executed.
    def enabled?
      @enabled
    end
  end
end

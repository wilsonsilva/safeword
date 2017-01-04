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

    # Enables the blocker, preventing blocks of code from being executed.
    def enable
      @enabled = true
      self
    end

    # Disables the blocker, allowing blocks of code to be executed.
    def disable
      @enabled = false
      self
    end

    # Ignores the provided block of code if enabled. Executes it otherwise.
    def use
      yield unless enabled?
      self
    end
  end
end

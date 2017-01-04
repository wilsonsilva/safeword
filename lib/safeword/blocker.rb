module Safeword
  # Decides whether blocks of code are executed or not.
  class Blocker
    # Instantiates an enabled blocker.
    def initialize
      @enabled = true
    end

    # Whether the blocker is enabled or not. Enabled blockers prevent blocks of code from being executed.
    #
    # @example Verifying if a blocker is enabled
    #   blocker.enable
    #   blocker.enabled? #=> true
    #   blocker.disable
    #   blocker.enabled? #=> false
    #
    # @return +true+ if the blocker is enabled, +false+ otherwise.
    def enabled?
      @enabled
    end

    # Enables the blocker, preventing blocks of code from being executed.
    #
    # @example Enabling a blocker
    #   blocker.enable
    #   blocker.use { puts 'I wont be executed' } #=> nothing happens
    #
    # @return +self+
    def enable
      @enabled = true
      self
    end

    # Disables the blocker, allowing blocks of code to be executed.
    #
    # @example Disabling a blocker
    #   blocker.disable
    #   blocker.use { puts 'I will be executed' } #=> I will be executed
    #
    # @return +self+
    def disable
      @enabled = false
      self
    end

    # Ignores the provided block of code if enabled. Executes it otherwise.
    #
    # @example Ignoring a block of code when enabled
    #   blocker.enable
    #   blocker.use { puts 'I wont be executed' } #=> nothing happens
    #
    # @example Executing a block of code when disabled
    #   blocker.disable
    #   blocker.use { puts 'I will be executed' } #=> I will be executed
    #
    # @return +self+
    def use
      yield unless enabled?
      self
    end
  end
end

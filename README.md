# Safeword

[![Build Status](https://travis-ci.org/wilsonsilva/safeword.svg?branch=master)](https://travis-ci.org/wilsonsilva/safeword)

Prevents blocks of code from being executed until you consider them safe. Useful if you need to run untested code
in the production console.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'safeword'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safeword

## Usage

Every new instance of Safeword is `enabled` by default. Enabled safewords prevent code from being executed.
Disabled safewords allow it to be executed.

To enable, disable and verifying if a safeword is enabled, you can use `enable`, `disable`
and `enabled?` respectively:

```ruby
require 'safeword'

safeword = Safeword.new
safeword.enabled? # => true

safeword.disable
safeword.enabled? # => false

safeword.enable
safeword.enabled? # => true
```

### Preventing code execution

Instantiate a `Safeword` and pass your wrapped code in a block to its `use` method.

```ruby
require 'safeword'

safeword = Safeword.new
safeword.use { puts 'start war' } #=> nothing happens
```

### Allowing code execution
Call `#disable` on the safeword to allow subsequent calls to `use` to execute the provided code blocks:

```ruby
require 'safeword'

safeword = Safeword.new
safeword.disable
safeword.use { puts 'drop bomb' } #=> drop bomb
```

### Instantiating a disabled safeword
Safewords are enabled by default, but can be disabled during initialization:

```ruby
require 'safeword'

safe = Safeword.new
safe.enabled? #=> true

unsafe = Safeword.new(enabled: false)
unsafe.enabled? #=> false
```

### Chaining methods

The methods `enable`, `disable` and `use` return the word itself, so you can chain multiple calls together:

```ruby
require 'safeword'

Safeword.new
  .disable
  .use { puts 'start war' } #=> start war
  .use { puts 'drop bomb' } #=> drop bomb
  .enable
  .use { puts 'cut fruit' } #=> nothing happens
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wilsonsilva/safeword.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

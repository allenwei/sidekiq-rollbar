# Sidekiq::Rollbar

Report exception to rollbar with job information

## Installation

Add this line to your application's Gemfile:

    gem 'sidekiq-rollbar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq-rollbar

## Usage

You need do is configure rollbar described in [rollbar-gem](https://github.com/rollbar/rollbar-gem)

After just add the middleware
```ruby
require 'sidekiq-rollbar'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Rollbar::Middleware
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

require 'sidekiq'

require "sidekiq/rollbar/version"
require "sidekiq/rollbar/middleware"

module Sidekiq
  module Rollbar
    Sidekiq.configure_server do |config|
      config.server_middleware do |chain|
        chain.add Sidekiq::Rollbar::Middleware
      end
    end
  end
end

require 'rollbar'
module Sidekiq
  module Rollbar
    class Middleware
      include Sidekiq::Util
      def call(worker, msg, queue)
        yield
      rescue Exception => e
        ::Rollbar.log(e, {
          payload: msg,
          queue: queue,
          worker: msg['class'],
          processor:  "#{identity}-#{Thread.current.object_id}"
        })
        raise e
      end
    end
  end
end

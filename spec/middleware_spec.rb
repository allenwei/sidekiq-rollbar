require 'spec_helper'


describe Sidekiq::Rollbar::Middleware do

  it "should report exception to Rollbar" do
    exception = RuntimeError.new
    Rollbar.should_receive(:report_exception).with(exception, hash_including(payload: "message", queue: "default"))
    expect {
      Sidekiq::Rollbar::Middleware.new.call(stub, "message", "default") do
        raise exception
      end
    }.to raise_error
  end

  it "should add middleware into sidekiq queue" do
    Sidekiq.configure_server do |config|
      config.server_middleware do |chain|
        chain.exists?(Sidekiq::Rollbar::Middleware).should be_true
      end
    end
  end
end

require 'spec_helper'

RSpec.describe Sidekiq::Rollbar::Middleware do
  subject { Sidekiq::Rollbar::Middleware.new }

  let!(:exception) { RuntimeError.new }
  let!(:worker){ double }

  it 'should report exception to Rollbar' do
    expect(Rollbar).to receive(:log).with(
      exception,
      hash_including(payload: "message", queue: "default")
    )

    expect do
      subject.call(worker, "message", "default") { raise exception }
    end.to raise_error(RuntimeError)
  end

  it 'should not add middleware into sidekiq queue' do
    middlewares = Sidekiq.server_middleware.entries.map(&:klass)
    expect(middlewares).not_to include(Sidekiq::Rollbar::Middleware)
  end
end

# frozen_string_literal: true

require "immutable/hash"

require "simple_middleware/version"
require "simple_middleware/middleware"

module SimpleMiddleware
  # Runs a chain of middlewares with the provided initial state, returning the
  # result of the chain of middlewares
  #
  # @param [Hash, Immutable::Hash] the initial state to be passed into the chain of
  #   middlewares
  # @param [Array<SimpleMiddleware::Middleware>] the middlewares to be run
  def self.call(initial_state: {}, middlewares:)
    middleware_chain = middlewares.reverse.reduce(nil) do |next_middleware, middleware|
      middleware.new(next_middleware)
    end

    middleware_chain.call(Immutable::Hash.new(initial_state))
  end
end

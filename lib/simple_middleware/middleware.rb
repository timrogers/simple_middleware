# frozen_string_literal: true

module SimpleMiddleware
  class Middleware
    # @param [#call] the next middleware in the chain, which can be anything
    #   that responds to #call, accepting the current state, an
    #   `Immutable::Hash`, as a parameter
    def initialize(next_middleware)
      @next_middleware = next_middleware
    end

    # Runs the middleware, either returning a result (probably a Rack response)
    # or calling the next middleware in the chain, giving it the opportunity to
    # return a result
    #
    # @param [Immutable::Hash] the current state
    def call(_state)
      raise NotImplementedError
    end

    private

    attr_reader :next_middleware
  end
end

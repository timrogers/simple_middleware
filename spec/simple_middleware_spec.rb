# frozen_string_literal: true

RSpec.describe SimpleMiddleware do
  describe ".call" do
    subject { described_class.call(middlewares: middlewares) }

    let(:first_middleware) do
      Class.new(SimpleMiddleware::Middleware) do
        def call(state)
          new_state = state.put(:foo, :bar)
          next_middleware.call(new_state)
        end
      end
    end

    let(:second_middleware) do
      Class.new(SimpleMiddleware::Middleware) do
        def call(state)
          render status: 200,
                 headers: { "Content-Type" => "text/plain" },
                 body: state[:foo]
        end
      end
    end

    let(:middlewares) { [first_middleware, second_middleware] }

    it { is_expected.to eq([200, { "Content-Type" => "text/plain" }, :bar]) }

    context "with an initial state supplied" do
      subject(:call) do
        described_class.call(initial_state: initial_state, middlewares: middlewares)
      end

      let(:initial_state) { { bar: :baz } }

      it { is_expected.to eq([200, { "Content-Type" => "text/plain" }, :bar]) }

      it "doesn't mutate the initial state" do
        expect { call }.to_not(change { initial_state })
      end
    end
  end
end

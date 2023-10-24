require 'swagger_helper'

RSpec.describe 'API greeting get', type: :request do
  describe 'API' do
    path '/api/greetings' do
      get 'Return a random greeting' do
        produces 'application/json'
        response '200', 'OK' do
          Greeting.create(id: rand(15..100_000), text: 'Greet 1')
          Greeting.create(id: rand(15..100_000), text: 'Greet 2')
          Greeting.create(id: rand(15..100_000), text: 'Greet 3')
          Greeting.create(id: rand(15..100_000), text: 'Greet 4')
          Greeting.create(id: rand(15..100_000), text: 'Greet 5')
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string }
                 },
                 required: %w[id text]
          run_test!
        end
      end
    end
  end
end

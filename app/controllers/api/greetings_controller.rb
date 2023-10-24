class Api::GreetingsController < ApplicationController
  def index
    greetings = Greeting.all
    random_greeting = greetings.sample
    render json: random_greeting, status: :ok
  end
end

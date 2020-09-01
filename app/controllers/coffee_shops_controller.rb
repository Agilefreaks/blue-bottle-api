class CoffeeShopsController < ApplicationController
  before_action :authorize!

  def authorize!
    token or head :unauthorized
  end

  def index
    respond_to do |format|
      format.csv do
        choose_random_response
      end
    end
  end

  def choose_random_response
    ok_response_odds = 5/10.0
    unauthorized_response_odds = 2/10.0
    unavailable_response_odds = 2/10.0

    rng = Random.new
    roll = rng.rand(1.0)

    if roll < ok_response_odds
      send_file("data/coffee_shops.csv")
    elsif roll < ok_response_odds + unauthorized_response_odds
      token.invalidate!
      head :unauthorized
    elsif roll < ok_response_odds + unauthorized_response_odds + unavailable_response_odds
      head :service_unavailable
    else
      sleep 30.minute
      head :gateway_timeout
    end
  end

  private

    def token
      @token ||= Token.find_by(value: request.headers['X-Token'])
    end
end

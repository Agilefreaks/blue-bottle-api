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

    case token.used_count
    when 4
      head :service_unavailable
    when 7
      sleep 30.minute
      head :gateway_timeout
    when 10
      token.invalidate!
      head :unauthorized
    else
      send_file("data/coffee_shops.csv")
    end
  end

  private

    def token
      @token ||= Token.find_by(value: request.headers['X-Token']).tap do |t|
        t.increment!(:used_count)
      end
    end
end

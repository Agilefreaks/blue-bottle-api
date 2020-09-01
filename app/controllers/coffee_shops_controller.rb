class CoffeeShopsController < ApplicationController
  before_action :authorize!

  def authorize!
    token or head :unauthorized
  end

  def index
    case token.used_count
    when 4
      head :service_unavailable
    when 7
      sleep 2.minute
      head :gateway_timeout
    when 10
      token.invalidate!
      head :unauthorized
    else
      respond_to do |format|
        format.json do
          CoffeeShop.all.map(&:as_json)
        end
      end
    end
  end

  private

    def token
      @token ||= Token.find_by(value: request.headers['X-Token']).tap do |t|
        t.increment!(:used_count)
      end
    end
end

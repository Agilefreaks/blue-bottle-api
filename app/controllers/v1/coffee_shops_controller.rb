module V1
  class CoffeeShopsController < ApplicationController
    before_action :authorize!

    add_to_doc_section(ApiVersion::V1_DOCS)

    get :index, '/v1/coffee_shops', 'Responds with a list of coffee shops.' do
      params do
        query do
          string :token, 'Access Token', required: true
        end
      end

      response 200, 'The coffee shop list'
      response 401, 'Unauthorized.'
      response 406, 'Unacceptable Accept format.'
      response 503, 'Service Unavailable'
      response 504, 'Timeout'
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
            render json: CoffeeShop.all.map(&:as_json)
          end
        end
      end
    end

    private

      def authorize!
        token or head :unauthorized
      end

      def token
        @token ||= Token.find_by(value: params[:token])&.tap do |t|
          t.increment!(:used_count)
        end
      end
  end
end

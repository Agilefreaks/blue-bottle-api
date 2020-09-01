class TokensController < ApplicationController
  def create
    render json: { token: Token.create(value: SecureRandom.hex).value }
  end
end

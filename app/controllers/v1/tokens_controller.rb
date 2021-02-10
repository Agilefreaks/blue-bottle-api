module V1
  class TokensController < ApplicationController
    add_to_doc_section(ApiVersion::V1_DOCS)

    post :create, '/v1/tokens', 'Responds with a token' do
    end
    def create
      render json: { token: Token.first_or_create.value }
    end
  end
end

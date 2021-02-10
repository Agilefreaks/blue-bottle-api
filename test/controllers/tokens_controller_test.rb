require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  test 'when no token exists, issues new token' do
    assert_difference -> { Token.count } do
      post v1_tokens_path, as: :json
    end
  end
end

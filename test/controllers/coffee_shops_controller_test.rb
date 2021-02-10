require 'test_helper'

class CoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  test 'when no token exists, issues new token' do
    token = Token.create

    get v1_coffee_shops_path, params: { token: token.value }, headers: { 'Accept' => 'application/json' }
    assert_equal(200, response.status)

    get v1_coffee_shops_path, params: { token: token.value }, headers: { 'Accept' => 'application/json' }
    assert_equal(200, response.status)

    get v1_coffee_shops_path, params: { token: token.value }, headers: { 'Accept' => 'application/json' }
    assert_equal(200, response.status)

    get v1_coffee_shops_path, params: { token: token.value }, headers: { 'Accept' => 'application/json' }
    assert_equal(503, response.status)
  end
end

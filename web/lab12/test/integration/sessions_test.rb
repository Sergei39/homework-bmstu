
require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should reg and log' do
    post users_path, params: { user: { username: 'username', password: 'net' } }
    assert_response :redirect
    post session_index_url, params: { session: { email: 'username', password: 'net' } }
    assert_response :redirect
  end

  test 'should redirect to login' do
    get '/manager/input'
    assert_response :redirect
    assert_redirected_to '/session/login'
  end
end
require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/session/login'
    assert_response :success
  end

  test 'should login' do
    get '/session/login', params: { username: users(:one).username, password_digest: '2341' }
    assert_response :success
  end

  test 'should not login' do
    assert_raises 'InvalidHash' do
      post '/session/login', params: { username: 'ssss', password_digest: 'parol' }
    end
  end

  test 'should redirect to signin' do
    get '/manager/input'
    assert_response :redirect
    assert_redirected_to '/session/login'
  end

end

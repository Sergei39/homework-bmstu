# frozen_string_literal: true

require 'test_helper'

# main tests
class ManagerControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get manager_input_url
    assert_response :success
  end

  test 'should get view' do
    get manager_view_url
    assert_response :success
  end

  test 'should get 5 for 25 and 35' do
    get manager_view_url, params: { number: 10 }
    result = assigns[:result]
    assert_result = [13, 19]
    assert_equal assert_result, result
  end

  test 'should get incorrect data' do
    get manager_view_url, params: { number: 'str' }
    assert_equal assigns[:result], 'Please, input valid number'
  end
end

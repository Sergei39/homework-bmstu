# frozen_string_literal: true

require 'test_helper'

# main tests
class IoManagerControllerTest < ActionController::TestCase
  test 'should get input view' do
    get :input
    assert_response :success
  end

  test 'should get output view' do
    get :output
    assert_response :success
  end

  test 'test result with correct number' do
    get :output, params: { number: '10' }
    result = assigns[:result]
    assert_result = [13, 19]
    assert_equal assert_result, result
  end

  test 'test result with incorrect input' do
    get :output, params: { number: 'a' }
    assert_equal assigns[:result], 'Please, input valid number'
  end
end

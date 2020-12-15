require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get manager_input_url
    assert_response :success
  end

  test "should get output" do
    get manager_output_url
    assert_response :success
  end

end

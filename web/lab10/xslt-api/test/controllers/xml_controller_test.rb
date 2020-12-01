require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  test 'check rss format' do
    get '/', params: { number: 10, format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end

  test 'check xml format' do
    get '/', params: { number: 10, format: :xml }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end
end

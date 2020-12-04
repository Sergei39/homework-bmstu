# frozen_string_literal: true

require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  test 'test_save_db' do
    instance = Result.new(value: 30, result: ActiveSupport::JSON.encode([41, 43]))
    assert instance.save
    instance.delete
  end

  test 'test_unique_value' do
    instanse1 = Result.new(value: 20, result: ActiveSupport::JSON.encode([29, 31]))
    instanse1.save
    instance2 = Result.new(value: 20, result: ActiveSupport::JSON.encode([29, 31]))
    instance2.validate
    assert_equal instance2.errors[:value], ['has already been taken']
  end

  test 'test_get_db' do
    instance = Result.new(value: 30, result: ActiveSupport::JSON.encode([41, 43]))
    assert instance.save
    assert_equal ActiveSupport::JSON.encode([41, 43]), Result.find_by_value(30).result
  end
end

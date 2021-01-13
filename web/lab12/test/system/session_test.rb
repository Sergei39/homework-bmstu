require 'application_system_test_case'
require 'capybara/rspec'

class SessionTest < ApplicationSystemTestCase
  test 'should do' do
    visit '/session/login'
    fill_in 'Email', with: 'adsf'
    fill_in 'Password', with: 'afg'
    click_on 'Sign in'
    assert_text 'Invalid email/password combination.'
  end

  test 'should do do' do
    User.new(username: 'user', password: 'password').save
    visit 'session/login'
    fill_in 'Email', with: 'user'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    assert_text 'Input data'
  end

  test 'should do do do' do
    visit 'session/login'
    fill_in 'user[username]', with: 'Name'
    fill_in 'user[password]', with: '1234'
    click_on 'commit'
    assert_text 'Sign in'
  end

  test 'should do do do do' do
    User.new(username: 'user', password: 'password').save
    visit signin_url
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    fill_in 'number', with: '10'
    click_on 'Calc result'
    assert_text 'Output data'
  end
end


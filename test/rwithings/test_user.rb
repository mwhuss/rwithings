require 'helper'

class TestUser < Test::Unit::TestCase
  should "raise exception when no API Key is set" do
    unconfigure
    assert_raise RWithings::ApiKeyError do
      RWithings::User.find(42)
    end
  end
  
  should "return someting when retreivcing user" do
    FakeWeb.register_uri(:get, %r|http://wbsapi\.withings\.net\/user|, :body => response_file('getbyuserid.json'), :content_type => 'application/json')
    user = RWithings::User.find(42)
    assert user.is_a?(RWithings::User)
    assert_equal 29, user.id
    assert_equal "John", user.first_name
    assert_equal "Doe", user.last_name
    assert_equal "JON", user.short_name
    assert_equal :male, user.gender
    assert_equal Time.at(211629600), user.birthdate
    assert_equal 1, user.is_public
  end
  
end

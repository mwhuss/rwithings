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
    assert RWithings::User.find(42).is_a?(RWithings::User)
  end
  
end

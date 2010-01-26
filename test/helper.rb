require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fakeweb'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rwithings'



class Test::Unit::TestCase
  def setup
    FakeWeb.allow_net_connect = false
    configure
  end
  
  def configure
    RWithings.configure do |c|
      c.api_key   = "3412ax3958273vc8"
      c.email     = "email@domain.com"
      c.password  = "password"
    end
  end
  
  def unconfigure
    RWithings.configure { |c| c.api_key = c.email = c.password = nil }
  end
  
  def response_file(filename)
    data = ''
    dir = Pathname(__FILE__).dirname.expand_path
    f = File.open(dir + "json_responses/#{filename}", "r") 
    f.each_line { |line| data += line }
    data
  end
  
end

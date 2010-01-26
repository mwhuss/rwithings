require 'httparty'

dir = Pathname(__FILE__).dirname.expand_path

require dir + 'rwithings/rwithings'
require dir + 'rwithings/rwithings/api_key_error'
require dir + 'rwithings/rwithings/email_and_password_error'
require dir + 'rwithings/rwithings/base'
require dir + 'rwithings/rwithings/user'
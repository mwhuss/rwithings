class RWithings::Base
  include HTTParty
  format :json
  base_uri 'wbsapi.withings.net'
  
  class << self
    
    def check_api_key!
      config = RWithings.configuration
      raise RWithings::ApiKeyError.new('API Key must be set') if config.nil? || config.api_key.nil?
      config.api_key
    end
    
    def check_email_and_password!
      config = RWithings.configuration
      raise RWithings::EmailAndPasswordError.new('Email and Password must be set') if config.nil? || config.email.nil? || config.password.nil?
      config.api_key
    end
    
  end
  
end
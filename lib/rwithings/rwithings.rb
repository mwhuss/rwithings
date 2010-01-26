class RWithings
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :email, :password

    def initialize
      @api_key = @email = @password =  nil
    end
  end
  
  
end
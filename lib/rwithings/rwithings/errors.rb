module RWithings
  
  class ApiKeyError < StandardError
    def initialize(msg=nil)
      super("The API key must be set")
    end
  end
  
  class EmailAndPasswordError < StandardError
    def initialize(msg=nil)
      super("The email and password must be set")
    end
  end
  
  
  # Withings service errors
  
  class UnknownError < StandardError
    def initialize(msg=nil)
      super("An unknown error occured (2555)")
    end
  end
  
  class UserIdError < StandardError
    def initialize(msg=nil)
      super("The userid is absent or incorrect (247)")
    end
  end
  
  class UserIdPublickKeyMismatchError < StandardError
    def initialize(msg=nil)
      super("The userid and publickey do not match, or the user does not share its data. (250)")
    end
  end
  
  class InvalidHash < StandardError
    def initialize(msg=nil)
      super("The hash is missing, invalid, or does not match the provided email (100)")
    end
  end
  
end
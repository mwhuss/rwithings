class RWithings::User < RWithings::Base
  
  attr_accessor :short_name, :is_public, :birthdate, :gender, :last_name, :id, :fat_method, :first_name
  
  class << self

    def find(id)
      return all if id == :all
      
      api_key = check_api_key!
      
      res       = get("/user?action=getbyuserid&userid=#{id}&publickey=#{api_key}")
      user_res  = res['body']['users'][0]
      user      = new
    
      user.short_name   = user_res['shortname']
      user.is_public    = user_res['ispublic']
      user.birthdate    = Time.at(user_res['birthdate'])
      user.gender       = user_res['gender'] == 0 ? :male : :female
      user.id           = user_res['id']
      user.fat_method   = user_res['fatmethod']
      user.first_name   = user_res['firstname']
      user.last_name    = user_res['lastname']
    
      user
    end
  
    def all
      raise "Not yet implemented"
      #res       = get("/user?action=getbyuserid&userid=#{id}&publickey=#{RWithings.configuration.api_key}")
    end

  end

end
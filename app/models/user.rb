class User < ApplicationRecord
    has_secure_password # This method is provided by 'bcrypt' gem and stores the password by default into the field named 'password_digest'
                        # so model should have this field. In case we need to customize this this can written in the following way
                        # has_secure_password :my_password
                        # where password will be stored inside 'my_password' field of the user model

    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
end

# https://www.linkedin.com/pulse/mastering-restful-apis-rails-quick-guide-david-raja-mcppc/?trackingId=gKpLcdxhkWrvE9ZgEuIPXw%3D%3D
# https://medium.com/simform-engineering/authentication-using-session-rails-c3d6ef8b5397#:~:text=Create%20a%20user%20model%20that%20includes%20a%20password%20and%20email%20field.&text=Use%20the%20following%20command%20to,above%20to%20generate%20the%20model.&text=Create%20a%20user%20table%20and%20load%20the%20schema%20file.&text=For%20storing%20passwords%20in%20an,case%2C%20we%20utilized%20password%20digest.
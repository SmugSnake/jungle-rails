require 'bcrypt'

class User < ActiveRecord::Base
# users.password_hash in the database is a :string
  include BCrypt

  validates :email, uniqueness: true


    

    has_secure_password

end

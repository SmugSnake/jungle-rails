require 'bcrypt'

class User < ActiveRecord::Base
# users.password_hash in the database is a :string
  include BCrypt

  validates :email, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :first_name, presence: true
  validates :last_name, presence: true


  has_secure_password

  def self.authenticate_with_credentials(params)
    email = params[:email].downcase.gsub(" ", "").strip.squish
   if user = User.find_by_email(email)
    user.authenticate(params[:password])
   else
    nil
   end
  end 


end

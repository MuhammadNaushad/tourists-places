require "bcrypt"

module BcryptModule
  puts "Module LOADED Successfully!!!"

  # self is optional in module but it is a good practice to use self to define class methods in module
  def create_hash_password(password)
  BCrypt::Password.create(password)
  end

  def BcryptModule.verify_hash_password(password)
    BCrypt::Password.new(password)
  end

  def self.create_secure_user(list_of_users)
    list_of_users.each do |user|
      user[:password] = create_hash_password(user[:password])
    end
    list_of_users
  end

  def BcryptModule.auth_user(username, password, list_of_users)
    list_of_users.each do |user|
      if user[:username]==username && verify_hash_password(user[:password])==password
        return user
      end
    end
    "Unauthenticate User"
  end
end

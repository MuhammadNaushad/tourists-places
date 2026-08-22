require "bcrypt"

# my_password = BCrypt::Password.create("my password")
# #=> "$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey"

# puts my_password.version              #=> "2a"
# puts my_password.cost                 #=> 12
# puts my_password == "my password"     #=> true
# puts my_password == "not my password" #=> false
# puts my_password
# my_password = BCrypt::Password.new("$2a$12$lK.evKg6TQgkNnoMSM7np.sFu6.hWwx0397.4RGyjYyo0JY0smkhW")
# puts my_password == "my password"     #=> true
# puts my_password == "not my password" #=> false
# my_password = BCrypt::Password.create("my password")
# my_password1 = BCrypt::Password.create("my password")
# my_password2 = BCrypt::Password.create("my password")

# puts my_password
# puts my_password1
# puts my_password2




users = [
  {
    username: "Naushad Ahmad", password: "123456"

  },
  {
    username: "Neyaz Ahmad", password: "123456"

  },
  {
    username: "M Ahmad", password: "123456"

  },
  {
    username: "M Naushad", password: "123456"

  }
]

def create_hash_password(password)
  BCrypt::Password.create(password)
end

def verify_hash_password(password)
  BCrypt::Password.new(password)
end

def create_secure_user(list_of_users)
  list_of_users.each do |user|
    user[:password] = create_hash_password(user[:password])
  end
  list_of_users
end

puts create_secure_user(users)

def auth_user(username, password, list_of_users)
  list_of_users.each do |user|
    if user[:username]==username && verify_hash_password(user[:password])==password
      return user
    end
  end
  "Unauthenticate User"
end


puts "******* Welcome to authenticator ********"
puts authenticated_user = auth_user("Naushad Ahmad", "1234565", users)

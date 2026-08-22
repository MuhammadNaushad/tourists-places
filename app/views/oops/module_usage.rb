require_relative "bcrypt_module"

# OR
# $LOAD_PATH << "."
# require "bcyrpt_module"

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

hashed_users = BcryptModule.create_secure_user(users)
puts hashed_users

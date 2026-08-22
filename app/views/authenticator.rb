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

def auth_user(username, password, users_list)
  users_list.each do |user|
    if user[:username]==username&& user[:password]==password
       return  user
    end
  end
  "Credentials not correct!!!"
end

puts "******* Welcome to authenticator ********"
40.times { print "-" }
puts
puts "This program will take username and password to take into it"
puts "If password will match then you will see the User Object"

attempts = 1

while attempts<4
  print "Username: "
  username= gets.chomp
  print "Password: "
  password=gets.chomp

user_obj=auth_user(username, password, users)
puts user_obj

puts "Press n to quit the program"
input= gets.chomp.downcase
if input =="n"
  break
end
  attempts += 1
end
puts "You have exceeded the number of attempts. Try again later." if attempts==4

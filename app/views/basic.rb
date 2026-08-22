# print "Hello World\n"
# p "Hello World"
# puts "Hello World"
# printf "Hello World\n"

# name="Hello Naushad"
# puts name

# def say_to_world(message)
#   puts message
# end

# say_to_world ("Hello Naushad, Ruby is great!")

# gets.chomp
# first_name = "Md Naushad"
# correct_name= first_name.sub("Md", "Muhammad")
# puts correct_name

# puts "what is your first name"
# first_name= gets.chomp
# puts "What is your last name"
# last_name=gets.chomp
# full_name= "#{first_name} #{last_name}"
# puts "Your full name is #{first_name} #{last_name}"
# puts "Your full name reverse is #{full_name.reverse}"
# puts "Your full name length is #{full_name.length-1}"
#
# 20.times {
#   puts("1")
# }

def multiply (num_1, num_2)
  num_1.to_f * num_2.to_f
end
def devision (num_1, num_2)
  num_1.to_f / num_2.to_f
end
def substract (num_1, num_2)
  num_1.to_f - num_2.to_f
end
def addition (num_1, num_2)
  num_1.to_f + num_2.to_f
end
def mod (num_1, num_2)
  num_1.to_f % num_2.to_f
end

20.times {
  print "-"
}
puts
puts "Enter your first number"
num_1= gets.chomp
puts "Enter your second number"
num_2 = gets.chomp
# result=multiply(num_1, num_2)
# puts "Multiplication is #{result}"
# puts "Addition is #{addition(num_1, num_2)}"
# puts "Substraction is #{substract(num_1, num_2)}"
# puts "Division is #{devision(num_1, num_2)}"
# puts "Mod is #{mod(num_1, num_2)}"

puts "what do you want to do ?"
puts "1 for Multiplication, 2 for Addition , 3 for Substraction and 4 is for Mod"

user_entry = gets.chomp

if user_entry=="1"
  puts "Multiplication is #{result}"

elsif user_entry=="2"
 puts "Addition is #{addition(num_1, num_2)}"

elsif user_entry == "3"
  puts "Substraction is #{substract(num_1, num_2)}"

elsif user_entry == "4"
  puts "Mod is #{mod(num_1, num_2)}"

else
  puts "Invalid Entry"
end

#
#
# 10==10
# 10!=2
# 10<20
# 20>10
# 20>=20

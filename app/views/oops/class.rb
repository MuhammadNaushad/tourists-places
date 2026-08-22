require_relative "bcrypt_module"

class Student
  include BcryptModule
  attr_accessor :name, :age, :roll_no, :email
  # attr_reader :email

  # @name
  # @age
  # @roll_no
  # @email

  def initialize(name, age, roll_no, email)
    @name = name
    @age = age
    @roll_no = roll_no
    @email = email
  end



  def to_s
    "Student name: #{@name}, age: #{@age}, roll number: #{@roll_no}, email: #{@email}"
  end
end

naushad = Student.new("Naushad", 31, 101, "naushad@gmail.com")
nadeem = Student.new("Nadeem", 29, 102, "nadeem@gmail.com")
puts naushad
puts nadeem
naushad.email = nadeem.email
puts "Naushad's email is now #{naushad.email}"

# Use of Module
hashed_naushad = naushad.create_hash_password(naushad.email)
puts hashed_naushad

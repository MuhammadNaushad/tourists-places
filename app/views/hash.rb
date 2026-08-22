# Hashes or  Map or Dictionary
my_details = { "Name"=> "Naushad", "age"=> 31, "Address"=> "Nagpur" }
puts my_details
# puts my_details["Name"]
# puts my_details["age"]
# another_hash = { a: "1", b: 2, c: true }
# puts another_hash
# puts another_hash[:a]
# puts another_hash.keys

# my_details.each do |key, value|
#   puts "class of key #{key.class} , value of class #{value.class}"
# end

# my_details["DOB"] = "25-07-1994"
# my_details[:d] = "25-07-1995"
# puts my_details
# my_details.each { |key, value| puts "class of key #{key.class} , value of class #{value.class}" }
my_details.select do |k, v|
  v.is_a?(String)
end
my_details.each do |k, v|
  my_details.delete(k) if v.is_a?(String)
end
puts my_details

my_details = { "Name"=> "Naushad", "age"=> 31, "Address"=> "Nagpur" }
puts my_details

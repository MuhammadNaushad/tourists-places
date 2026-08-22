# Ruby me “named parameters” ko **keyword arguments** bolte hain. Ye function (method) define karte time `name: value` format me pass hote hain.

# ### 🔹 Basic Example

# ```ruby
# def greet(name:, age:)
#   puts "Hello #{name}, age #{age}"
# end

# greet(name: "Naushad", age: 25)
# ```

# 👉 Yaha `name:` aur `age:` **required keyword arguments** hain.

# ---

# ### 🔹 Default Value ke saath

# ```ruby
# def greet(name:, age: 18)
#   puts "Hello #{name}, age #{age}"
# end

# greet(name: "Naushad")   # age automatically 18
# ```

# ---

# ### 🔹 Optional Named Parameters (multiple)

# ```ruby
# def user_info(name:, city: "Pune", country: "India")
#   puts "#{name} from #{city}, #{country}"
# end

# user_info(name: "Naushad")
# user_info(name: "Ali", city: "Mumbai")
# ```

# ---

# ### 🔹 Mixed (Normal + Named)

# ```ruby
# def display(id, name:, role:)
#   puts "ID: #{id}, Name: #{name}, Role: #{role}"
# end

# display(1, name: "Naushad", role: "Developer")
# ```

# ---

# ### 🔹 Double Splat (Dynamic Named Params)

# Agar tum unknown number of named params lena chahte ho:

# ```ruby
# def details(**kwargs)
#   puts kwargs
# end

# details(name: "Naushad", age: 25, city: "Pune")
# ```

# ---

# ### 🔑 Important Points

# * Named params order important nahi hota
# * Readability improve hoti hai
# * Large methods me best practice hai

# ---

# Agar chaho to main tumhe **real project example (API call ya Rails controller)** me bhi samjha sakta hu 👍

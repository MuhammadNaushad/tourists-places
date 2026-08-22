area_code = {
  "New Jersey" => "201",
  "Washington, D.C." => "202",
  "Connecticut" => "203",
  "Manitoba" => "204",
  "Alabama" => "205",
  "Florida" => "206",
  "Georgia" => "207",
  "Maine" => "208",
  "Maryland" => "209",
  "Massachusetts" => "210",
  "Michigan" => "212",
  "Minnesota" => "213",
  "Mississippi" => "214"
}

# puts area_code
def get_area_code(somehash, city_name)
  somehash.each do |k, v|
    if city_name == k
      puts "#{city_name} area code is #{v}."
      return "#{city_name} area code is #{v}."
    end
  end
end

def get_city_names(somehash: {}, city_name: "")
  if city_name != ""
    somehash.each do |k, v|
      if city_name==k
        return city_name
      end
    end
    puts "No matching city found. Please try again."
  else
    puts "Please Enter a City Name"
  end
end



loop do
  puts "Do you want to lookup on area code based on City name ? (Y/N)"
  answer = gets.chomp.downcase
  if answer =="y"
    puts "Enter City Name"
    city = gets.chomp
    city_name= get_city_names(somehash: area_code, city_name: city)
    # puts "city is #{city_name.class}"
    areacode = get_area_code(area_code, city_name)
    break if areacode != ""
  end
  break if answer !="y"
end

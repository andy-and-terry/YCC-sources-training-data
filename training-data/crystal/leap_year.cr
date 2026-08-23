def leap_year?(year : Int32) : Bool
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
end

[2000, 1900, 2024, 2023].each do |year|
  puts "#{year}: #{leap_year?(year)}"
end

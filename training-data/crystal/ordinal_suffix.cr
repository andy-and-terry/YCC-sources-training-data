def ordinal(n : Int32) : String
  suffix = case
           when (11..13).includes?(n % 100) then "th"
           when n % 10 == 1                 then "st"
           when n % 10 == 2                 then "nd"
           when n % 10 == 3                 then "rd"
           else                                  "th"
           end
  "#{n}#{suffix}"
end

puts [1, 2, 3, 4, 11, 12, 13, 21, 101, 111].map { |n| ordinal(n) }.join(" ")

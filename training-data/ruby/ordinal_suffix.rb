def ordinal(n)
  suffix = if (11..13).cover?(n % 100)
             "th"
           else
             { 1 => "st", 2 => "nd", 3 => "rd" }.fetch(n % 10, "th")
           end
  "#{n}#{suffix}"
end

puts [1, 2, 3, 4, 11, 12, 13, 21, 101, 111].map { |n| ordinal(n) }.join(" ")

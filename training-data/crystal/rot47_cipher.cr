def rot47(s : String) : String
  s.gsub(/[!-~]/) { |c| (33 + (c.ord - 33 + 47) % 94).chr.to_s }
end

e = rot47("Hello, World!")
puts e
puts rot47(e)

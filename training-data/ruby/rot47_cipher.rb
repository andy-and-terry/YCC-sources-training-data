def rot47(s)
  s.gsub(/[!-~]/) { |c| (33 + (c.ord - 33 + 47) % 94).chr }
end

e = rot47("Hello, World!")
puts e, rot47(e)

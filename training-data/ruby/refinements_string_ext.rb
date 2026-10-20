module Shout
  refine String do
    def shout = upcase + "!"
  end
end

begin
  "a".shout
rescue NoMethodError
  puts "not refined here"
end

using Shout
puts "hello".shout

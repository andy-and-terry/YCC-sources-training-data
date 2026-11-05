module Shout
  refine String do
    def shout = upcase + "!"
  end
end

using Shout
puts "hey".shout

require "set"

def recaman(count)
  seq = [0]
  seen = Set[0]
  (1...count).each do |n|
    nxt = seq.last - n
    nxt = seq.last + n if nxt < 0 || seen.include?(nxt)
    seq << nxt
    seen << nxt
  end
  seq
end

puts recaman(20).join(" ")

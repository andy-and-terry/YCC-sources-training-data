require "set"

def ulam(count)
  terms = [1, 2]
  members = Set[1, 2]
  cand = 2
  while terms.size < count
    cand += 1
    ways = terms.count { |a| a < cand - a && members.include?(cand - a) }
    if ways == 1
      terms << cand
      members << cand
    end
  end
  terms
end

puts ulam(15).join(" ")

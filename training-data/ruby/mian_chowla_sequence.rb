require "set"

# Greedy sequence whose pairwise sums are all distinct.
seq = []
sums = Set.new
cand = 1
while seq.size < 8
  fresh = (seq + [cand]).map { |x| x + cand }
  if fresh.uniq.size == fresh.size && fresh.none? { |s| sums.include?(s) }
    seq << cand
    sums.merge(fresh)
  end
  cand += 1
end
puts seq.join(" ")

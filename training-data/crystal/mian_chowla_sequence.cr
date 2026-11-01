# Greedy sequence whose pairwise sums are all distinct.
seq = [] of Int32
sums = Set(Int32).new
cand = 1
while seq.size < 8
  fresh = (seq + [cand]).map { |x| x + cand }
  if fresh.uniq.size == fresh.size && fresh.none? { |s| sums.includes?(s) }
    seq << cand
    fresh.each { |s| sums << s }
  end
  cand += 1
end
puts seq.join(" ")

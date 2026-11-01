# Greedy sequence whose pairwise sums are all distinct.
seq = Int[]
sums = Set{Int}()
cand = 1
while length(seq) < 8
    fresh = [x + cand for x in vcat(seq, cand)]
    if length(unique(fresh)) == length(fresh) && isdisjoint(fresh, sums)
        push!(seq, cand)
        union!(sums, fresh)
    end
    global cand += 1
end
println(join(seq, " "))

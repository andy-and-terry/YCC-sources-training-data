function ugly(n)
    seq = [1]
    i2 = i3 = i5 = 1
    while length(seq) < n
        nxt = min(seq[i2] * 2, seq[i3] * 3, seq[i5] * 5)
        push!(seq, nxt)
        nxt == seq[i2] * 2 && (i2 += 1)
        nxt == seq[i3] * 3 && (i3 += 1)
        nxt == seq[i5] * 5 && (i5 += 1)
    end
    seq[n]
end

println([ugly(i) for i in 1:12])

s, k, B, M = "abcabc", 3, 31, 1_000_003
whash(w) = foldl((h, c) -> (h * B + Int(c)) % M, w; init = 0)
for i in 1:length(s)-k+1
    println(i - 1, " ", whash(s[i:i+k-1]))
end

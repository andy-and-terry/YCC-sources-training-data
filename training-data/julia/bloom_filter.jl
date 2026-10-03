mutable struct BloomFilter
    size::Int
    bits::BitVector
    BloomFilter(size::Int) = new(size, falses(size))
end

hash1(s::String, size::Int) = (hash(s) % size) + 1
hash2(s::String, size::Int) = (hash(s * "salt") % size) + 1

function add!(filter::BloomFilter, s::String)
    filter.bits[hash1(s, filter.size)] = true
    filter.bits[hash2(s, filter.size)] = true
end

function might_contain(filter::BloomFilter, s::String)
    return filter.bits[hash1(s, filter.size)] && filter.bits[hash2(s, filter.size)]
end

filter = BloomFilter(64)
add!(filter, "apple")
add!(filter, "banana")
println(might_contain(filter, "apple"))
println(might_contain(filter, "cherry"))

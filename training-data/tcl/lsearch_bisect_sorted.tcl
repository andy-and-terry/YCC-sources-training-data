set sorted {2 5 8 12 16 23 38 56 72 91}

# -bisect performs a binary search on a sorted list
puts [lsearch -integer -sorted -bisect $sorted 23]
puts [lsearch -integer -sorted -bisect $sorted 24]
puts [lsearch -integer -sorted -bisect $sorted 1]

# exact match on a sorted list
puts [lsearch -integer -sorted $sorted 56]
puts [lsearch -integer -sorted $sorted 57]

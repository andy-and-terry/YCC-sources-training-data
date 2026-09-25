m = [1 2 3; 4 5 6; 7 8 9]

# Base provides rotr90/rotl90; a manual version for comparison.
rotate_clockwise(a::AbstractMatrix) = reverse(permutedims(a), dims = 2)

display(rotate_clockwise(m))
println()
println(rotate_clockwise(m) == rotr90(m))

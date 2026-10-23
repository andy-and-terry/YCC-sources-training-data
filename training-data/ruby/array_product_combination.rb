# Array#product, #combination, #permutation and #each_cons.
sizes = %w[S M L]
colors = %w[red blue]
p sizes.product(colors)

team = %w[ann bob cy dee]
p team.combination(2).to_a.length
p team.combination(2).first(3)
p team.permutation(2).count

# Cartesian product of three arrays, then filtering.
pairs = (1..3).to_a.product((1..3).to_a, [0]).select { |a, b, _| a < b }
p pairs

# Sliding pairs
p [1, 4, 9, 16].each_cons(2).map { |a, b| b - a }

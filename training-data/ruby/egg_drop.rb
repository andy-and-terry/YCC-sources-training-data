def egg_drop(eggs, floors)
  f = Array.new(eggs + 1, 0)
  moves = 0
  while f[eggs] < floors
    moves += 1
    eggs.downto(1) { |e| f[e] += f[e - 1] + 1 }
  end
  moves
end

[[1, 10], [2, 100], [3, 1000], [8, 10**30]].each { |e, fl| puts "#{e} eggs, #{fl} floors -> #{egg_drop(e, fl)}" }

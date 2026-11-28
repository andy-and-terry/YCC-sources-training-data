def lis_length(a : Array(Int32)) : Int32
  tails = [] of Int32
  a.each do |x|
    i = tails.bsearch_index { |t| t >= x } || tails.size
    tails[i] = x rescue tails << x
  end
  tails.size
end

puts lis_length([10, 9, 2, 5, 3, 7, 101, 18])

puts [1, 2, 3].map { _1 * 2 }.inspect
puts [[1, 2], [3, 4]].map { _1 + _2 }.inspect
puts [1, 2, 3].each_with_index.map { _1 * _2 }.inspect
puts %w[a b].map { it.upcase }.inspect rescue puts "'it' needs Ruby 3.4"
puts [3, 1, 2].sort_by { -_1 }.inspect
puts({ a: 1, b: 2 }.map { "#{_1}=#{_2}" }.join("&"))
puts (1..4).reduce { _1 * _2 }
sq = -> { _1 ** 2 }
puts sq.call(7), sq.arity
puts [1, 2, 3].select { _1.odd? }.inspect
puts %w[x yy zzz].to_h { [_1, _1.size] }.inspect

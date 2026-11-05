groups = Hash(Int32, Array(String)).new { |h, k| h[k] = [] of String }
%w(a bb cc d eee).each { |w| groups[w.size] << w }
puts groups

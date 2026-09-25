def balanced(n)
  return to_enum(:balanced, n) unless block_given?

  build = lambda do |s, open, close|
    next yield(s) if s.size == 2 * n

    build.call("#{s}(", open + 1, close) if open < n
    build.call("#{s})", open, close + 1) if close < open
  end
  build.call('', 0, 0)
end

p balanced(3).to_a
puts "n=10: #{balanced(10).count}"

# Maximum nesting depth of parentheses; -1 if the string is unbalanced.
def max_depth(s)
  depth = best = 0
  s.each_char do |ch|
    case ch
    when "("
      depth += 1
      best = [best, depth].max
    when ")"
      depth -= 1
      return -1 if depth < 0
    end
  end
  depth.zero? ? best : -1
end

puts "#{max_depth('(1+(2*(3)))')} #{max_depth('(()')}"

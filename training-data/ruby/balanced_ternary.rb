def to_bt(n)
  return "0" if n.zero?
  out = +""
  until n.zero?
    case n % 3
    when 0 then out << "0"
    when 1 then out << "+"; n -= 1
    else out << "-"; n += 1
    end
    n /= 3
  end
  out.reverse
end

def from_bt(s)
  s.each_char.reduce(0) { |acc, c| acc * 3 + { "+" => 1, "-" => -1, "0" => 0 }[c] }
end

[-14, -1, 0, 5, 42].each do |k|
  puts "#{k} #{to_bt(k)} #{from_bt(to_bt(k)) == k}"
end

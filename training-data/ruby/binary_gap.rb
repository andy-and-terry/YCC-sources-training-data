def binary_gap(n)
  n.to_s(2).sub(/0+\z/, "").split("1").map(&:length).max || 0
end

[9, 529, 20, 15, 1041].each { |n| puts "#{n} #{n.to_s(2)} #{binary_gap(n)}" }

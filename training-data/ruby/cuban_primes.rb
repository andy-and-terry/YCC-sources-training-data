require "prime"

cuban = (1..Float::INFINITY).lazy
  .map { |y| 3 * y * y + 3 * y + 1 }
  .select(&:prime?)
  .first(8)
puts cuban.inspect

def histogram(values, width: 30)
  counts = values.tally.sort
  peak = counts.map(&:last).max
  counts.map { |k, n| "#{k.to_s.rjust(3)} | #{'#' * [1, n * width / peak].max} #{n}" }.join("\n")
end

puts histogram("theraininspainfallsmainlyontheplain".chars)

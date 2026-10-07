def wrap(text, width)
  text.split.flat_map { |w| w.scan(/.{1,#{width}}/) }.each_with_object([]) do |word, lines|
    if lines.empty? || lines.last.size + 1 + word.size > width
      lines << word.dup
    else
      lines.last << ' ' << word
    end
  end
end

text = 'The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically'
wrap(text, 16).each { |l| puts "|#{l.ljust(16)}|" }
# the classic one-liner regex approach, for comparison
puts text.gsub(/(.{1,16})(\s+|\z)/, "\\1\n")

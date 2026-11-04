def wrap(text, width)
  text.split.each_with_object([+""]) do |word, lines|
    if !lines.last.empty? && lines.last.size + 1 + word.size > width
      lines << word.dup
    else
      lines.last << " " unless lines.last.empty?
      lines.last << word
    end
  end
end

wrap("the quick brown fox jumps over the lazy dog", 15).each { |l| puts "|#{l.ljust(15)}|" }

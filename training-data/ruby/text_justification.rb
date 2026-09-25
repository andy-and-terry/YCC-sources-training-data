def justify(words, width)
  lines = []
  line = []
  words.each do |w|
    if line.sum(&:size) + line.size + w.size > width
      lines << line
      line = []
    end
    line << w
  end
  lines << line unless line.empty?

  lines.each_with_index.map do |ws, idx|
    next ws.join(' ').ljust(width) if idx == lines.size - 1 || ws.size == 1

    gaps = ws.size - 1
    spaces, extra = (width - ws.sum(&:size)).divmod(gaps)
    ws.each_with_index.map { |w, i| i < gaps ? w + ' ' * (spaces + (i < extra ? 1 : 0)) : w }.join
  end
end

justify('This is an example of text justification done greedily line by line'.split, 20).each { |l| puts "[#{l}]" }

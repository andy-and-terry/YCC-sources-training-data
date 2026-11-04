def wrap(text : String, width : Int32) : Array(String)
  lines = [] of String
  line = ""
  text.split.each do |word|
    if !line.empty? && line.size + 1 + word.size > width
      lines << line
      line = word
    else
      line = line.empty? ? word : "#{line} #{word}"
    end
  end
  lines << line unless line.empty?
  lines
end

wrap("the quick brown fox jumps over the lazy dog", 15).each { |l| puts "|#{l.ljust(15)}|" }

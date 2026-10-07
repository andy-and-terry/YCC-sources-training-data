def compress(s)
  out = s.chars.chunk_while { |a, b| a == b }.map { |run| "#{run[0]}#{run.size}" }.join
  out.size < s.size ? out : s
end

def decompress(s)
  s.scan(/(\D)(\d+)/).map { |ch, n| ch * n.to_i }.join
end

%w[aabcccccaaa abc zzzzzzzzzzzz].each do |w|
  c = compress(w)
  puts "#{w} -> #{c}#{c == w ? '' : " -> #{decompress(c)}"}"
end

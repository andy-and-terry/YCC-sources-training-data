Node = Struct.new(:char, :freq, :left, :right)

def build_tree(frequencies)
  nodes = frequencies.map { |char, freq| Node.new(char, freq, nil, nil) }

  until nodes.size == 1
    nodes.sort_by!(&:freq)
    left = nodes.shift
    right = nodes.shift
    nodes << Node.new(nil, left.freq + right.freq, left, right)
  end

  nodes.first
end

def build_codes(node, prefix = '', codes = {})
  return codes if node.nil?

  if node.char
    codes[node.char] = prefix.empty? ? '0' : prefix
  else
    build_codes(node.left, prefix + '0', codes)
    build_codes(node.right, prefix + '1', codes)
  end

  codes
end

text = 'abracadabra'
frequencies = text.chars.tally
tree = build_tree(frequencies)
codes = build_codes(tree)

puts codes.sort.to_h.inspect
encoded = text.chars.map { |c| codes[c] }.join
puts encoded
puts "original bits: #{text.size * 8}, encoded bits: #{encoded.size}"

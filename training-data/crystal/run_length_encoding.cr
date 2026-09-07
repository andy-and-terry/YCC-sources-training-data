def rle_encode(input : String) : String
  return "" if input.empty?
  result = String.build do |str|
    prev = input[0]
    count = 1
    input[1..].each_char do |ch|
      if ch == prev
        count += 1
      else
        str << count << prev
        prev = ch
        count = 1
      end
    end
    str << count << prev
  end
  result
end

def rle_decode(input : String) : String
  String.build do |str|
    count = 0
    input.each_char do |ch|
      if ch.ascii_number?
        count = count * 10 + ch.to_i
      else
        str << (ch.to_s * count)
        count = 0
      end
    end
  end
end

encoded = rle_encode("aaabbbcccd")
puts encoded
puts rle_decode(encoded)

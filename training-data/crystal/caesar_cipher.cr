def shift_char(c : Char, k : Int32) : Char
  if c.ascii_lowercase?
    ((c.ord - 'a'.ord + k) % 26 + 'a'.ord).chr
  elsif c.ascii_uppercase?
    ((c.ord - 'A'.ord + k) % 26 + 'A'.ord).chr
  else
    c
  end
end

def caesar(text : String, k : Int32) : String
  text.chars.map { |c| shift_char(c, k) }.join
end

msg = "Hello, World!"
enc = caesar(msg, 3)
puts enc
puts caesar(enc, -3)

module Atbash
  PLAIN = ("a".."z").to_a.join
  CIPHER = PLAIN.reverse

  def self.encode(text)
    decode(text).scan(/.{1,5}/).join(" ")
  end

  def self.decode(text)
    text.downcase.gsub(/[^a-z0-9]/, "").tr(PLAIN, CIPHER)
  end
end

e = Atbash.encode("The quick brown fox")
puts e, Atbash.decode(e)

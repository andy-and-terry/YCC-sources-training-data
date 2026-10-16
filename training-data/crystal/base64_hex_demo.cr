require "base64"
require "digest/sha256"
require "digest/md5"

msg = "Crystal rocks"
enc = Base64.strict_encode(msg)
puts enc
puts Base64.decode_string(enc)
puts Base64.urlsafe_encode("??>>")

puts msg.to_slice.hexstring
puts "4869".hexbytes.map(&.chr).join

puts Digest::SHA256.hexdigest(msg)[0, 16]
puts Digest::MD5.hexdigest("")

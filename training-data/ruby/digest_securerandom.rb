require "digest"
require "securerandom"
require "base64"
require "openssl"

puts Digest::MD5.hexdigest("hello")
puts Digest::SHA256.hexdigest("hello")[0, 16]
puts Digest::SHA1.base64digest("hello")

d = Digest::SHA256.new
d << "hel" << "lo"
puts d.hexdigest == Digest::SHA256.hexdigest("hello")

puts SecureRandom.hex(4).size, SecureRandom.uuid.size
puts SecureRandom.alphanumeric(10).match?(/\A[A-Za-z0-9]{10}\z/)
puts SecureRandom.random_number(10).between?(0, 9)
puts Base64.strict_encode64("hi there"), Base64.decode64("aGkgdGhlcmU=")
puts Base64.urlsafe_encode64("\xff\xfe".b)
puts OpenSSL::HMAC.hexdigest("SHA256", "key", "msg")[0, 16]

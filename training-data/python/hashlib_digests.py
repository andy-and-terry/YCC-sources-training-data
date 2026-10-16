import hashlib
import hmac

print(hashlib.md5(b"hello").hexdigest())
print(hashlib.sha1(b"hello").hexdigest())
print(hashlib.sha256(b"hello").hexdigest()[:16])

h = hashlib.sha256()
for chunk in (b"hel", b"lo"):
    h.update(chunk)
print(h.hexdigest() == hashlib.sha256(b"hello").hexdigest())

key = b"secret"
mac = hmac.new(key, b"message", hashlib.sha256).hexdigest()
print(mac[:16])
print(hmac.compare_digest(mac, hmac.new(key, b"message", "sha256").hexdigest()))

dk = hashlib.pbkdf2_hmac("sha256", b"pw", b"salt", 1000)
print(len(dk), dk.hex()[:12])
print(hashlib.blake2b(b"x", digest_size=8).hexdigest())

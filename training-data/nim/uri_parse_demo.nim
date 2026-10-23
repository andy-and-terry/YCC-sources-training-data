import std/uri

# parseUri splits a URL into its components.
let u = parseUri("https://user@example.com:8080/a/b?x=1&y=two#top")
echo u.scheme
echo u.username
echo u.hostname
echo u.port
echo u.path
echo u.query
echo u.anchor

# The / operator joins URI parts, normalising slashes.
echo parseUri("http://example.com/base/") / "child" / "leaf.txt"

# Query strings can be iterated as key/value pairs.
for k, v in decodeQuery("name=Ada%20Lovelace&lang=nim"):
  echo k, " = ", v

# encodeUrl escapes reserved characters.
echo encodeUrl("a b&c=d")

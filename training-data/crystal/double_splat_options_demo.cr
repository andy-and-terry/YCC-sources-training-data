# Double splat (**) collects extra named arguments into a NamedTuple.
def connect(host : String, port : Int32 = 80, **options)
  puts "#{host}:#{port} #{options}"
  options.each { |key, value| puts "  #{key} = #{value}" }
end

connect("example.com")
connect("example.com", 8080, tls: true, timeout: 5)

defaults = {tls: false, retries: 3}
connect("internal", **defaults)

def total(*nums : Int32, scale : Int32 = 1)
  nums.sum * scale
end

puts total(1, 2, 3)
puts total(1, 2, 3, scale: 10)

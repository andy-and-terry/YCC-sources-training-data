def add(a, b, c)
  a + b + c
end

args = {1, 2, 3}
puts add(*args)

def describe(*items)
  "#{items.size} items: #{items.join(", ")}"
end

puts describe
puts describe(1, "two", :three)
puts describe(*{4, 5})

def options(**opts)
  opts.map { |k, v| "#{k}=#{v}" }.join(" ")
end

puts options(color: "red", size: 3)
puts options(**{debug: true})

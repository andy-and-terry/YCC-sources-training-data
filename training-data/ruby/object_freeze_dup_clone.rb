original = { list: [1, 2], name: "x" }
shallow = original.dup
shallow[:list] << 3
p original

deep = Marshal.load(Marshal.dump(original))
deep[:list] << 4
p original, deep

frozen = "abc".freeze
p frozen.frozen?
copy = frozen.dup
p copy.frozen?
p frozen.clone.frozen?
p frozen.clone(freeze: false).frozen?

begin
  frozen << "d"
rescue FrozenError => e
  puts e.class
end

CONST = %w[a b].freeze
p CONST.frozen?, CONST.first.frozen?
p CONST.map(&:upcase)

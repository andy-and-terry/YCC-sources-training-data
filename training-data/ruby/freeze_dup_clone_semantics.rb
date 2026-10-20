s = "abc".freeze
puts s.frozen?, s.dup.frozen?, s.clone.frozen?, s.clone(freeze: false).frozen?
a = [[1], [2]].freeze
a[0] << 9
puts a.inspect
begin
  a << 3
rescue FrozenError => e
  puts e.class
end
CONST = %w[a b].map(&:freeze).freeze
puts CONST.all?(&:frozen?)

# freeze prevents mutation; dup copies unfrozen, clone preserves frozen state.
CONFIG = { name: "app", tags: %w[a b] }.freeze

begin
  CONFIG[:name] = "other"
rescue FrozenError => e
  puts "FrozenError: #{e.message[0, 30]}"
end

CONFIG[:tags] << "c"           # shallow freeze: inner array is still mutable
puts CONFIG[:tags].inspect

copy = CONFIG.dup
copy[:name] = "changed"
puts copy[:name], CONFIG.clone.frozen?, CONFIG.dup.frozen?

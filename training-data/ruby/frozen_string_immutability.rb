CONSTANTS = %w[RED GREEN BLUE].freeze

def process(items)
  items.map(&:downcase).freeze
end

result = process(CONSTANTS)
puts result.inspect
puts result.frozen?

begin
  result << 'yellow'
rescue FrozenError => e
  puts "error: #{e.message}"
end

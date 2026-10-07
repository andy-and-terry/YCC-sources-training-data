module Temperature
  TO_C = { c: ->(v) { v }, f: ->(v) { (v - 32) * 5.0 / 9 }, k: ->(v) { v - 273.15 } }.freeze
  FROM_C = { c: ->(v) { v }, f: ->(v) { v * 9.0 / 5 + 32 }, k: ->(v) { v + 273.15 } }.freeze

  def self.convert(value, from:, to:)
    FROM_C.fetch(to).call(TO_C.fetch(from).call(value))
  end
end

puts Temperature.convert(100, from: :c, to: :f)
puts Temperature.convert(212, from: :f, to: :k).round(2)

class BloomFilter
  def initialize(size : Int32, hash_count : Int32)
    @size = size
    @hash_count = hash_count
    @bits = Array.new(size, false)
  end

  private def hash(item : String, seed : Int32) : Int32
    h = seed
    item.each_byte { |b| h = (h * 31 + b) & 0x7fffffff }
    h % @size
  end

  def add(item : String)
    @hash_count.times do |i|
      @bits[hash(item, i)] = true
    end
  end

  def maybe_contains?(item : String) : Bool
    (0...@hash_count).all? { |i| @bits[hash(item, i)] }
  end
end

filter = BloomFilter.new(64, 3)
filter.add("apple")
filter.add("banana")

puts filter.maybe_contains?("apple")
puts filter.maybe_contains?("banana")
puts filter.maybe_contains?("cherry")

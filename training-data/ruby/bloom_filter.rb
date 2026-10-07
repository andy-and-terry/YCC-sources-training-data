class BloomFilter
  def initialize(size = 64, hash_count = 3)
    @size = size
    @hash_count = hash_count
    @bits = Array.new(size, false)
  end

  def add(item)
    each_slot(item) { |slot| @bits[slot] = true }
  end

  def maybe_contains?(item)
    each_slot(item).all? { |slot| @bits[slot] }
  end

  private

  def each_slot(item)
    return to_enum(:each_slot, item) unless block_given?

    @hash_count.times do |i|
      seed = "#{item}#{i}"
      yield seed.hash.abs % @size
    end
  end
end

filter = BloomFilter.new
%w[apple banana cherry].each { |word| filter.add(word) }

puts filter.maybe_contains?("apple")
puts filter.maybe_contains?("banana")
puts filter.maybe_contains?("durian")

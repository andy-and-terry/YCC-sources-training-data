class LFUCache
  def initialize(capacity)
    @capacity = capacity
    @values = {}
    @frequencies = Hash.new(0)
  end

  def get(key)
    return -1 unless @values.key?(key)

    @frequencies[key] += 1
    @values[key]
  end

  def put(key, value)
    return if @capacity.zero?

    if @values.key?(key)
      @values[key] = value
      @frequencies[key] += 1
      return
    end

    if @values.size >= @capacity
      least_used_key = @frequencies.min_by { |_, freq| freq }.first
      @values.delete(least_used_key)
      @frequencies.delete(least_used_key)
    end

    @values[key] = value
    @frequencies[key] = 1
  end
end

cache = LFUCache.new(2)
cache.put(1, 'one')
cache.put(2, 'two')
puts cache.get(1)
cache.put(3, 'three')
puts cache.get(2)
puts cache.get(3)

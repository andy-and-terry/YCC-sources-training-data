class LfuCache
  def initialize(@capacity : Int32)
    @values = {} of Int32 => Int32
    @freq = {} of Int32 => Int32
  end

  def get(key : Int32) : Int32?
    return nil unless @values.has_key?(key)
    @freq[key] += 1
    @values[key]
  end

  def put(key : Int32, value : Int32)
    return if @capacity == 0

    if @values.has_key?(key)
      @values[key] = value
      @freq[key] += 1
      return
    end

    if @values.size >= @capacity
      evict_key = @freq.min_by { |_, f| f }[0]
      @values.delete(evict_key)
      @freq.delete(evict_key)
    end

    @values[key] = value
    @freq[key] = 1
  end
end

cache = LfuCache.new(2)
cache.put(1, 10)
cache.put(2, 20)
cache.get(1)
cache.put(3, 30)
puts cache.get(2)
puts cache.get(1)
puts cache.get(3)

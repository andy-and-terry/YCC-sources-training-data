class LRUCache(K, V)
  def initialize(@capacity : Int32)
    @map = {} of K => V
    @order = [] of K
  end

  def get(key : K) : V?
    return nil unless @map.has_key?(key)
    @order.delete(key)
    @order << key
    @map[key]
  end

  def put(key : K, value : V)
    if @map.has_key?(key)
      @order.delete(key)
    elsif @map.size >= @capacity
      oldest = @order.shift
      @map.delete(oldest)
    end
    @map[key] = value
    @order << key
  end
end

cache = LRUCache(Int32, String).new(2)
cache.put(1, "a")
cache.put(2, "b")
puts cache.get(1)
cache.put(3, "c")
puts cache.get(2)
puts cache.get(3)

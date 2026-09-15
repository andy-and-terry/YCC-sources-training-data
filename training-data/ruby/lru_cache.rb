class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @map = {}
  end

  def get(key)
    return -1 unless @map.key?(key)

    value = @map.delete(key)
    @map[key] = value
    value
  end

  def put(key, value)
    @map.delete(key) if @map.key?(key)
    @map[key] = value
    @map.delete(@map.first[0]) if @map.size > @capacity
  end
end

cache = LRUCache.new(2)
cache.put(1, 1)
cache.put(2, 2)
puts cache.get(1)
cache.put(3, 3) # evicts key 2
puts cache.get(2)
puts cache.get(3)

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @store = {}
  end

  def get(key)
    return -1 unless @store.key?(key)

    value = @store.delete(key)
    @store[key] = value
    value
  end

  def put(key, value)
    @store.delete(key) if @store.key?(key)
    @store[key] = value
    @store.delete(@store.keys.first) if @store.size > @capacity
  end
end

cache = LRUCache.new(2)
cache.put(1, 'a')
cache.put(2, 'b')
puts cache.get(1)   # a
cache.put(3, 'c')   # evicts key 2 (least recently used)
puts cache.get(2)   # -1
puts cache.get(3)   # c

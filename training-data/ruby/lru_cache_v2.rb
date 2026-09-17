class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
  end

  def get(key)
    return -1 unless @cache.key?(key)

    value = @cache.delete(key)
    @cache[key] = value
    value
  end

  def put(key, value)
    @cache.delete(key) if @cache.key?(key)
    @cache[key] = value
    @cache.delete(@cache.keys.first) if @cache.size > @capacity
  end
end

cache = LRUCache.new(2)
cache.put(1, 'a')
cache.put(2, 'b')
puts cache.get(1)
cache.put(3, 'c')
puts cache.get(2)
puts cache.get(3)

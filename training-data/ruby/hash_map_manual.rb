class SimpleHashMap
  def initialize(size = 16)
    @size = size
    @buckets = Array.new(size) { [] }
  end

  def hash_key(key)
    key.to_s.sum % @size
  end

  def set(key, value)
    bucket = @buckets[hash_key(key)]
    existing = bucket.find { |k, _| k == key }
    existing ? existing[1] = value : bucket << [key, value]
  end

  def get(key)
    bucket = @buckets[hash_key(key)]
    entry = bucket.find { |k, _| k == key }
    entry && entry[1]
  end
end

map = SimpleHashMap.new
map.set('a', 1)
map.set('b', 2)
puts map.get('a')
puts map.get('c').inspect

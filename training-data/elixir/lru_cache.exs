defmodule LRUCache do
  defstruct capacity: 0, map: %{}, order: []

  def new(capacity), do: %LRUCache{capacity: capacity}

  def get(%LRUCache{map: map} = cache, key) do
    case Map.fetch(map, key) do
      {:ok, value} ->
        cache = %{cache | order: [key | List.delete(cache.order, key)]}
        {value, cache}

      :error ->
        {:not_found, cache}
    end
  end

  def put(%LRUCache{map: map, order: order, capacity: capacity} = cache, key, value) do
    map = Map.put(map, key, value)
    order = [key | List.delete(order, key)]

    {map, order} =
      if length(order) > capacity do
        {to_evict, keep} = List.pop_at(order, -1)
        {Map.delete(map, to_evict), keep}
      else
        {map, order}
      end

    %{cache | map: map, order: order}
  end
end

cache = LRUCache.new(2)
cache = LRUCache.put(cache, :a, 1)
cache = LRUCache.put(cache, :b, 2)
{val, cache} = LRUCache.get(cache, :a)
IO.inspect(val)
cache = LRUCache.put(cache, :c, 3)
{val, _cache} = LRUCache.get(cache, :b)
IO.inspect(val)

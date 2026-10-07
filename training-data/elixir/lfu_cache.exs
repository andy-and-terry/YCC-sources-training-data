defmodule LfuCache do
  defstruct capacity: 0, values: %{}, freq: %{}

  def new(capacity), do: %LfuCache{capacity: capacity}

  def get(%LfuCache{values: values} = cache, key) do
    if Map.has_key?(values, key) do
      cache = %{cache | freq: Map.update(cache.freq, key, 1, &(&1 + 1))}
      {Map.get(values, key), cache}
    else
      {nil, cache}
    end
  end

  def put(%LfuCache{capacity: 0} = cache, _key, _value), do: cache

  def put(%LfuCache{values: values, freq: freq, capacity: capacity} = cache, key, value) do
    cond do
      Map.has_key?(values, key) ->
        %{cache | values: Map.put(values, key, value), freq: Map.update(freq, key, 1, &(&1 + 1))}

      map_size(values) >= capacity ->
        {evict_key, _} = Enum.min_by(freq, fn {_k, f} -> f end)
        values = values |> Map.delete(evict_key) |> Map.put(key, value)
        freq = freq |> Map.delete(evict_key) |> Map.put(key, 1)
        %{cache | values: values, freq: freq}

      true ->
        %{cache | values: Map.put(values, key, value), freq: Map.put(freq, key, 1)}
    end
  end
end

cache = LfuCache.new(2)
cache = LfuCache.put(cache, 1, 10)
cache = LfuCache.put(cache, 2, 20)
{_, cache} = LfuCache.get(cache, 1)
cache = LfuCache.put(cache, 3, 30)
{v2, cache} = LfuCache.get(cache, 2)
IO.inspect(v2)
{v1, _cache} = LfuCache.get(cache, 1)
IO.inspect(v1)

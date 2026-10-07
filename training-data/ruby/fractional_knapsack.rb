Item = Struct.new(:name, :value, :weight) do
  def ratio = value.fdiv(weight)
end

def fractional_knapsack(items, capacity)
  items.sort_by { |i| -i.ratio }.each_with_object({ total: 0.0, taken: {} }) do |item, acc|
    break acc if capacity <= 0

    take = [item.weight, capacity].min
    acc[:total] += item.value * take.fdiv(item.weight)
    acc[:taken][item.name] = take.fdiv(item.weight).round(3)
    capacity -= take
  end
end

p fractional_knapsack([Item.new('gold', 60, 10), Item.new('silver', 100, 20), Item.new('bronze', 120, 30)], 50)

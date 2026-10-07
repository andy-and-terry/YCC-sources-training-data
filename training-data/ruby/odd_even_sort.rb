def odd_even_sort(items)
  a = items.dup
  loop do
    sorted = true
    [1, 0].each do |start|
      start.step(a.size - 2, 2) do |i|
        next unless a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
        sorted = false
      end
    end
    break if sorted
  end
  a
end

p odd_even_sort([34, 2, 10, -9, 5, 3, 1])

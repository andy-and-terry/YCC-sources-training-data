# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
def jacobsthal(count : Int32) : Array(Int64)
  a, b = 0_i64, 1_i64
  Array.new(count) do
    current = a
    a, b = b, b + 2 * a
    current
  end
end

puts jacobsthal(15).join(" ")

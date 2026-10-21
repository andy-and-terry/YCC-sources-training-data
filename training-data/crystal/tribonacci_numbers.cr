# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
def tribonacci(count : Int32) : Array(Int64)
  t = [0_i64, 0_i64, 1_i64]
  while t.size < count
    t << t[-1] + t[-2] + t[-3]
  end
  t.first(count)
end

puts "Tribonacci: #{tribonacci(15).join(", ")}"

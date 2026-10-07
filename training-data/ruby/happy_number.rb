require "set"

def happy?(n)
  seen = Set.new
  until n == 1 || seen.include?(n)
    seen << n
    n = n.digits.sum { |d| d * d }
  end
  n == 1
end

p (1..50).select { |n| happy?(n) }

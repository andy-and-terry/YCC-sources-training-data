class PrimeIterator
  include Iterator(Int32)

  def initialize
    @candidate = 1
  end

  def next
    loop do
      @candidate += 1
      return @candidate if prime?(@candidate)
    end
  end

  private def prime?(n : Int32) : Bool
    return false if n < 2
    return true if n == 2
    return false if n.even?
    i = 3
    while i * i <= n
      return false if n % i == 0
      i += 2
    end
    true
  end
end

primes = PrimeIterator.new
puts primes.first(10).to_a.inspect

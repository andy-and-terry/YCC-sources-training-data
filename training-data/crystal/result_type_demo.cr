class Result(T, E)
  getter? success : Bool

  def initialize(@success : Bool, @value : T | E)
  end

  def self.ok(value : T) : Result(T, E)
    new(true, value)
  end

  def self.err(error : E) : Result(T, E)
    new(false, error)
  end

  def value : T
    @value.as(T)
  end

  def error : E
    @value.as(E)
  end

  def map(&block : T -> T) : Result(T, E)
    return self unless success?
    Result(T, E).ok(block.call(value))
  end
end

def divide(a : Int32, b : Int32) : Result(Int32, String)
  return Result(Int32, String).err("division by zero") if b == 0
  Result(Int32, String).ok(a // b)
end

r1 = divide(10, 2)
r2 = divide(5, 0)

puts r1.success? ? "ok: #{r1.value}" : "err: #{r1.error}"
puts r2.success? ? "ok: #{r2.value}" : "err: #{r2.error}"
puts r1.map { |v| v * 10 }.value

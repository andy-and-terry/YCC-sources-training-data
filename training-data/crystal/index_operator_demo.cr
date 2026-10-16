class Matrix
  def initialize(@rows : Int32, @cols : Int32)
    @data = Array(Float64).new(@rows * @cols, 0.0)
  end

  def [](r : Int32, c : Int32) : Float64
    @data[r * @cols + c]
  end

  def []=(r : Int32, c : Int32, value : Float64)
    @data[r * @cols + c] = value
  end

  def to_s(io : IO) : Nil
    @rows.times do |r|
      io << (0...@cols).map { |c| self[r, c] }.join(" ") << "\n"
    end
  end
end

m = Matrix.new(2, 3)
m[0, 1] = 5.0
m[1, 2] = 7.5
print m
puts m[1, 2]

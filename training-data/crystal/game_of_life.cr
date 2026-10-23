# Conway's Game of Life on a small wrapping grid, using a glider.

class Life
  def initialize(@rows : Int32, @cols : Int32, alive : Array({Int32, Int32}))
    @grid = Array.new(@rows) { Array.new(@cols, false) }
    alive.each { |(r, c)| @grid[r][c] = true }
  end

  def neighbors(r : Int32, c : Int32) : Int32
    count = 0
    (-1..1).each do |dr|
      (-1..1).each do |dc|
        next if dr == 0 && dc == 0
        count += 1 if @grid[(r + dr) % @rows][(c + dc) % @cols]
      end
    end
    count
  end

  def step : Nil
    @grid = Array.new(@rows) do |r|
      Array.new(@cols) do |c|
        n = neighbors(r, c)
        @grid[r][c] ? (n == 2 || n == 3) : n == 3
      end
    end
  end

  def to_s(io : IO) : Nil
    @grid.each { |row| io << row.map { |x| x ? '#' : '.' }.join << '\n' }
  end
end

life = Life.new(6, 6, [{0, 1}, {1, 2}, {2, 0}, {2, 1}, {2, 2}])
3.times do |gen|
  puts "Generation #{gen}:"
  puts life
  life.step
end

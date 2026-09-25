require 'set'

class Life
  NEIGHBOURS = [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]

  attr_reader :cells

  def initialize(cells) = @cells = Set.new(cells)

  def step
    counts = Hash.new(0)
    @cells.each { |x, y| NEIGHBOURS.each { |dx, dy| counts[[x + dx, y + dy]] += 1 } }
    Life.new(counts.select { |c, n| n == 3 || (n == 2 && @cells.include?(c)) }.keys)
  end

  def render(w, h) = (0...h).map { |y| (0...w).map { |x| @cells.include?([x, y]) ? '#' : '.' }.join }.join("\n")
end

life = Life.new([[1, 0], [2, 1], [0, 2], [1, 2], [2, 2]])
4.times do |gen|
  puts "gen #{gen}", life.render(6, 6), ''
  life = life.step
end

class SparseMatrix
  attr_reader :rows, :cols, :data

  def initialize(rows, cols, data = {})
    @rows = rows
    @cols = cols
    @data = data.reject { |_, v| v.zero? }
  end

  def self.from_dense(dense)
    data = {}
    dense.each_with_index { |row, r| row.each_with_index { |v, c| data[[r, c]] = v unless v.zero? } }
    new(dense.size, dense[0].size, data)
  end

  def [](r, c) = @data.fetch([r, c], 0)

  def *(other)
    by_row = other.data.group_by { |(r, _), _| r }
    out = Hash.new(0)
    @data.each do |(r, k), v|
      by_row.fetch(k, []).each { |(_, c), w| out[[r, c]] += v * w }
    end
    SparseMatrix.new(rows, other.cols, out)
  end

  def transpose = SparseMatrix.new(cols, rows, @data.to_h { |(r, c), v| [[c, r], v] })
  def to_dense = Array.new(rows) { |r| Array.new(cols) { |c| self[r, c] } }
end

a = SparseMatrix.from_dense([[1, 0, 0], [0, 0, 2], [0, 3, 0]])
b = SparseMatrix.from_dense([[0, 4, 0], [5, 0, 0], [0, 0, 6]])
p (a * b).to_dense, a.transpose.to_dense

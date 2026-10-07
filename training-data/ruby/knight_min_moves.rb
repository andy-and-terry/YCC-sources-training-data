MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze

def square(name) = [name[0].ord - 97, name[1].to_i - 1]
def name(sq) = "#{(sq[0] + 97).chr}#{sq[1] + 1}"

def knight_path(from, to)
  start = square(from)
  goal = square(to)
  prev = { start => nil }
  queue = [start]
  until queue.empty?
    cur = queue.shift
    break if cur == goal

    MOVES.each do |dx, dy|
      nxt = [cur[0] + dx, cur[1] + dy]
      next unless nxt.all? { |v| v.between?(0, 7) } && !prev.key?(nxt)

      prev[nxt] = cur
      queue << nxt
    end
  end
  path = []
  node = goal
  while node
    path.unshift(name(node))
    node = prev[node]
  end
  path
end

[%w[a1 h8], %w[a1 b2], %w[d4 d5]].each do |from, to|
  path = knight_path(from, to)
  puts "#{from}->#{to}: #{path.size - 1} moves #{path.join(' ')}"
end

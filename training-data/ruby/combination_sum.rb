def combination_sum(candidates, target)
  cands = candidates.uniq.sort
  results = []
  search = lambda do |start, remaining, path|
    return results << path.dup if remaining.zero?

    cands[start..].each_with_index do |c, offset|
      break if c > remaining

      path << c
      search.call(start + offset, remaining - c, path)
      path.pop
    end
  end
  search.call(0, target, [])
  results
end

p combination_sum([2, 3, 6, 7], 7)
p combination_sum([2, 3, 5], 8)

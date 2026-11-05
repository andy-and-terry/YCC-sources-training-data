def run_proc
  pr = proc { return 1 }
  pr.call
  2
end

def run_lambda
  l = -> { return 1 }
  l.call
  2
end

puts run_proc, run_lambda
puts proc { |a, b| [a, b] }.call(1).inspect
puts (-> (a, b = 2) { a + b }).call(1)

# Procs and lambdas differ in arity checking and in what `return` does.
def run_proc
  pr = Proc.new { return :from_proc }
  pr.call
  :after_proc
end

def run_lambda
  l = -> { return :from_lambda }
  l.call
  :after_lambda
end

puts run_proc      # from_proc (returns from the method)
puts run_lambda    # after_lambda (returns only from the lambda)

add = ->(a, b) { a + b }
puts add.curry[1][2]
begin
  add.call(1)
rescue ArgumentError => e
  puts e.message
end

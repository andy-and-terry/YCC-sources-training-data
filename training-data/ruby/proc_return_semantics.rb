def proc_return
  pr = Proc.new { return :from_proc }
  pr.call
  :after_proc
end

def lambda_return
  l = -> { return :from_lambda }
  l.call
  :after_lambda
end

puts proc_return, lambda_return

l = ->(a, b) { a + b }
pr = proc { |a, b| [a, b] }
puts pr.call(1).inspect, pr.call(1, 2, 3).inspect
begin
  l.call(1)
rescue ArgumentError => e
  puts e.message
end
puts l.lambda?, pr.lambda?, l.arity, pr.arity
puts pr.call([5, 6]).inspect
puts (l >> ->(x) { x * 10 }).call(1, 2)

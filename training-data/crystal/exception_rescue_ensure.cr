class BadInput < Exception; end

def check(n : Int32)
  raise BadInput.new("neg") if n < 0
  n
end

begin
  puts check(5)
  puts check(-1)
rescue ex : BadInput
  puts "caught #{ex.message}"
ensure
  puts "done"
end

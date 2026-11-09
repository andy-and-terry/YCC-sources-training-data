class MyError < Exception; end

begin
  raise MyError.new("boom")
rescue ex : MyError
  puts "caught #{ex.message}"
ensure
  puts "cleanup"
end

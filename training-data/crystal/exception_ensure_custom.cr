class AppErr < Exception; end
begin
  raise AppErr.new("bad")
rescue e : AppErr
  puts "caught #{e.message}"
ensure
  puts "done"
end

class AppError < Exception; end

def run
  raise AppError.new("bad")
rescue e : AppError
  puts "rescued #{e.message}"
else
  puts "no error"
ensure
  puts "always"
end

run

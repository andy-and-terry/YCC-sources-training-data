log = "GET /a 200 12ms, POST /b 500 340ms"
log.scan(/(?<verb>[A-Z]+) (?<path>\S+) (?<code>\d+) (?<ms>\d+)ms/) { |v, p, c, ms| puts "#{v} #{p} #{c} #{ms}" }
if /(?<y>\d{4})-(?<m>\d\d)/ =~ "date 2024-05"
  puts y, m
end
puts "snake_case".gsub(/_(\w)/) { $1.upcase }, "a1b22".gsub(/\d+/) { |n| (n.to_i * 2).to_s }
puts "foo.bar".sub(/(\w+)\.(\w+)/, '\2.\1'), "x" =~ /y/ ? 1 : 0

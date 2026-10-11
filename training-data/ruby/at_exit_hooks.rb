at_exit { puts "exit hook 1 (runs last)" }
at_exit { puts "exit hook 2 (runs first)" }

END { puts "END block" }
BEGIN { puts "BEGIN block runs before everything" }

puts "main body"
puts __FILE__ == $0
puts __method__.inspect
def who = __method__
puts who
puts __dir__.class
puts $PROGRAM_NAME == $0
puts ARGV.inspect
puts defined?(DATA).inspect
trap("EXIT") { puts "trap EXIT" } rescue nil
exit 0

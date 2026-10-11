class Secret
  def hello = "hello"

  private

  def hidden = "hidden"
end

s = Secret.new
puts s.send(:hello), s.send(:hidden)
puts s.public_send(:hello)
begin
  s.public_send(:hidden)
rescue NoMethodError => e
  puts "private: #{e.class}"
end

puts 5.send(:+, 3), [1, 2, 3].send(:map) { |x| x * 2 }.inspect
%w[upcase reverse capitalize].each { |m| puts "abc".public_send(m) }
puts s.respond_to?(:hidden), s.respond_to?(:hidden, true)
puts Secret.instance_method(:hello).bind(s).call
puts s.__send__(:hello)

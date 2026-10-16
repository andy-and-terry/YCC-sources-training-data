module Util
  module_function

  def square(x) = x * x
  def cube(x) = x * square(x)
end

puts Util.square(3), Util.cube(2)

class User
  include Util
  def run = square(5)
end
puts User.new.run
begin
  User.new.square(2)
rescue NoMethodError
  puts "square is private as an instance method"
end

module Helper
  def self.shout(s) = s.upcase + "!"
  def whisper(s) = s.downcase
  extend self
end
puts Helper.shout("a"), Helper.whisper("B")

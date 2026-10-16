def make_binding
  secret = 42
  binding
end

b = make_binding
puts b.local_variable_get(:secret)
puts b.eval("secret + 1")
b.local_variable_set(:extra, 7)
puts b.local_variables.inspect
puts b.local_variable_defined?(:nope)

x = 10
puts eval("x * 2")
puts eval("x * 2", binding)
add = ->(n) { n + x }
x = 100
puts add.call(1)
puts add.binding.local_variable_get(:x)

class Foo; def initialize = @v = 5; end
puts Foo.new.instance_eval { @v }
puts Foo.class_eval { def hi = "hi"; :defined }
puts Foo.new.hi
puts ERB rescue puts "ERB not loaded"
require "erb"
puts ERB.new("x=<%= x %>").result(binding)

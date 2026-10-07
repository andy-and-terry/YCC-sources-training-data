add = ->(a, b, c) { a + b + c }
puts add.arity

curried_add = add.curry
add_five = curried_add[5]
add_five_and_two = add_five[2]
puts add_five_and_two[10]
puts curried_add[1][2][3]
puts curried_add.(1, 2).(3)

# Partial application built from curry: fix the leading argument
# once, reuse the resulting proc across many calls.
def power(base, exponent)
  base**exponent
end

power_proc = method(:power).to_proc.curry
base_three = power_proc.call(3)
puts base_three.call(2)
puts base_three.call(4)

powers_of_two = [1, 2, 3, 4].map(&power_proc[2])
puts powers_of_two.inspect

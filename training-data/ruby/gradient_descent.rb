def gradient_descent(grad_fn, start: 0.0, learning_rate: 0.1, iterations: 50)
  x = start
  iterations.times { x -= learning_rate * grad_fn.call(x) }
  x
end

minimum = gradient_descent(->(x) { 2 * (x - 3) })
puts minimum.round(4)

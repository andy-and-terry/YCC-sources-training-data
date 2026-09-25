class NoConvergence < StandardError; end

def newton(x0, tol: 1e-12, max_iter: 100, f:, df:)
  x = x0
  max_iter.times do |i|
    d = df.call(x)
    raise NoConvergence, "zero derivative at #{x}" if d.zero?

    nxt = x - f.call(x) / d
    return [nxt, i + 1] if (nxt - x).abs < tol

    x = nxt
  end
  raise NoConvergence, "no convergence after #{max_iter} iterations"
end

[2.0, 9.0, 0.25, 1e10].each do |a|
  root, iters = newton([a, 1.0].max, f: ->(x) { x * x - a }, df: ->(x) { 2 * x })
  puts format('sqrt(%g) = %.12f in %d iterations (Math: %.12f)', a, root, iters, Math.sqrt(a))
end
begin
  newton(0.0, f: ->(x) { x * x + 1 }, df: ->(x) { 2 * x })
rescue NoConvergence => e
  puts "x^2+1: #{e.message}"
end

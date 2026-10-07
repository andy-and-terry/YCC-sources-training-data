# Object#tap runs a block for its side effects and returns the
# receiver unchanged -- handy for inspecting a value mid-chain.
result = [3, 1, 4, 1, 5, 9, 2, 6]
  .tap { |arr| puts "before sort: #{arr}" }
  .sort
  .tap { |arr| puts "after sort: #{arr}" }
  .uniq

puts result.inspect

# Object#then (aliased yield_self) passes the receiver into a block
# and returns the block's result -- useful for building a linear
# pipeline without a temporary variable per step.
final_price = 100
  .then { |price| price * 1.08 }       # add tax
  .then { |price| price - 5 }          # apply flat discount
  .then { |price| price.round(2) }

puts final_price

# Combining both: tap for logging, then for transforming.
config = { host: "localhost", port: 8080 }
  .tap { |h| puts "raw config: #{h}" }
  .then { |h| h.merge(scheme: "https") }

puts config

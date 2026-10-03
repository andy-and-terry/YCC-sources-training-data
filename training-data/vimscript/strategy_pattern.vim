function! NoDiscount(amount)
  return a:amount
endfunction

function! PercentageDiscount(amount, percent)
  return a:amount - a:amount * a:percent / 100.0
endfunction

function! FlatDiscount(amount, flat)
  let result = a:amount - a:flat
  return result < 0 ? 0 : result
endfunction

function! ApplyStrategy(Strategy, amount)
  return a:Strategy(a:amount)
endfunction

echo ApplyStrategy(function('NoDiscount'), 100)
echo ApplyStrategy(function('PercentageDiscount', [20]), 100)
echo ApplyStrategy(function('FlatDiscount', [15]), 100)

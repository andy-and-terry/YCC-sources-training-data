echo printf('%d items', 5)
echo printf('%5d|%-5d|%05d', 42, 42, 42)
echo printf('%.2f', 3.14159)
echo printf('%8.3f|', 2.5)
echo printf('%s has %d chars', 'vim', len('vim'))
echo printf('%x %X %o %b', 255, 255, 8, 5)
echo printf('%10s|%-10s|', 'right', 'left')
echo printf('%%')
echo printf('%c', 65)
echo printf('%e', 12345.678)
echo printf('%2$s %1$s', 'world', 'hello')

let rows = [['apple', 3, 0.5], ['kiwi', 12, 0.25]]
for [name, qty, price] in rows
  echo printf('%-8s %3d x %5.2f = %6.2f', name, qty, price, qty * price)
endfor

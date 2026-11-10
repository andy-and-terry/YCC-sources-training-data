let
  # D(m, n) = D(m-1, n) + D(m, n-1) + D(m-1, n-1)
  delannoy = m: n:
    if m == 0 || n == 0 then 1
    else delannoy (m - 1) n + delannoy m (n - 1) + delannoy (m - 1) (n - 1);
in
builtins.genList (n: delannoy n n) 6
# [ 1 3 13 63 321 1683 ]

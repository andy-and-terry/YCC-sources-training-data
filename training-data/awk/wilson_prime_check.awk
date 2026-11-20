# Wilson's theorem primality.
function wilson(n,   f, i) {
  if (n < 2) return 0
  f = 1
  for (i = 2; i < n; i++) f = (f * i) % n
  return f == n - 1
}
BEGIN { for (n = 2; n < 20; n++) if (wilson(n)) printf "%d ", n; print "" }

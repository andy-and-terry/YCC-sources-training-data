# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
let
  step = s: { a = s.b; b = s.c; c = s.a + s.b; };
  go = n: s: if n == 0 then [ ] else [ s.a ] ++ go (n - 1) (step s);
in
go 15 { a = 1; b = 1; c = 1; }

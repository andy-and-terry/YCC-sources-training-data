let
  just = x: { ok = true; value = x; };
  nothing = { ok = false; };
  bind = m: f: if m.ok then f m.value else nothing;
  safeDiv = a: b: if b == 0 then nothing else just (a / b);
  calc = a: b: c: bind (safeDiv a b) (x: bind (safeDiv x c) (y: just (y + 1)));
in
{ good = calc 100 5 2; bad = calc 1 0 2; }

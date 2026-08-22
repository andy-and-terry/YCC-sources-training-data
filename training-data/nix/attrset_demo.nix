let
  addPoints = a: b: { x = a.x + b.x; y = a.y + b.y; };
  p1 = { x = 1; y = 2; };
  p2 = { x = 3; y = 4; };
in
  addPoints p1 p2

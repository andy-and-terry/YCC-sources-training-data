let
  inherit (builtins) genList concatMap filter length;

  range = lo: hi: genList (i: lo + i) (hi - lo + 1);

  gcd = a: b: if b == 0 then a else gcd b (a - (a / b) * b);

  # all primitive triples a < b < c with c <= limit
  triples = limit:
    concatMap
      (a:
        concatMap
          (b:
            let
              c2 = a * a + b * b;
              isqrt = n:
                let
                  go = x: if x * x > n then go (x - 1) else x;
                in
                go (n / 2 + 1);
              c = isqrt c2;
            in
            if c <= limit && c * c == c2 && gcd a b == 1
            then [{ inherit a b c; }]
            else [ ])
          (range (a + 1) limit))
      (range 1 limit);

  found = triples 30;
in
{
  count = length found;
  triples = map (t: [ t.a t.b t.c ]) found;
  withPerimeter70 = filter (t: t.a + t.b + t.c == 70) found;
}

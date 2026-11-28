let
  maxArea = h:
    let
      at = builtins.elemAt h;
      go = lo: hi: best:
        if lo >= hi then best
        else
          let
            m = if at lo < at hi then at lo else at hi;
            area = m * (hi - lo);
            best' = if area > best then area else best;
          in if at lo < at hi then go (lo + 1) hi best' else go lo (hi - 1) best';
    in go 0 (builtins.length h - 1) 0;
in maxArea [ 1 8 6 2 5 4 8 3 7 ] # 49

let
  min3 = a: b: c: if a < b then (if a < c then a else c) else (if b < c then b else c);
  step = st:
    let
      c2 = builtins.elemAt st.seq st.i2 * 2;
      c3 = builtins.elemAt st.seq st.i3 * 3;
      c5 = builtins.elemAt st.seq st.i5 * 5;
      next = min3 c2 c3 c5;
    in
    {
      seq = st.seq ++ [ next ];
      i2 = if next == c2 then st.i2 + 1 else st.i2;
      i3 = if next == c3 then st.i3 + 1 else st.i3;
      i5 = if next == c5 then st.i5 + 1 else st.i5;
    };
  build = n: st: if builtins.length st.seq >= n then st.seq else build n (step st);
in
build 12 { seq = [ 1 ]; i2 = 0; i3 = 0; i5 = 0; }

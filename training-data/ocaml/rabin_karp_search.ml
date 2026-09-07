let rabin_karp text pattern =
  let n = String.length text in
  let m = String.length pattern in
  let base = 256 and modulus = 1_000_000_007 in
  if m > n then -1
  else
    let high_order = ref 1 in
    for _ = 1 to m - 1 do
      high_order := !high_order * base mod modulus
    done;
    let hash s upto =
      let h = ref 0 in
      for i = 0 to upto - 1 do
        h := (!h * base + Char.code s.[i]) mod modulus
      done;
      !h
    in
    let pattern_hash = hash pattern m in
    let text_hash = ref (hash text m) in
    let result = ref (-1) in
    let i = ref 0 in
    while !result = -1 && !i <= n - m do
      if !text_hash = pattern_hash && String.sub text !i m = pattern then result := !i
      else begin
        if !i < n - m then
          text_hash :=
            ((!text_hash - Char.code text.[!i] * !high_order) * base + Char.code text.[!i + m])
            mod modulus;
        if !text_hash < 0 then text_hash := !text_hash + modulus
      end;
      incr i
    done;
    !result

let () = print_int (rabin_karp "abxabcabcaby" "abcaby"); print_newline ()

let fletcher16 s =
  let s1 = ref 0 and s2 = ref 0 in
  String.iter
    (fun c ->
      s1 := (!s1 + Char.code c) mod 255;
      s2 := (!s2 + !s1) mod 255)
    s;
  (!s2 lsl 8) lor !s1

let () = Printf.printf "%x\n" (fletcher16 "abcde")

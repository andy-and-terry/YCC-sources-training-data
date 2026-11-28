let mod_inverse a m =
  let rec go x = if a * x mod m = 1 then x else go (x + 1) in
  go 1

let affine s a b decrypt =
  let inv = mod_inverse a 26 in
  String.map
    (fun ch ->
      if ch >= 'A' && ch <= 'Z' then
        let x = Char.code ch - 65 in
        let y = if decrypt then (((inv * (x - b)) mod 26) + 26) mod 26 else (a * x + b) mod 26 in
        Char.chr (y + 65)
      else ch)
    s

let () =
  let c = affine "AFFINE" 5 8 false in
  Printf.printf "%s %s\n" c (affine c 5 8 true)

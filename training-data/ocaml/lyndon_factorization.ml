let duval s =
  let n = String.length s in
  let out = ref [] and i = ref 0 in
  while !i < n do
    let j = ref (!i + 1) and k = ref !i in
    while !j < n && s.[!k] <= s.[!j] do
      k := if s.[!k] < s.[!j] then !i else !k + 1;
      incr j
    done;
    while !i <= !k do
      out := String.sub s !i (!j - !k) :: !out;
      i := !i + (!j - !k)
    done
  done;
  List.rev !out

let () = List.iter print_endline (duval "banana")

let build_lps pattern =
  let n = String.length pattern in
  let lps = Array.make n 0 in
  let len = ref 0 in
  let i = ref 1 in
  while !i < n do
    if pattern.[!i] = pattern.[!len] then (
      incr len;
      lps.(!i) <- !len;
      incr i)
    else if !len <> 0 then len := lps.(!len - 1)
    else (
      lps.(!i) <- 0;
      incr i)
  done;
  lps

let kmp_search text pattern =
  let lps = build_lps pattern in
  let n = String.length text in
  let m = String.length pattern in
  let i = ref 0 in
  let j = ref 0 in
  let result = ref (-1) in
  while !i < n && !result = -1 do
    if text.[!i] = pattern.[!j] then (
      incr i;
      incr j;
      if !j = m then result := !i - !j)
    else if !j > 0 then j := lps.(!j - 1)
    else incr i
  done;
  !result

let () = print_int (kmp_search "abxabcabcaby" "abcaby"); print_newline ()

let lcs a b =
  let m = String.length a and n = String.length b in
  let dp = Array.make_matrix (m + 1) (n + 1) 0 in
  for i = 1 to m do
    for j = 1 to n do
      if a.[i - 1] = b.[j - 1] then dp.(i).(j) <- dp.(i - 1).(j - 1) + 1
      else dp.(i).(j) <- max dp.(i - 1).(j) dp.(i).(j - 1)
    done
  done;
  let buf = Buffer.create dp.(m).(n) in
  let i = ref m and j = ref n in
  while !i > 0 && !j > 0 do
    if a.[!i - 1] = b.[!j - 1] then (
      Buffer.add_char buf a.[!i - 1];
      decr i;
      decr j)
    else if dp.(!i - 1).(!j) >= dp.(!i).(!j - 1) then decr i
    else decr j
  done;
  let chars = Buffer.contents buf in
  let len = String.length chars in
  String.init len (fun k -> chars.[len - 1 - k])

let () =
  let result = lcs "ABCBDAB" "BDCABA" in
  Printf.printf "%s (length %d)\n" result (String.length result)

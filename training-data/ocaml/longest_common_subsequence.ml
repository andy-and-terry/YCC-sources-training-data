let lcs a b =
  let n = String.length a in
  let m = String.length b in
  let dp = Array.make_matrix (n + 1) (m + 1) 0 in
  for i = 1 to n do
    for j = 1 to m do
      if a.[i - 1] = b.[j - 1] then dp.(i).(j) <- dp.(i - 1).(j - 1) + 1
      else dp.(i).(j) <- max dp.(i - 1).(j) dp.(i).(j - 1)
    done
  done;
  dp.(n).(m)

let () =
  Printf.printf "%d\n" (lcs "abcde" "ace");
  Printf.printf "%d\n" (lcs "abc" "abc");
  Printf.printf "%d\n" (lcs "abc" "def")

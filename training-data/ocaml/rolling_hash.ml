let () =
  let s = "abcabc" and k = 3 in
  for i = 0 to String.length s - k do
    let h = ref 0 in
    for j = i to i + k - 1 do
      h := (!h * 31 + Char.code s.[j]) mod 1000003
    done;
    Printf.printf "%d %d\n" i !h
  done

let word_break s dict =
  let n = String.length s in
  let dp = Array.make (n + 1) false in
  dp.(0) <- true;
  for i = 1 to n do
    for j = 0 to i - 1 do
      if dp.(j) && List.mem (String.sub s j (i - j)) dict then dp.(i) <- true
    done
  done;
  dp.(n)

let () =
  let dict = [ "leet"; "code" ] in
  Printf.printf "%b\n" (word_break "leetcode" dict);
  Printf.printf "%b\n" (word_break "leetcodex" dict)

(* dp.(i) is true when s.[0 .. i) can be split into dictionary words. *)
let word_break s dict =
  let n = String.length s in
  let dp = Array.make (n + 1) false in
  dp.(0) <- true;
  for i = 1 to n do
    for j = 0 to i - 1 do
      if (not dp.(i)) && dp.(j) && List.mem (String.sub s j (i - j)) dict then dp.(i) <- true
    done
  done;
  dp.(n)

let () =
  Printf.printf "%b\n" (word_break "leetcode" [ "leet"; "code" ]);
  Printf.printf "%b\n" (word_break "applepenapple" [ "apple"; "pen" ]);
  Printf.printf "%b\n" (word_break "catsandog" [ "cats"; "dog"; "sand"; "and"; "cat" ])

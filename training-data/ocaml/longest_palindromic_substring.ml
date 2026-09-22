let expand_from_center s l r =
  let l = ref l and r = ref r in
  let n = String.length s in
  while !l >= 0 && !r < n && s.[!l] = s.[!r] do
    decr l;
    incr r
  done;
  !r - !l - 1

let longest_palindrome s =
  let n = String.length s in
  if n = 0 then ""
  else begin
    let start = ref 0 and max_len = ref 1 in
    for i = 0 to n - 1 do
      let len1 = expand_from_center s i i in
      let len2 = expand_from_center s i (i + 1) in
      let len = max len1 len2 in
      if len > !max_len then begin
        max_len := len;
        start := i - ((len - 1) / 2)
      end
    done;
    String.sub s !start !max_len
  end

let () =
  print_endline (longest_palindrome "babad");
  print_endline (longest_palindrome "cbbd")

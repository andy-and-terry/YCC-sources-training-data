let
  encode = chars:
    if chars == [ ] then [ ]
    else
      let
        head = builtins.head chars;
        countRun = list: c:
          if list == [ ] || builtins.head list != c then 0
          else 1 + countRun (builtins.tail list) c;
        n = countRun chars head;
        rest = builtins.genList (i: builtins.elemAt chars (i + n)) (builtins.length chars - n);
      in
        [ { char = head; count = n; } ] ++ encode rest;

  decode = runs:
    if runs == [ ] then ""
    else
      let
        r = builtins.head runs;
        piece = builtins.concatStringsSep "" (builtins.genList (i: r.char) r.count);
      in
        piece + decode (builtins.tail runs);
in
{
  encoded = encode [ "a" "a" "a" "b" "b" "c" "a" "a" ];
  roundTrip = decode (encode [ "a" "a" "a" "b" "b" "c" "a" "a" ]);
}

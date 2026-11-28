\ polynomial hash of 3-char windows of "abcabc"
: hash3 ( addr -- h )
  0 3 0 do over i + c@ swap 31 * + 1000003 mod loop nip ;

s" abcabc" drop
4 0 do dup i + hash3 . loop drop cr

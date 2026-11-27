: FLETCHER16 ( addr len -- n )
  0 0 { s1 s2 }
  0 DO
    DUP I + C@ s1 + 255 MOD TO s1
    s2 s1 + 255 MOD TO s2
  LOOP
  DROP
  s2 256 * s1 + ;

S" abcde" FLETCHER16 HEX . DECIMAL CR

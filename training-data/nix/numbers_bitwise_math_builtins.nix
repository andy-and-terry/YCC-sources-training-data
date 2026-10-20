{
  int = 7 / 2;
  float = 7.0 / 2;
  neg = -7 / 2;
  mod' = builtins.bitAnd 12 10;
  or' = builtins.bitOr 12 10;
  xor' = builtins.bitXor 12 10;
  mul = 6 * 7;
  floor = builtins.floor 2.7;
  ceil = builtins.ceil 2.1;
  lt = 1 < 2;
  eq = 1 == 1.0;
  and' = true && false;
  or2 = true || false;
  impl = false -> true;
  neg2 = !true;
  max = builtins.foldl' (a: b: if a > b then a else b) 0 [ 3 9 4 ];
  isInt = builtins.isInt 3;
  isFloat = builtins.isFloat 3.0;
  typeOf = map builtins.typeOf [ 1 1.5 "s" true null [ ] { } (x: x) ./. ];
  toStr = toString 42;
  parse = builtins.fromJSON "3.5";
  lessThan = builtins.lessThan 1 2;
  sub = builtins.sub 10 3;
  div = builtins.div 10 4;
}

{
  kinds = map builtins.typeOf [ 1 1.5 "s" true null [ ] { } (x: x) ./. ];
  isInt = builtins.isInt 3;
  isStr = builtins.isString "x";
  isFn = builtins.isFunction (x: x);
  isAttrs = builtins.isAttrs { };
}

let
  # a -> b is false only when a is true and b is false
  implies = a: b: a -> b;
in
  {
    t_t = implies true true;
    t_f = implies true false;
    f_t = implies false true;
    f_f = implies false false;
    validPort = port: (port != null) -> (port > 0 && port < 65536);
    check = (let v = 8080; in (v != null) -> (v > 0));
  }

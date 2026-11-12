let enableDebug = true; in {
  flags = [ "-O2" ] ++ (if enableDebug then [ "-g" ] else []);
  pkg = { name = "x"; } // (if enableDebug then { debug = true; } else {});
}

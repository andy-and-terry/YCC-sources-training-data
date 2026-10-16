let
  defaults = { port = 80; host = "0.0.0.0"; tls = { enable = false; cert = null; }; };
  override = { port = 8443; tls.enable = true; };
  merge = a: b: a // b // { tls = a.tls // (b.tls or { }); };
in
merge defaults override

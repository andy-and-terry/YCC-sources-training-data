let
  toKV = attrs: builtins.concatStringsSep "\n" (map (n: "${n}=${toString attrs.${n}}") (builtins.attrNames attrs));
  toIni = sections: builtins.concatStringsSep "\n" (map (s: "[${s}]\n${toKV sections.${s}}") (builtins.attrNames sections));
  indent = n: s: let pad = builtins.concatStringsSep "" (builtins.genList (_: " ") n); in pad + s;
  quote = s: "\"${s}\"";
in {
  kv = toKV { port = 80; host = "h"; };
  ini = toIni { server = { port = 80; }; client = { retries = 3; }; };
  json = builtins.toJSON { list = [ 1 2 3 ]; nested = { ok = true; }; s = "str"; };
  roundTrip = (builtins.fromJSON (builtins.toJSON { a = [ 1 { b = 2; } ]; })).a;
  indented = indent 4 "text";
  quoted = quote "hi";
  xmlish = "<a b=${quote "c"}>${toString 1}</a>";
}

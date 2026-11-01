let
  mk = { name, version ? "0.1", extra ? { }, ... }: {
    inherit name version;
    id = "${name}@${version}";
  } // extra;
in [
  (mk { name = "a"; })
  (mk { name = "b"; version = "2.0"; extra.flag = true; })
]

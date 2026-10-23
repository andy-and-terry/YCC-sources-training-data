let
  # builtins.hashString takes an algorithm name and a string and
  # returns the digest as lowercase hex.
  md5 = builtins.hashString "md5" "hello";
  sha1 = builtins.hashString "sha1" "hello";
  sha256 = builtins.hashString "sha256" "hello";

  # hashes are deterministic, so they make handy cache keys.
  keyFor = name: version: builtins.substring 0 8 (builtins.hashString "sha256" "${name}-${version}");
in
  {
    inherit md5 sha1 sha256;
    sha256Length = builtins.stringLength sha256;
    sameInput = builtins.hashString "md5" "hello" == md5;
    cacheKey = keyFor "hello" "2.12";
  }

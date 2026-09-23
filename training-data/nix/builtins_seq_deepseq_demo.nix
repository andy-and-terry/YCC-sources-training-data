let
  # `builtins.seq a b` forces `a` to weak-head normal form before
  # returning `b`, and `builtins.deepSeq a b` forces `a` fully
  # (recursing into lists and attrsets) before returning `b` — both are
  # ways to opt in to strictness in an otherwise lazy language.
  loud = msg: value: builtins.trace msg value;

  lazyAttrs = { a = loud "forcing a" 1; b = loud "forcing b" 2; };

  # `seq` only forces the attrset itself, not its lazy values, so
  # neither trace fires yet.
  shallow = builtins.seq lazyAttrs "shallow done";

  # `deepSeq` walks into every value, so both traces fire before the
  # result is produced.
  deep = builtins.deepSeq lazyAttrs "deep done";
in
  {
    inherit shallow deep;
  }

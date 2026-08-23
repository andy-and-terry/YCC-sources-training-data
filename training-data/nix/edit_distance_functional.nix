let
  editDistance = a: b:
    let
      aLen = builtins.stringLength a;
      bLen = builtins.stringLength b;
    in
      if aLen == 0 then bLen
      else if bLen == 0 then aLen
      else
        let
          aLast = builtins.substring (aLen - 1) 1 a;
          bLast = builtins.substring (bLen - 1) 1 b;
          aRest = builtins.substring 0 (aLen - 1) a;
          bRest = builtins.substring 0 (bLen - 1) b;
        in
          if aLast == bLast then editDistance aRest bRest
          else
            1 + (let
              opts = [ (editDistance aRest b) (editDistance a bRest) (editDistance aRest bRest) ];
            in
              builtins.foldl' (x: y: if x < y then x else y) (builtins.head opts) opts);
in
  editDistance "kitten" "sitting"

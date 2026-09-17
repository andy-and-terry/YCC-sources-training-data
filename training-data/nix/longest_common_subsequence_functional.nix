let
  lcs = a: b:
    let
      aLen = builtins.stringLength a;
      bLen = builtins.stringLength b;
    in
      if aLen == 0 || bLen == 0 then ""
      else
        let
          aLast = builtins.substring (aLen - 1) 1 a;
          bLast = builtins.substring (bLen - 1) 1 b;
          aRest = builtins.substring 0 (aLen - 1) a;
          bRest = builtins.substring 0 (bLen - 1) b;
        in
          if aLast == bLast then lcs aRest bRest + aLast
          else
            let
              withoutA = lcs aRest b;
              withoutB = lcs a bRest;
            in
              if builtins.stringLength withoutA >= builtins.stringLength withoutB
              then withoutA
              else withoutB;

  result = lcs "ABCBDAB" "BDCABA";
in
  {
    inherit result;
    length = builtins.stringLength result;
  }

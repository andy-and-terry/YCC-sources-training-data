program JaccardSimilarity;

type
  TSet = set of 0..9;

var
  a, b: TSet;
  i, inter, uni: Integer;
begin
  a := [1, 2, 3, 4];
  b := [3, 4, 5];
  inter := 0;
  uni := 0;
  for i := 0 to 9 do
  begin
    if (i in a) and (i in b) then Inc(inter);
    if (i in a) or (i in b) then Inc(uni);
  end;
  WriteLn(inter / uni:0:2);
end.

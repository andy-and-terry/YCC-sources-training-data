program StringListSortJoin;
{$mode objfpc}{$H+}
uses Classes;
var
  L: TStringList;
  I: Integer;
begin
  L := TStringList.Create;
  try
    L.Add('pear'); L.Add('apple'); L.Add('fig');
    L.Sort;
    for I := 0 to L.Count - 1 do WriteLn(L[I]);
    WriteLn(L.CommaText);
  finally
    L.Free;
  end;
end.

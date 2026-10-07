program StringBuilderDemo;

uses SysUtils, Classes;

var
  list: TStringList;
  i: Integer;
begin
  list := TStringList.Create;
  try
    for i := 1 to 5 do
      list.Add('item' + IntToStr(i));
    list.Delimiter := ';';
    list.StrictDelimiter := True;
    WriteLn(list.DelimitedText);
    list.Sort;
    list.Delete(0);
    WriteLn(list.Count, ' left, first=', list[0]);
    WriteLn(list.IndexOf('item3'));
  finally
    list.Free;
  end;
end.

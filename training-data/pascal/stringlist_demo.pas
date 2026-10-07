program StringListDemo;

uses Classes;

var
  sl: TStringList;
  i: Integer;
begin
  sl := TStringList.Create;
  try
    sl.Add('pear');
    sl.Add('apple');
    sl.Add('fig');
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      WriteLn(i, ': ', sl[i]);
    WriteLn(sl.IndexOf('fig'));
    sl.Delimiter := ',';
    WriteLn(sl.DelimitedText);
  finally
    sl.Free;
  end;
end.

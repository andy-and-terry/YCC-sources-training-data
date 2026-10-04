{$mode objfpc}{$H+}
program StringListDemo;

uses Classes, SysUtils;

var
  list: TStringList;
  i: Integer;
begin
  list := TStringList.Create;
  try
    list.Add('pear');
    list.Add('apple');
    list.Add('fig');
    list.Add('banana');
    list.Sorted := True;
    for i := 0 to list.Count - 1 do
      WriteLn(i, ': ', list[i]);
    WriteLn('index of fig: ', list.IndexOf('fig'));
    list.Delete(0);
    list.CommaText := 'a,b,"c d",e';
    WriteLn('count: ', list.Count, ' third: ', list[2]);
    list.Delimiter := ';';
    WriteLn(list.DelimitedText);
  finally
    list.Free;
  end;
end.

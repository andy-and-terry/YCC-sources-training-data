program ReverseWords;
{$mode objfpc}{$H+}
uses SysUtils, Classes;
var
  parts: TStringList;
  i: Integer;
  res: string;
begin
  parts := TStringList.Create;
  try
    parts.Delimiter := ' ';
    parts.StrictDelimiter := True;
    parts.DelimitedText := 'the quick brown fox';
    res := '';
    for i := parts.Count - 1 downto 0 do
    begin
      if res <> '' then res := res + ' ';
      res := res + parts[i];
    end;
    WriteLn(res);
  finally
    parts.Free;
  end;
end.

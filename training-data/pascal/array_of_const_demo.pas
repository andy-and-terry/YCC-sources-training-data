{$mode objfpc}{$H+}
program ArrayOfConstDemo;

uses SysUtils;

procedure DescribeAll(const items: array of const);
var
  i: Integer;
begin
  for i := 0 to High(items) do
    case items[i].VType of
      vtInteger:    WriteLn(i, ': integer ', items[i].VInteger);
      vtBoolean:    WriteLn(i, ': boolean ', items[i].VBoolean);
      vtChar:       WriteLn(i, ': char ', items[i].VChar);
      vtExtended:   WriteLn(i, ': real ', items[i].VExtended^:0:2);
      vtString:     WriteLn(i, ': shortstring ', items[i].VString^);
      vtAnsiString: WriteLn(i, ': string ', AnsiString(items[i].VAnsiString));
    else
      WriteLn(i, ': other type ', items[i].VType);
    end;
end;

begin
  DescribeAll([42, True, 'x', 3.14159, 'text']);
  WriteLn(Format('%s has %d items costing %.2f', ['cart', 3, 9.5]));
end.

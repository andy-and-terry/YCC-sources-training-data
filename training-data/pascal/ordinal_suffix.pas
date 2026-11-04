program OrdinalSuffix;
uses SysUtils;

function Ordinal(n: Integer): string;
var r100: Integer; suffix: string;
begin
  r100 := n mod 100;
  if (r100 >= 11) and (r100 <= 13) then suffix := 'th'
  else
    case n mod 10 of
      1: suffix := 'st';
      2: suffix := 'nd';
      3: suffix := 'rd';
    else suffix := 'th';
    end;
  Result := IntToStr(n) + suffix;
end;

var n: Integer;
begin
  for n in [1, 2, 3, 4, 11, 12, 13, 21, 101, 111] do Write(Ordinal(n), ' ');
  WriteLn;
end.

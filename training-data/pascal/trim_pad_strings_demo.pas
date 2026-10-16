program TrimPadStringsDemo;

uses SysUtils;

function PadLeft(const s: string; width: Integer; fill: Char): string;
begin
  Result := s;
  while Length(Result) < width do
    Result := fill + Result;
end;

function PadRight(const s: string; width: Integer; fill: Char): string;
begin
  Result := s;
  while Length(Result) < width do
    Result := Result + fill;
end;

begin
  WriteLn('[', Trim('   spaced   '), ']');
  WriteLn('[', TrimLeft('   spaced   '), ']');
  WriteLn('[', TrimRight('   spaced   '), ']');
  WriteLn(PadLeft('42', 6, '0'));
  WriteLn(PadRight('ab', 6, '.'), '|');
  WriteLn(IntToStr(7):5, '|', IntToStr(7):-5, '|');
end.

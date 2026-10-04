{$mode objfpc}{$H+}
program OverloadDefaultParamsDemo;

uses SysUtils;

function Describe(n: Integer): string; overload;
begin
  Result := 'integer ' + IntToStr(n);
end;

function Describe(s: string): string; overload;
begin
  Result := 'string "' + s + '"';
end;

function Describe(x: Double): string; overload;
begin
  Result := 'float ' + FloatToStr(x);
end;

function Describe(a, b: Integer): string; overload;
begin
  Result := 'pair ' + IntToStr(a) + ',' + IntToStr(b);
end;

procedure Box(const text: string; width: Integer = 20; fill: Char = '*');
begin
  WriteLn(StringOfChar(fill, width));
  WriteLn(text);
  WriteLn(StringOfChar(fill, width));
end;

begin
  WriteLn(Describe(42));
  WriteLn(Describe('hi'));
  WriteLn(Describe(2.5));
  WriteLn(Describe(3, 4));
  Box('default box');
  Box('narrow', 8);
  Box('custom', 12, '#');
end.
